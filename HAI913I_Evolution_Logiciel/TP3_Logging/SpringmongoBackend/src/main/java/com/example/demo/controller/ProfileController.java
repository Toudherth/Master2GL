package com.example.demo.controller;


import com.example.demo.entity.UserProfile;
import com.example.demo.service.AnalyseLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/profiles")
public class ProfileController {

    private final AnalyseLogService analyseLogService;

    @Autowired
    public ProfileController(AnalyseLogService analyseLogService) {
        this.analyseLogService = analyseLogService;
    }

    @GetMapping
    public ResponseEntity<List<UserProfile>> getAllUserProfiles() {
        List<UserProfile> profiles = new ArrayList<>(analyseLogService.calculateUserActions().values());

        // Trier les profils par le nombre total d'actions, de manière décroissante
        List<UserProfile> sortedProfiles = profiles.stream()
                .sorted(Comparator.comparing(UserProfile::getTotalActions).reversed())
                .collect(Collectors.toList());

        return ResponseEntity.ok(sortedProfiles);
    }
}
