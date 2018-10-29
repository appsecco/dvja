# Injection

## SQL Injection

There is an SQL Injection vulnerability in _UserSearch_ feature implemented in the following URL:

```
http://dvja:8080/userSearch.action
```

Injecting a single quote results in SQL error message. This confirms an SQL Injection vulnerability.

![](/assets/sqli.png)

The root cause of this vulnerability lies in unsafe use of SQL query in _UserService.java_

```java
Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.login = '" + login + "'");
List<User> resultList = query.getResultList();
```

### Solution

Clear separation between SQL code and data must be maintained in order to prevent SQL Injection vulnerabilities. Implement parameterized queries to allow the SQL client library to maintain separation between code and data. An appropriate implementation is as below:

```java
Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.login = :login").
                setParameter("login", login);
```

## Command Injection

A command injection vulnerability exists in the following URL:

```
http://dvja:8080/ping.action
```

![](/assets/cmdi.png)

The issue exists due to following vulnerable code in _PingAction.java_

```java
Runtime runtime = Runtime.getRuntime();
String[] command = { "/bin/bash", "-c", "ping -t 5 -c 5 " + getAddress() };
Process process = runtime.exec(command);
```

### Solution

Use _ProcessBuilder _to prepare and execute external shell commands securely. Example:

```java
ProcessBuilder pb = new ProcessBuilder("myCommand", "myArg1", "myArg2");
Process p = pb.start();
```



