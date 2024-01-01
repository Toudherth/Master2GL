package com.example.demo.spoonparsers;
import java.io.PrintWriter;
import java.util.function.Predicate;
import spoon.Launcher;
import spoon.reflect.CtModel;
import spoon.reflect.declaration.CtType;
public class SpoonRunner {
    public static void main(String[] args) {
        Launcher launcher = new Launcher();
        launcher.getEnvironment().setAutoImports(true);// Gérer automatiquement les imports

        launcher.getEnvironment().setCommentEnabled(true);// Conserver les commentaires

        launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src");
        launcher.addProcessor(new ReadLoggingProcessor());
        launcher.run();
        CtModel model = launcher.getModel();
        CtType<?> productController = model.getAllTypes().stream().filter(( ctType) -> "ProductController".equals(ctType.getSimpleName())).findFirst().orElse(null);
        if (productController != null) {
            try (PrintWriter out = new PrintWriter("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java/com/example/demo/controller/ProductController.java")) {
                out.println(productController.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /* Launcher launcher = new Launcher();
        // launcher.getEnvironment().setAutoImports(true); // Pour gérer automatiquement les imports
        launcher.getEnvironment().setCommentEnabled(true); // Pour conserver les commentaires
        launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src");
        launcher.addProcessor(new ReadLoggingProcessor());

        launcher.run();

        CtModel model = launcher.getModel();
        CtType<?> productController = model.getAllTypes().stream()
        .filter(ctType -> "ProductController".equals(ctType.getSimpleName()))
        .findFirst()
        .orElse(null);

        if (productController != null) {
        try (PrintWriter out = new PrintWriter("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java/com/example/demo/controller/ProductController.java")) {
        out.println(productController.toString());
        } catch (Exception e) {
        e.printStackTrace();
        }
        }
         */
    }
}/**
 * public class SpoonRunner {
 *     public static void main(String[] args) {
 *         Launcher launcher = new Launcher();
 *         launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java/com/example/demo");
 *
 *         launcher.addProcessor(new ReadLoggingProcessor());
 *         launcher.run();
 *     }
 * }
 */
