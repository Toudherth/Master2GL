package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.naming.AuthenticationException;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @PostMapping("/add")
    public ResponseEntity<?> addUser(@RequestBody User user) {
        logger.info("Request to add a new user: {}", user);
        try {
            User savedUser = userService.addUser(user);
            return ResponseEntity.ok(savedUser);
        } catch (Exception e) {
            logger.error("Failed to add user: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        }
    }

    @PostMapping("/authenticate")
    public ResponseEntity<User> authenticateUser(@RequestBody Map<String, String> credentials) {
        String email = credentials.get("email");
        String password = credentials.get("password");
        logger.info("Requête d'authentification pour l'utilisateur avec l'email: {}", email);
        try {
            User authenticatedUser = userService.authenticateUser(email, password);
            return ResponseEntity.ok(authenticatedUser);
        } catch (Exception e) {
            logger.error("Échec de l'authentification pour l'email: {}", email);
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }
}
