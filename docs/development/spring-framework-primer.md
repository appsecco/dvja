# Spring Framework Primer

In software engineering, dependency injection is a technique whereby one object supplies the dependencies of another object. A dependency is an object that can be used \(a service\). An injection is the passing of a dependency to a dependent object \(a client\) that would use it. The service is made part of the client's state. Passing the service to the client, rather than allowing a client to build or find the service, is the fundamental requirement of the pattern.

The Spring Framework is build on the fundamental idea of _Dependency Injection._ While there are various functionalities or components provided by the framework, at its core is an Object Manager that injects dependencies during object creation based on provided configuration.

> Inverse of Control Container and Dependency Injection Patter - Martin Fowler \[[URL](https://martinfowler.com/articles/injection.html)\]

## DVJA Usage

The Spring Framework is used in DVJA only for _Dependency Injection_. The Struts2 Spring Framework plugin is used so as to integrate the Spring Framework as part of Struts2 MVC dispatcher. This way, any configured dependency in Struts2 action will be handled by the Spring Framework and will be injected at runtime based on configuration.

The configuration file used by Spring Framework is located at:

```
./target/dvja-1.0-SNAPSHOT/WEB-INF/applicationContext.xml
```

By default the integration is set to use _AutoWiring _using name. This can be changed by adding following configuration in struts_.xml_ file:

```
<constant name="struts.objectFactory.spring.autoWire" value="type"/>
```

Dependencies are declared by name in _applicationContext.xml _file are as below:

```
<bean id="userAuthenticationService" class="com.appsecco.dvja.services.UserAuthenticationService">
    <property name="userService" ref="userService" />
</bean>
```

The above configuration tells the Spring Framework to inject any object declaration of name _userAuthenticationService _with an instance of _com.appsecco.dvja.services.UserAuthenticationService_. The Struts2 Spring Framework plugin ensures that all Struts2 actions are processed by the Spring Framework during instantiation and configured dependencies are injected accordingly.



## References

* [https://en.wikipedia.org/wiki/Dependency\_injection](https://en.wikipedia.org/wiki/Dependency_injection)



