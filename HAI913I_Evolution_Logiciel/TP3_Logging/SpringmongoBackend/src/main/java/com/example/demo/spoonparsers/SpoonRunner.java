package com.example.demo.spoonparsers;

import spoon.Launcher;

public class SpoonRunner {

    public static void main(String[] args) {
        Launcher launcher = new Launcher();
        launcher.getEnvironment().setAutoImports(true);
        launcher.getEnvironment().setCommentEnabled(true); // Conserver les commentaires
        launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java/com/example/demo/controller");
        launcher.addProcessor(new LoggingProcessor());
        /** out put */
        launcher.setSourceOutputDirectory("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java");
        launcher.run();
    }
}

