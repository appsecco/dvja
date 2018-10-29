package com.appsecco.dvja.services;

import com.appsecco.dvja.models.Product;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.DigestUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class ProductService {
    private static final Logger logger = Logger.getLogger(ProductService.class);
    private EntityManager entityManager;

    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.entityManager = em;
    }
    public EntityManager getEntityManager() { return this.entityManager; }

    public void save(Product product) {
        logger.debug("Saving product with name: " + product.getName());

        if(product.getId() != null)
            entityManager.merge(product);
        else
            entityManager.persist(product);
    }

    public Product find(int id) {
        return entityManager.find(Product.class, id);
    }

    public List<Product> findAll() {
        Query query = entityManager.createQuery("SELECT p FROM Product p");
        List<Product> resultList = query.getResultList();

        return resultList;
    }

    public List<Product> findContainingName(String name) {
        Query query = entityManager.createQuery("SELECT p FROM Product p WHERE p.name LIKE '%" + name + "%'");
        List<Product> resultList = query.getResultList();

        return resultList;
    }
}
