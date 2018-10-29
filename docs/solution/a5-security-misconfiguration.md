# Security Misconfiguration

The following URL triggers a _NULL Pointer Dereference_ exception:

```
http://dvja:8080/api/ping?login=john.doe
```

The issue occurs due to failure to validate null record for non-existing user login in the following code block in _ApiAction.java_

```java
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
```

Additionally the issue occurs due to insecure _struts2_ configuration that shows all error messages.

## Solution

This particular issue can be solved by implementing appropriate exception handler or checking for _NullPointer _before dereferencing the _user_ object. However a more elaborate fix will be to ensure that debugging information is turned off in production environment. This can be done by setting the following configuration in _struts.xml_ file:

```xml
<constant name="struts.devMode" value="false"/>
```



