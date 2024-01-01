package com.example.demo.spoonparsers;
import spoon.processing.AbstractProcessor;
import spoon.reflect.code.CtCodeSnippetStatement;
import spoon.reflect.declaration.CtMethod;
public class ReadLoggingProcessor extends AbstractProcessor<CtMethod<?>> {
    @Override
    public void process(CtMethod<?> method) {
        // Identifier les méthodes de lecture
        if (isReadOperation(method)) {
            CtCodeSnippetStatement logStatement = getFactory().createCodeSnippetStatement(("logger.info(\"User ID: \" + userId + \", Operation: Read, Method: " + method.getSimpleName()) + "\")");
            method.getBody().insertBegin(logStatement);
        }
    }

    private boolean isReadOperation(CtMethod<?> method) {
        // Logique pour déterminer si la méthode est une opération de lecture
        return method.getSignature().contains("find") || method.getSignature().contains("get");
    }
}