package com.example.demo.service;


import com.example.demo.entity.UserProfile;
import com.example.demo.builder.UserProfileBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

@Service
public class AnalyseLogService {

    private Set<String> processedLogIds = new HashSet<>();

    private List<JSONObject> jsonread = new ArrayList<>();
    private List<JSONObject> jsonwrite = new ArrayList<>();
    private List<JSONObject> jsonprice = new ArrayList<>();

    public AnalyseLogService() throws IOException, ParseException {
        parseLogFile("logs/read.log", jsonread );
        parseLogFile("logs/write.log", jsonwrite);
        parseLogFile("logs/price.log", jsonprice);
    }

    private void parseLogFile(String fileName, List<JSONObject> jsonList) throws IOException, ParseException {
        String line;
        BufferedReader br = new BufferedReader(new FileReader(fileName));
        JSONParser parser = new JSONParser();

        while ((line = br.readLine()) != null) {
            JSONObject json = (JSONObject) parser.parse(line);
            jsonList.add(json);
        }
        br.close();
    }

    public Map<String, UserProfile> calculateUserActions() {
        Map<String, UserProfileBuilder> buildersMap = new HashMap<>();
        processLogs(jsonread, buildersMap, "read");
        processLogs(jsonwrite, buildersMap, "write");
        processLogs(jsonprice, buildersMap, "price");

        Map<String, UserProfile> userStatsMap = new HashMap<>();
        buildersMap.forEach((userId, builder) -> userStatsMap.put(userId, builder.build()));
        return userStatsMap;
    }

    private void processLogs(List<JSONObject> logs, Map<String, UserProfileBuilder> userStatsMap, String actionType) {
        for (JSONObject log : logs) {
            String timestamp = (String) log.get("timestamp");
            String userId = (String) log.get("UserID");
            String userName = (String) log.get("User");
            String message = (String) log.get("message");

            // Log unique ID
            String logId = timestamp + "_" + userId + "_" + message;
            if (!processedLogIds.contains(logId)) {
                processedLogIds.add(logId);

                userStatsMap.computeIfAbsent(userId, k -> new UserProfileBuilder().setUserId(userId).setUserName(userName))
                        .incrementActionCount(actionType);
            }
        }
    }



}
