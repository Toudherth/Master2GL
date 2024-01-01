package com.example.demo.spoonparsers;

import spoon.Launcher;
import spoon.reflect.CtModel;
import spoon.reflect.declaration.CtType;

import java.io.PrintWriter;


public class SpoonRunner {

    public static void main(String[] args) {
        
        

        Launcher launcher = new Launcher();
        launcher.getEnvironment().setAutoImports(true); // Gérer automatiquement les imports
        launcher.getEnvironment().setCommentEnabled(true); // Conserver les commentaires
        launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java/com/example/demo/controller");
        launcher.addProcessor(new LoggingProcessor());

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

        




    }

}
/*


  public class SpoonRunner {
      public static void main(String[] args) {
          Launcher launcher = new Launcher();
          launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src/main/java/com/example/demo");
 
          launcher.addProcessor(new LoggingProcessor());
          launcher.run();
      }
  }*/