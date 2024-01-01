package com.example.demo.spoonparsers;
import spoon.processing.AbstractProcessor;
import spoon.reflect.code.CtCodeSnippetStatement;
import spoon.reflect.declaration.CtClass;
import spoon.reflect.declaration.CtMethod;
public class ReadLoggingProcessor extends AbstractProcessor<CtMethod<?>> {
    @Override
    public boolean isToBeProcessed(CtMethod<?> method) {
        // Vérifiez si la méthode a un parent de type CtClass et que le nom est "ProductController"
        CtClass<?> parentClass = method.getParent(CtClass.class);
        return (parentClass != null) && parentClass.getSimpleName().equals("ProductController");
    }

    @Override
    public void process(CtMethod<?> method) {
        // Identifiez les méthodes de lecture dans ProductController
        if (isReadOperation(method)) {
            // Construisez et ajoutez une déclaration de logging
            CtCodeSnippetStatement logStatement = getFactory().createCodeSnippetStatement(("logger.info(\"User ID: \" + userId + \", Operation: Read, Method: " + method.getSimpleName()) + "\")");
            method.getBody().insertBegin(logStatement);
        }
    }

    private boolean isReadOperation(CtMethod<?> method) {
        // Logique pour déterminer si la méthode est une opération de lecture
        String methodName = method.getSimpleName();
        return (methodName.startsWith("get") || methodName.startsWith("find")) || methodName.startsWith("list");
    }
}