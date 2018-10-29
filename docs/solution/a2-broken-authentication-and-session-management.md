# Broken Authentication and Session Management

## Insecure Reset Password

The _ResetPassword_ functionality can be triggered by visiting an URL such as below:

```
http://dvja:8080/resetPasswordExecute.action?login=john.doe&key=abba0b6ff456806bab66baed93e6d9c4
```

The trust establishment in reset password is inherently weak because the _login_ name and _key_ parameter required to execute the password reset is user supplied. Additionally the apparently random key is the MD5 hash of _login_ name which can be easily computed by an attacker.

This issue can be exploited by an attacker to reset any user's password by using an URL such as below:

```
http://dvja:8080/resetPasswordExecute.action?login=<username>&key=<md5(username)>
```

### Solution

* Implement a separate PasswordResetRequest service that persist a request in the database with appropriate expiry.
* Store reference to user record for which password should be changed in the PasswordResetRequest record
* Generate a random identifier for PasswordResetRequest record and allow this identifier as the only user supplied input during password reset. The system must fetch the other information required to execute the password reset from database.

## Insecure Credential Storage

The _UserService_ class responsible for managing _User_ entity uses weak hashing to store user password. This can be found in _UserService.java_ file:

```java
private String hashEncodePassword(String password) {
        return DigestUtils.md5DigestAsHex(password.getBytes());
}
```

The user password is hashed without an appropriate _salt_. Additionally MD5 is used as the hashing algorithm which is known to have multiple cryptographic weaknesses.

### Solution

Implement a salted password hashing mechanism using a cryptographically stronger hashing algorithm. This will ensure that plain text passwords are not available in case of a database compromise.



