package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.naming.AuthenticationException;
import java.util.Optional;

@Service
public class UserService {


    @Autowired
    private UserRepository userRepository;

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    public User addUser(User user) throws Exception {
        //logger.info("Adding a new user: {}", user);

        // Check if user already exists
        Optional<User> existingUser = userRepository.findByEmail(user.getEmail());
        if (existingUser.isPresent()) {
            throw new Exception("User already exists with email: " + user.getEmail());
        }

        return userRepository.save(user);
    }

    public User authenticateUser(String email, String password) {
        return userRepository.findByEmail(email)
                .filter(user -> user.getPassword().equals(password))
                .orElseThrow(() -> {
                    try {
                        throw new AuthenticationException("Invalid credentials");
                    } catch (AuthenticationException e) {
                        throw new RuntimeException(e);
                    }
                });
    }


    public void deconnexion() {
        this.userRepository = null;
    }

}
