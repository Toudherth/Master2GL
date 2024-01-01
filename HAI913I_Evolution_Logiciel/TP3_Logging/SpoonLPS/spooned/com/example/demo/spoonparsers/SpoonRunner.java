package com.example.demo.spoonparsers;
public class SpoonRunner {
    public static void main(java.lang.String[] args) {
        spoon.Launcher launcher = new spoon.Launcher();
        launcher.addInputResource("/home/toudherth/Master2GL/HAI913I_Evolution_Logiciel/TP3_Logging/SpringmongoBackend/src");
        java.lang.System.out.println(" je suis passer ");
        launcher.addProcessor(new com.example.demo.spoonparsers.ReadLoggingProcessor());
        launcher.run();
        // le fichier de resultat
        spoon.reflect.CtModel model = launcher.getModel();
        java.io.File outputFile = new java.io.File("resources/sortie.txt");
        try (java.io.PrintWriter out = new java.io.PrintWriter(new java.io.FileWriter(outputFile))) {
            for (spoon.reflect.declaration.CtType<?> type : model.getAllTypes()) {
                // Utilisez PrettyPrinter pour obtenir une représentation sous forme de chaîne du code source
                spoon.reflect.visitor.PrettyPrinter prettyPrinter = launcher.getEnvironment().createPrettyPrinter();
                java.lang.String code = prettyPrinter.printElement(type);
                out.println(code);
                out.println("-------------------------------------------------------");
            }
        } catch (java.io.IOException e) {
            throw new java.lang.RuntimeException(e);
        }
    }
}