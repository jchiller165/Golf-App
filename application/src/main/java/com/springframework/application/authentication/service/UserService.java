package com.springframework.application.authentication.service;

import com.springframework.application.authentication.model.User;


public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
