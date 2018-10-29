# Missing Function Level Access Control

The issue lies in _userList_ API implementation where the code does not correctly establish identity and capability for the calling user before fullfiling the request.

```java
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
```

The cookie based admin verification is inadequate as cookie values are obtained from untrusted user supplied data.

This issue can be easily exploited using `curl`.

```
$ curl -H "Cookie: admin=1" http://dvja:8080/api/userList
{"users":[{"id":"5","email":"","login":"user"},{"id":"12","email":"","login":"bilbo"},{"id":"15","email":"user@gmail.com","login":"user22"},{"id":"17","email":"user@gmail.com","login":"user1"}],"count":4}
```

## Solution

Implement appropriate authentication and authorization for every function that can be directly or indirectly called from external sources. Application designer or developer should not assume that a function which is not exposed directly will never be called.

In this specific case, the issue can be solved by validating if the calling user is authorized to invoke the API.

```java
if(! sessionGetUser().isAdmin())
    return NONE;
```



