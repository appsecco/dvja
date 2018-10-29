package com.appsecco.dvja.controllers;

import com.appsecco.dvja.services.UserService;
import org.apache.commons.lang.StringUtils;

public class ResetPassword extends BaseController {

    private UserService userService;
    private String key;
    private String login;
    private String password;
    private String passwordConfirmation;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }

    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
    }

    public String requestResetPassword() {
        if(StringUtils.isEmpty(getLogin()))
            return INPUT;

        // Execute reset password request

        return SUCCESS;
    }

    public String execute() {
        if(StringUtils.isEmpty(getLogin()) || StringUtils.isEmpty(getKey()))
            addActionError("Login or key parameter missing");

        if(StringUtils.isEmpty(getLogin()) || StringUtils.isEmpty(getKey()) ||
                StringUtils.isEmpty(getPassword()) || StringUtils.isEmpty(getPasswordConfirmation()))
            return INPUT;

        boolean ret = false;

        try {
            ret = userService.resetPasswordByLogin(getLogin(), getKey(),
                    getPassword(), getPasswordConfirmation());
        }
        catch(Exception e) {
            addActionError("Exception ocurred: " + e.getMessage());
            return INPUT;
        }

        if(!ret) {
            addActionError("Error occurred while changing password");
            return INPUT;
        }

        return SUCCESS;
    }
}
