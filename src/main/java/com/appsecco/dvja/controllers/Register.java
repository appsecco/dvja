package com.appsecco.dvja.controllers;

import com.appsecco.dvja.models.User;
import com.appsecco.dvja.services.UserRegistrationService;
import org.apache.commons.lang.StringUtils;

public class Register extends BaseController {

    private String name;
    private String login;
    private String email;
    private String password;
    private String passwordConfirmation;

    private UserRegistrationService userRegistrationService;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
    }

    public UserRegistrationService getUserRegistrationService() {
        return userRegistrationService;
    }

    public void setUserRegistrationService(UserRegistrationService userRegistrationService) {
        this.userRegistrationService = userRegistrationService;
    }

    public void validate() {
        if(!getServletRequest().getMethod().equalsIgnoreCase("POST"))
            return;

        if(StringUtils.isEmpty(getName()))
            addFieldError("name", "Name is required");
        if(StringUtils.isEmpty(getLogin()))
            addFieldError("login", "Login is required");
        if(StringUtils.isEmpty(getPassword()))
            addFieldError("password", "Password is required");
        if(StringUtils.isEmpty(getPasswordConfirmation()))
            addFieldError("passwordConfirmation", "Password confirmation is required");
        if(!StringUtils.equals(getPassword(), getPasswordConfirmation()))
            addFieldError("password", "Password must match confirmation");
    }

    public String execute() {
        User user = null;

        try {
            user = userRegistrationService.register(getName(), getLogin(), getEmail(),
                    getPassword(), getPasswordConfirmation());
        }
        catch(Exception e) {
            addActionError("Error Occurred: " + e.getMessage());
        }

        if(user != null) {
            return SUCCESS;
        }

        return INPUT;
    }
}
