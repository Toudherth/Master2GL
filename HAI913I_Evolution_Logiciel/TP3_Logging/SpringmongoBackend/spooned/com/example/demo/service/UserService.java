package com.example.demo.service;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.function.Supplier;
import javax.naming.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    public User addUser(User user) throws Exception {
        // logger.info("Adding a new user: {}", user);
        // Check if user already exists
        Optional<User> existingUser = userRepository.findByEmail(user.getEmail());
        if (existingUser.isPresent()) {
            // logger.error("User already exists with email: {}", user.getEmail());
            throw new Exception("User already exists with email: " + user.getEmail());
        }
        return userRepository.save(user);
    }

    public User authenticateUser(String email, String password) {
        // logger.trace("Authenticating user with email: {}", email);
        return userRepository.findByEmail(email).filter(( user) -> user.getPassword().equals(password)).orElseThrow(() -> {
            // logger.trace("Authentication failed for user with email: {}", email);
            try {
                throw new AuthenticationException("Invalid credentials");
            } catch (AuthenticationException e) {
                throw new RuntimeException(e);
            }
        });
    }
}