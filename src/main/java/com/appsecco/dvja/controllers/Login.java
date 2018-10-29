package com.appsecco.dvja.controllers;

import com.appsecco.dvja.models.User;
import com.appsecco.dvja.services.UserAuthenticationService;
import org.apache.commons.lang.StringUtils;

public class Login extends BaseController {

    private UserAuthenticationService userAuthenticationService;

    private String login;
    private String password;

    public UserAuthenticationService getUserAuthenticationService() {
        return userAuthenticationService;
    }

    public void setUserAuthenticationService(UserAuthenticationService userAuthenticationService) {
        this.userAuthenticationService = userAuthenticationService;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String logout() {
        sessionRemoveUser();
        return SUCCESS;
    }

    public String execute() {
        User user;

        if(StringUtils.isEmpty(getLogin()) || StringUtils.isEmpty(getPassword()))
            return INPUT;

        if((user = userAuthenticationService.authenticate(getLogin(), getPassword())) != null) {
            sessionSetUser(user);
            return SUCCESS;
        }

        addActionError("Authentication failed!");
        return INPUT;
    }
}
