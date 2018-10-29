package com.appsecco.dvja.services;

import com.appsecco.dvja.models.User;

public class UserAuthenticationService {

    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public User authenticate(String login, String password) {
        User user;

        user = userService.findByLogin(login);
        if((user != null) && userService.checkPassword(user, password))
            return user;

        return null;
    }
}
