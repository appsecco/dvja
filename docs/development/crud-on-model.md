# CRUD on Model

The application is developed following MVC pattern where data and business logic is handled at the model. For each entity that requires storage in DB, we define a _Model_ class which act as an _Entity_ that can be stored in the database. Additionally we define a _Service_ class which implements the actual storage and retreival operation for the entity.

## Implementing CRUD on User

To implement a CRUD operation on an entity, such as _User_, follow steps should be taken:

* Create POJO
* Implement UserService
* Create controller
* Create views

### POJO

The POJO representing an User object should be annotated correctly using JPA annotations so that the storage framework can map entity to appropriate record in the database:

```java
package com.appsecco.dvja.models;

import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;

import javax.persistence.*;
import java.util.Calendar;
import java.util.Date;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private String login;

    @Column(nullable = false)
    private String password;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="updated_at")
    private Date updatedAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @PrePersist
    @PreUpdate
    private void setTimestamps() {
        if(id == null)
            createdAt = new Date();
        updatedAt = new Date();
    }
}
```



