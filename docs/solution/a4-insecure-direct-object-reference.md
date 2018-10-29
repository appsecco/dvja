# Insecure Direct Object Reference

An Insecure Direct Object Reference \(IDOR\) vulnerability exists in _EditUser_ functionality. Particularly in _UserAction.java_, the _editUser_ method fails to validate _userId_ parameter to ensure that the calling user has appropriate access to the object. This issue can be exploited to reset information for any user identified by userId.

```java
user = userService.find(getUserId());
user.setPassword(getPassword());
user.setId(getUserId());
userService.save(user);
```

An example HTTP request such as below can be used to exploit this issue:

```bash
$ curl 'http://dvja:8080/editUser.action' \
-XPOST \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'Upgrade-Insecure-Requests: 1' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
--data 'userId=16&email=user@email.com&password=password&passwordConfirmation=password'
```

## Solution

Any request that results in access to any system object must be duly validated and authorized before granting access. In case of identifier based object access, consider user supplied identifiers as untrusted. Appropriate scoped query must be used in order to prevent IDOR vulnerabilities.

