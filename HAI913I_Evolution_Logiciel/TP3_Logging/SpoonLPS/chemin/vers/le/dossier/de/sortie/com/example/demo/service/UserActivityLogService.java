package com.example.demo.service;
import com.example.demo.entity.UserActivityLog;
import com.example.demo.repository.UserActivityLogRepository;
import java.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserActivityLogService {
    @Autowired
    private UserActivityLogRepository logRepository;

    public void logUserActivity(String userId, String action) {
        UserActivityLog log = new UserActivityLog();
        log.setUserId(userId);
        log.setAction(action);
        log.setTimestamp(LocalDateTime.now());
        logRepository.save(log);
    }
}