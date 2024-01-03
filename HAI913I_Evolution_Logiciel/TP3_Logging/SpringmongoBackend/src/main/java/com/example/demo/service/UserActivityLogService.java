package com.example.demo.service;

import com.example.demo.entity.UserActivityLog;
import com.example.demo.repository.UserActivityLogRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserActivityLogService {

    @Autowired
    private UserActivityLogRepository logRepository;

    public void logUserActivity(String userId, String action) {

        System.out.println("User ID: "+userId+" has performed the action:"+ action);
        // Ajouter les methodes a la bdd
        UserActivityLog log = new UserActivityLog();
        log.setUserId(userId);
        log.setAction(action);
        log.setTimestamp(LocalDateTime.now());
        logRepository.save(log);

    }
}