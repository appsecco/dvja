# Unvalidated Redirects and Forwards

The application fails to perform any validation before redirecting user to external URL based on untrusted user supplied data in _RedirectAction.java_

```java
public String execute() {
    if(!StringUtils.isEmpty(getUrl()))
        return "redirect";

    return renderText("Missing url");
}
```

An attacker can exploit this vulnerability using an URL such as below:

```
http://dvja:8080/redirect.action?url=http://mail.yahoo.com
```

## Solution

As a best practice, ensure that the application redirects to internal \(local\) resources only. External redirection should be limited to trusted URLs only. An example validation to restrict redirection to local resources only is provided below:

```java
if(! getUrl().startsWith("/"))
    return renderText("External URL redirection not supported");
```



