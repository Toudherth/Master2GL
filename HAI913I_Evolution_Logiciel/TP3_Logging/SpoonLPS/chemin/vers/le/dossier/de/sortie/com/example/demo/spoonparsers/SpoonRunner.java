package com.example.demo.spoonparsers;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import spoon.Launcher;
import spoon.reflect.CtModel;
import spoon.reflect.declaration.CtType;
import spoon.reflect.visitor.PrettyPrinter;
public class SpoonRunner {
    public static void main(String[] args) {
        Launcher launcher = new Launcher();
        launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src");
        System.out.println(" je suis passer ");
        launcher.addProcessor(new ReadLoggingProcessor());
        launcher.run();
        // le fichier de resultat
        CtModel model = launcher.getModel();
        File outputFile = new File("resources/sortie.txt");
        try (PrintWriter out = new PrintWriter(new FileWriter(outputFile))) {
            for (CtType<?> type : model.getAllTypes()) {
                // Utilisez PrettyPrinter pour obtenir une représentation sous forme de chaîne du code source
                PrettyPrinter prettyPrinter = launcher.getEnvironment().createPrettyPrinter();
                String code = prettyPrinter.printElement(type);
                out.println(code);
                out.println("-------------------------------------------------------");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}