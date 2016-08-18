package com.springframework.application.authentication.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
