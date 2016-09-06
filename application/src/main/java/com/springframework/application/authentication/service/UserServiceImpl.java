package com.springframework.application.authentication.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springframework.application.authentication.model.User;
import com.springframework.application.authentication.repo.RoleRepository;
import com.springframework.application.authentication.repo.UserRepository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

	@Override
	public ArrayList<User> findInstructors() {
		List<User> users = userRepository.findAll();
		ArrayList<User> instructors = new ArrayList<User>();
		for (User x : users) {
			if (x.getUserType().equals("Instructor") == true) {
				instructors.add(x);
				System.out.println(x);
			}
		}
		return instructors;
	}
   
}
