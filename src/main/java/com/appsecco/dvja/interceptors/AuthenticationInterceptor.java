package com.appsecco.dvja.interceptors;

import com.appsecco.dvja.Constant;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;

public class AuthenticationInterceptor implements Interceptor {
    @Override
    public void destroy() { }
    @Override
    public void init() { }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map<String, Object> session = actionInvocation.getInvocationContext().getSession();

        if(session.get(Constant.SESSION_USER_HANDLE) != null)
            return actionInvocation.invoke();
        else
            return "login";
    }
}
