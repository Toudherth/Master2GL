package com.example.demo.repository;
import com.example.demo.entity.UserActivityLog;
import org.springframework.data.mongodb.repository.MongoRepository;
// Méthodes personnalisées si nécessaire
public interface UserActivityLogRepository extends MongoRepository<UserActivityLog, String> {}