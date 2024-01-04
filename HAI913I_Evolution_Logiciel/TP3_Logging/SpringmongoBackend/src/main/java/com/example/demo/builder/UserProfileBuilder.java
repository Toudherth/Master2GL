package com.example.demo.builder;

import com.example.demo.entity.UserProfile;

import java.util.HashMap;
import java.util.Map;

public class UserProfileBuilder {
    private String userName;
    private String userId;
    private Map<String, Integer> actionCounts = new HashMap<>();
    private int totalActions;

    public UserProfileBuilder setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public UserProfileBuilder setUserId(String userId) {
        this.userId = userId;
        return this;
    }

    public UserProfileBuilder incrementActionCount(String actionType) {
        this.actionCounts.put(actionType, this.actionCounts.getOrDefault(actionType, 0) + 1);
        return this;
    }

    public UserProfile build() {
        UserProfile userProfile = new UserProfile();
        userProfile.setUserName(userName);
        userProfile.setUserId(userId);
        userProfile.setActionCounts(actionCounts);
        userProfile.calculateTotalActions(); // Calcul du total des actions
        return userProfile;
    }
}
