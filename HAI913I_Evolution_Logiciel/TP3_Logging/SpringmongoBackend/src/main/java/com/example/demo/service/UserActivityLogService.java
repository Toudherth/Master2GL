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


    private static final Logger logger = LoggerFactory.getLogger(UserActivityLogService.class);

    public void logUserActivity(String userId, String action) {
        logger.info("User ID: {} has performed the action: {}", userId, action);
        // Ici, vous pourriez également stocker l'activité dans MongoDB
        System.out.println("je suis dans les logs ");
        UserActivityLog log = new UserActivityLog();
        log.setUserId(userId);
        log.setAction(action);
        log.setTimestamp(LocalDateTime.now());
        System.out.println(log.getUserId());
        logRepository.save(log);
        System.out.println("save succes ");
    }
}