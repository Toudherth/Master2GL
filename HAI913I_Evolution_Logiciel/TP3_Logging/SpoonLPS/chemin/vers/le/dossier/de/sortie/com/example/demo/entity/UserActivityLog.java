package com.example.demo.entity;
import java.time.LocalDateTime;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Document
public class UserActivityLog {
    private String userId;

    private String action;

    private LocalDateTime timestamp;
}