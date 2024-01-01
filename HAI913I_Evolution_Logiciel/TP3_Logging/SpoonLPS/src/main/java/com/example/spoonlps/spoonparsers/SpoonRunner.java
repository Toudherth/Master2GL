package com.example.spoonlps.spoonparsers;

import com.example.spoonlps.spoonparsers.ReadLoggingProcessor;
import spoon.Launcher;
import spoon.reflect.CtModel;
import spoon.reflect.declaration.CtType;
import spoon.reflect.visitor.PrettyPrinter;
import spoon.support.JavaOutputProcessor;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class SpoonRunner {

    public static void main(String[] args) {

       // try {
            Launcher launcher = new Launcher();
            launcher.getEnvironment().setAutoImports(true); // Pour gérer automatiquement les imports
            launcher.getEnvironment().setCommentEnabled(true); // Pour conserver les commentaires
            launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src");
            launcher.addProcessor(new ReadLoggingProcessor());
            System.out.println(" je ssudi das le methode ");
           // launcher.setSourceOutputDirectory("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/"); // Spécifiez le chemin de sortie
            /*   launcher.run();

            System.out.println("Les fichiers sources modifiés ont été écrits dans " );
        } catch (Exception e) {
            e.printStackTrace();

*/
            launcher.run();

            CtModel model = launcher.getModel();
            CtType<?> productController = model.getAllTypes().stream()
                    .filter(ctType -> "ProductController".equals(ctType.getSimpleName()))
                    .findFirst()
                    .orElse(null);

            if (productController != null) {
                try (PrintWriter out = new PrintWriter("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/ProductController.java")) {
                    out.println(productController.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


/*
                    CtModel model = launcher.getModel();
                    File outputFile = new File("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/sortie.txt");
                    if (!outputFile.exists()) {
                        outputFile.createNewFile(); // Assurez-vous que le fichier existe
                    }

                    try (PrintWriter out = new PrintWriter(new FileWriter(outputFile, true))) {
                        for (CtType<?> type : model.getAllTypes()) {
                            if (type.getSimpleName().equals("ProductController")) { // Filtrez pour ProductController
                                PrettyPrinter prettyPrinter = launcher.getEnvironment().createPrettyPrinter();
                                //System.out.println(prettyPrinter);
                                String code = prettyPrinter.printElement(type);
                                System.out.println(code);
                                out.println(code);
                                out.println("-------------------------------------------------------");
                            }
                        }
                    }

                    System.out.println("Le fichier de sortie a été écrit avec succès.");

                } catch (Exception e) {
                    e.printStackTrace();
                }*/

    }

}
