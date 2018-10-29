package com.appsecco.dvja.controllers;

import org.apache.commons.lang.StringUtils;

public class RedirectAction extends BaseController {

    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String execute() {
        if(!StringUtils.isEmpty(getUrl()))
            return "redirect";

        return renderText("Missing url");
    }

}
