# Sensitive Data Exposure

## Insecure Logging in Reset Password

The _resetPasswordByLogin_ method in `UserService.java` insecurely logs the password

```java
public boolean resetPasswordByLogin(String login, String key,
                                        String password, String passwordConfirmation) {

[...]

   logger.info("Changing password for login: " + login +
       " New password: " + password);

[...]

}
```

This is a security issue since confidential information such as user password is recorded in an insecure medium such as application log.

### Solution

* Do not log sensitive information such as credentials, payment information, cryptographic keys etc.



