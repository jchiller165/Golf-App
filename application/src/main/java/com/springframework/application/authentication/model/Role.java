package com.springframework.application.authentication.model;

import javax.persistence.*;
import java.util.Set;

//Model Class for the User Role which is used for the HSQL/JPA persistence.
@Entity//Declares this model as an Entity
@Table(name = "role")//Creates table role
public class Role {
    private Long id;
    private String name;
    private Set<User> users;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) //Auto Generates ID
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToMany(mappedBy = "roles")
    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
