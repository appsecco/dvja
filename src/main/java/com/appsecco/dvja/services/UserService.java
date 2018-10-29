package com.appsecco.dvja.services;

import com.appsecco.dvja.models.User;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.DigestUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class UserService {

    private static final Logger logger = Logger.getLogger(UserService.class);
    private EntityManager entityManager;

    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.entityManager = em;
    }
    public EntityManager getEntityManager() { return this.entityManager; }

    public void save(User user) {
        logger.debug("Saving user with login: " + user.getLogin() + " id: " + user.getId());

        if(user.getPassword() != null)
            user.setPassword(hashEncodePassword(user.getPassword()));

        if(user.getId() != null) {
            entityManager.merge(user);
        }
        else {
            entityManager.persist(user);
        }
    }

    public User find(int id) {
        return entityManager.find(User.class, id);
    }

    public boolean checkPassword(User user, String password) {
        if(user == null)
            return false;
        if(StringUtils.isEmpty(password))
            return false;

        return user.getPassword().equals(hashEncodePassword(password));
    }

    public List<User> findAllUsers() {
        Query query = entityManager.createQuery("SELECT u FROM User u");
        List<User> resultList = query.getResultList();

        return resultList;
    }

    public User findByLogin(String login) {
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.login = :login").
                setParameter("login", login).
                setMaxResults(1);
        List<User> resultList = query.getResultList();

        if(resultList.size() > 0)
            return resultList.get(0);
        else
            return null;
    }

    public User findByLoginUnsafe(String login) {
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.login = '" + login + "'");
        List<User> resultList = query.getResultList();

        if(resultList.size() > 0)
            return resultList.get(0);
        else
            return null;
    }

    public boolean resetPasswordByLogin(String login, String key,
                                        String password, String passwordConfirmation) {

        if(!StringUtils.equals(password, passwordConfirmation))
            return false;

        if(!StringUtils.equalsIgnoreCase(DigestUtils.md5DigestAsHex(login.getBytes()), key))
            return false;

        logger.info("Changing password for login: " + login +
                " New password: " + password);

        User user = findByLogin(login);
        if(user != null) {
            user.setPassword(password);
            save(user);

            return true;
        }

        logger.info("Failed to find user with login: " + login);
        return false;
    }

    private String hashEncodePassword(String password) {
        return DigestUtils.md5DigestAsHex(password.getBytes());
    }
}
