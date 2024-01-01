package com.example.demo.repository;

import com.example.demo.entity.UserActivityLog;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserActivityLogRepository extends MongoRepository<UserActivityLog, String> {
    // Méthodes personnalisées si nécessaire
}
