package com.springframework.application.authentication.repo;


import org.springframework.data.jpa.repository.JpaRepository;

import com.springframework.application.authentication.model.User;

//Uses JPA Repo and uses a User with its username
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
