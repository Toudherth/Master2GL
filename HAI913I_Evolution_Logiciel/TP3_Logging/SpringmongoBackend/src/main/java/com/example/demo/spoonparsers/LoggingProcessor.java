package com.example.demo.spoonparsers;

import spoon.processing.AbstractProcessor;
import spoon.reflect.code.CtBlock;
import spoon.reflect.code.CtCodeSnippetStatement;
import spoon.reflect.code.CtIf;
import spoon.reflect.code.CtStatement;
import spoon.reflect.declaration.CtClass;
import spoon.reflect.declaration.CtField;
import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.ModifierKind;
import spoon.reflect.reference.CtTypeReference;

public class LoggingProcessor extends AbstractProcessor<CtMethod<?>> {

    @Override
    public void process(CtMethod<?> method) {
        CtClass<?> parentClass = method.getParent(CtClass.class);
        // on fait l'instrumentation uniquement pour la classe productcontroller
        if (parentClass != null && "ProductController".equals(parentClass.getSimpleName())) {
            String methodName = method.getSimpleName();

            // Ignorer les méthodes spécifiques de User (authentification , add user, getUser, deconnexion)
            if (isUserMethod(methodName)) {
                return; // Ignorer cette méthode
            }
            addLoggerFieldsIfAbsent(parentClass);
            if (isGetProductByIdMethod(method)) {
                // for price logs
                replaceGetProductByIdMethod(method);
            } else {
                //handleMethodLogging(method, parentClass);
                // for write & read methodes
                handleReadWriteMethodLogging(method);
            }
        }
    }

        private void addLoggerFieldsIfAbsent(CtClass<?> parentClass) {
            addLoggerField(parentClass, "readLogger", "readLogger");
            addLoggerField(parentClass, "writeLogger", "writeLogger");
            addLoggerField(parentClass, "priceLogger", "priceLogger");
        }

        private void addLoggerField(CtClass<?> parentClass, String fieldName, String loggerName) {
            CtTypeReference<org.slf4j.Logger> typeLogger = getFactory().createCtTypeReference(org.slf4j.Logger.class);
            if (!parentClass.getFields().stream().anyMatch(field -> field.getSimpleName().equals(fieldName))) {
                CtField<org.slf4j.Logger> loggerField = getFactory().createCtField(
                        fieldName, typeLogger, "org.slf4j.LoggerFactory.getLogger(\"" + loggerName + "\")",
                        ModifierKind.PRIVATE, ModifierKind.STATIC
                );
                parentClass.addFieldAtTop(loggerField);
            }
        }
    private void replaceGetProductByIdMethod(CtMethod<?> method) {
        CtStatement getProductStatement = getFactory().createCodeSnippetStatement("Product product = productService.getProductById(productId)");

        CtIf ifStatement = getFactory().createIf();
        ifStatement.setCondition(getFactory().createCodeSnippetExpression("product != null"));

        CtBlock<?> thenBlock = getFactory().createBlock();
        thenBlock.addStatement(getFactory().createCodeSnippetStatement("boolean isMostExpensive = productService.isProductTheMostExpensive(productId)"));
        thenBlock.addStatement(getFactory().createCodeSnippetStatement("Logger currentLogger = isMostExpensive ? priceLogger : readLogger"));

        CtIf innerIfStatement = getFactory().createIf();
        innerIfStatement.setCondition(getFactory().createCodeSnippetExpression("user != null"));
        // Mise à jour pour générer un log au format JSON
        innerIfStatement.setThenStatement(getFactory().createCodeSnippetStatement(
                "currentLogger.info(\"\\\"message\\\": \\\"getProductById\\\", \\\"User\\\": \\\"\" + user.getName() + \"\\\", \\\"UserID\\\": \\\"\" + user.getUserId() + \"\\\", \\\"Product\\\": \\\"\" + product.getName() + \"\\\", \\\"ProductID\\\": \\\"\" + product.getProductId() + \"\\\", \\\"Price\\\": \" + product.getPrice() + \"\")"
        ));

        thenBlock.addStatement(innerIfStatement);

        thenBlock.addStatement(getFactory().createCodeSnippetStatement("return ResponseEntity.ok(product)"));
        ifStatement.setThenStatement(thenBlock);

        ifStatement.setElseStatement(getFactory().createCodeSnippetStatement("return ResponseEntity.status(HttpStatus.NOT_FOUND).body(\"Produit non trouvé\")"));

        CtBlock<?> newBody = getFactory().createBlock();
        newBody.addStatement(getProductStatement);
        newBody.addStatement(ifStatement);

        method.setBody(newBody);
    }



    private boolean isGetProductByIdMethod(CtMethod<?> method) {
            return "getProductById".equals(method.getSimpleName()) &&
                    method.getParameters().size() == 1 &&
                    method.getParameters().get(0).getType().getSimpleName().equals("String");
        }

    private void handleReadWriteMethodLogging(CtMethod<?> method) {
        String loggerName = determineLoggerName(method);
        String logStatement = String.format(
                "%s.info(\"\\\"message\\\": \\\"%s\\\", \\\"User\\\": \\\"\" + user.getName() + \"\\\", \\\"UserID\\\": \\\"\" + user.getUserId() + \"\\\"\");",
                loggerName, method.getSimpleName()
        );
        addLogStatement(method, logStatement);
    }

        private String determineLoggerName(CtMethod<?> method) {
            if (isReadOperation(method)) {
                return "readLogger";
            } else if (isWriteOperation(method)) {
                return "writeLogger";
            } else if (isExpensiveProductSearch(method)) {
                return "priceLogger";
            }
            return "logger"; // Fallback au logger général
        }

        private boolean isWriteOperation(CtMethod<?> method) {
            String methodName = method.getSimpleName();
            return methodName.startsWith("save") || methodName.startsWith("update") || methodName.startsWith("delete");
        }

        private boolean isExpensiveProductSearch(CtMethod<?> method) {
            String methodName = method.getSimpleName();
            return methodName.contains("ExpensiveProductSearch") || methodName.contains("MaxPriceQuery");
        }

        private boolean isReadOperation(CtMethod<?> method) {
            String methodName = method.getSimpleName();
            return methodName.startsWith("get") || methodName.startsWith("find") || methodName.startsWith("list");
        }

        private void addLogStatement(CtMethod<?> method, String logStatement) {
            CtCodeSnippetStatement snippet = getFactory().createCodeSnippetStatement(logStatement);
            method.getBody().insertBegin(snippet);
        }

        // exclure les methodes de user pour les logs
    private boolean isUserMethod(String methodName) {
        return "addUser".equals(methodName) ||
                "authenticateUser".equals(methodName) ||
                "getUser".equals(methodName) ||
                "logoutUser".equals(methodName);
    }


}
