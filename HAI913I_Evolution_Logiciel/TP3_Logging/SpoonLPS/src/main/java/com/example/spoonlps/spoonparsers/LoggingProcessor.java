package com.example.spoonlps.spoonparsers;


import com.savoirtech.logging.slf4j.json.logger.Logger;
import spoon.processing.AbstractProcessor;
import spoon.reflect.code.CtCodeSnippetExpression;
import spoon.reflect.code.CtCodeSnippetStatement;
import spoon.reflect.declaration.CtClass;
import spoon.reflect.declaration.CtField;
import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.ModifierKind;
import spoon.reflect.reference.CtTypeReference;

public class LoggingProcessor extends AbstractProcessor<CtMethod<?>> {

    @Override
    public void process(CtMethod<?> method) {
        CtClass<?> parentClass = method.getParent(CtClass.class);
        if (parentClass != null && parentClass.getSimpleName().equals("ProductController")) {
            CtTypeReference<Logger> typelogger = getFactory().createCtTypeReference(Logger.class);

            CtField write = getFactory().createField();
            write.setType(typelogger);
            write.addModifier(ModifierKind.STATIC);
            write.addModifier(ModifierKind.PRIVATE);
            write.addModifier(ModifierKind.FINAL);
            write.setSimpleName("write");

            CtField read = getFactory().createField();
            read.setType(typelogger);
            read.addModifier(ModifierKind.STATIC);
            read.addModifier(ModifierKind.PRIVATE);
            read.addModifier(ModifierKind.FINAL);
            read.setSimpleName("read");

            CtField price= getFactory().createField();
            price.setType(typelogger);
            price.addModifier(ModifierKind.STATIC);
            price.addModifier(ModifierKind.PRIVATE);
            price.addModifier(ModifierKind.FINAL);
            price.setSimpleName("price");

            String expressionwrite = "com.savoirtech.logging.slf4j.json.LoggerFactory.getLogger(\"Write\")";
            CtCodeSnippetExpression loggerExpression = getFactory().Code().createCodeSnippetExpression(expressionwrite);
            write.setDefaultExpression(loggerExpression);

            expressionwrite = "com.savoirtech.logging.slf4j.json.LoggerFactory.getLogger(\"Read\")";
            loggerExpression = getFactory().Code().createCodeSnippetExpression(expressionwrite);
            read.setDefaultExpression(loggerExpression);

            expressionwrite = "com.savoirtech.logging.slf4j.json.LoggerFactory.getLogger(\"Price\")";
            loggerExpression = getFactory().Code().createCodeSnippetExpression(expressionwrite);
            price.setDefaultExpression(loggerExpression);

            parentClass.addFieldAtTop(write);
            parentClass.addFieldAtTop(read);
            parentClass.addFieldAtTop(price);





            String logStatementTemplate = "logger.info(\"UserID: \" + userId + \", Operation: %s, Method: " + method.getSimpleName() + "\");";

            if (isReadOperation(method)) {
                addLogStatement(method, String.format(logStatementTemplate, "Read"));
            } else if (isWriteOperation(method)) {
                addLogStatement(method, String.format(logStatementTemplate, "Write"));
            }
        }
    }

    private void addLogStatement(CtMethod<?> method, String logStatement) {
        CtCodeSnippetStatement snippet = getFactory().createCodeSnippetStatement(logStatement);
        method.getBody().insertBegin(snippet);
    }


    private boolean isWriteOperation(CtMethod<?> method) {
        String methodName = method.getSimpleName();
        return methodName.startsWith("save") || methodName.startsWith("update") || methodName.startsWith("delete");
    }

    private boolean isExpensiveProductSearch(CtMethod<?> method) {
        String methodName = method.getSimpleName();
        // Implémentez la logique pour identifier les recherches des produits les plus chers
        // Cela dépend de l'implémentation spécifique de votre méthode
        return methodName.contains("ExpensiveProductSearch") || methodName.contains("MaxPriceQuery");
    }


    private boolean isReadOperation(CtMethod<?> method) {
        // Logique pour déterminer si la méthode est une opération de lecture
        String methodName = method.getSimpleName();
        return methodName.startsWith("get") || methodName.startsWith("find") || methodName.startsWith("list");
    }


}
/**
 @Override
 public boolean isToBeProcessed(CtMethod<?> method) {
 // Vérifiez si la méthode a un parent de type CtClass et que le nom est "ProductController"
 CtClass<?> parentClass = method.getParent(CtClass.class);
 return parentClass != null && parentClass.getSimpleName().equals("ProductController");
 }
 @Override
 public void process(CtMethod<?> method) {
 String logMessage = "logger.info(\"User ID: \" + userId + \", Operation: %s, Method: " + method.getSimpleName() + "\")";

 if (isReadOperation(method)) {
 addLogStatement(method, String.format(logMessage, "Read"));
 } else if (isWriteOperation(method)) {
 addLogStatement(method, String.format(logMessage, "Write"));
 } else if (isExpensiveProductSearch(method)) {
 addLogStatement(method, String.format(logMessage, "Expensive Product Search"));
 }
 }

 private void addLogStatement(CtMethod<?> method, String logMessage) {
 CtCodeSnippetStatement logStatement = getFactory().createCodeSnippetStatement(logMessage);
 method.getBody().insertBegin(logStatement);
 }

 private boolean isWriteOperation(CtMethod<?> method) {
 String methodName = method.getSimpleName();
 return methodName.startsWith("save") || methodName.startsWith("update") || methodName.startsWith("delete");
 }

 private boolean isExpensiveProductSearch(CtMethod<?> method) {
 String methodName = method.getSimpleName();
 // Implémentez la logique pour identifier les recherches des produits les plus chers
 // Cela dépend de l'implémentation spécifique de votre méthode
 return methodName.contains("ExpensiveProductSearch") || methodName.contains("MaxPriceQuery");
 }


 private boolean isReadOperation(CtMethod<?> method) {
 // Logique pour déterminer si la méthode est une opération de lecture
 String methodName = method.getSimpleName();
 return methodName.startsWith("get") || methodName.startsWith("find") || methodName.startsWith("list");
 }
 }
 */