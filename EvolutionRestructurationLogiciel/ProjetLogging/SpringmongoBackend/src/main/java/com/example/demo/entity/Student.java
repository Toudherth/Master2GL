package com.example.demo.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Document(collection = "student")
public class Student {
    @Id
    private String _id;
    private String studentname;
    private String studentadresse;
    private String mobile;
    private byte[] studentImage; // Champ pour stocker l'image sous forme de tableau d'octets
    
    
}
