package com.appsecco.dvja.controllers;


import com.appsecco.dvja.models.User;
import com.appsecco.dvja.services.UserService;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.Cookie;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ApiAction extends BaseController {

    private UserService userService;
    private String login;

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

    public String adminShowUsers() {
        Map results = new HashMap();
        boolean isAdmin = false;

        for(Cookie c: getServletRequest().getCookies()) {
            if(c.getName().equals("admin") && c.getValue().equals("1")) {
                isAdmin = true;
                break;
            }
        }

        if(isAdmin) {
            List<Map<String, String>> userList = new ArrayList<Map<String,String>>();

            for(User u: userService.findAllUsers()) {
                Map<String, String> m = new HashMap<String, String>();

                m.put("id", Integer.toString(u.getId()));
                m.put("login", u.getLogin());
                m.put("email", u.getEmail());
                m.put("role", u.getRole());

                userList.add(m);
            }

            results.put("count", userList.size());
            results.put("users", userList);
        }

        return renderJSON(results);
    }

    public String ping() {
        Map<String, String> results = new HashMap<String, String>();

        if(StringUtils.isEmpty(getLogin())) {
            results.put("error", "Login not set");
            return renderJSON(results);
        }

        User user = userService.findByLogin(getLogin());

        results.put("login", getLogin());
        results.put("present", "true");
        results.put("email", user.getEmail());

        return renderJSON(results);
    }
}
