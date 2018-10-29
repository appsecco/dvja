# Damn Vulnerable Java Application

The objective of this project is to develop an intentionally web application using Java as a technology and popular libraries for Java web application development such as Struts2, Spring, Hibernate etc. This web application will be primarily used for the following purpose:

* An example to demonstrate OWASP Top 10 vulnerabilities
* Hands-on exercise on fixing OWASP Top 10 vulnerabilities

## Requirements

* Java 1.7+
* Maven 3.x
* IntelliJ Community Edition 2017
* MySQL Server
* MySQL Workbench \(Optional: For DB administration\)

## Deployment

### Acquire Source

```
git clone git@bitbucket.org:appsecco/dvja-webapp.git dvja
```

### Database Configuration

Configure MySQL database and set the credentials in:

```
./src/main/webapp/WEB-INF/applicationContext.xml
```

### Load Database Schema

```
mysql -u root dvja < ./db/schema.sql
```

### Build

```
$ mvn clean package
```

This will create the deployable _war_ file in _targets_ directory. This war can be deployed using a application container such as Tomcat.

### Run in Embedded Jetty

The DVJA application can be run using its embedded Jetty application server

```
$ mvn jetty:run
```



