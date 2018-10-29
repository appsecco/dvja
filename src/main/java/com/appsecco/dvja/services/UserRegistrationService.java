package com.appsecco.dvja.services;

import com.appsecco.dvja.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class UserRegistrationService {

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public UserService getUserService() {
        return userService;
    }

    public User register(String name, String login, String email,
                         String password, String passwordConfirmation)
    {
        User user;

        if(password == null)
            return null;
        if(!password.equals(passwordConfirmation))
            return null;

        user = new User();
        user.setName(name);
        user.setLogin(login);
        user.setPassword(password);
        user.setEmail(email);

        userService.save(user);
        return user;
    }
}
