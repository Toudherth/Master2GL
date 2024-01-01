package com.example.demo.spoonparsers;



import com.example.demo.entity.User;
import spoon.processing.AbstractProcessor;
import spoon.reflect.code.CtBlock;
import spoon.reflect.code.CtCodeSnippetStatement;
import spoon.reflect.declaration.CtClass;
import spoon.reflect.declaration.CtField;
import spoon.reflect.declaration.CtMethod;
import spoon.reflect.declaration.ModifierKind;
import spoon.reflect.reference.CtTypeReference;

import java.util.logging.Logger;


public class LoggingProcessor extends AbstractProcessor<CtMethod<?>> {



    @Override
    public void process(CtMethod<?> method) {
        CtClass<?> parentClass = method.getParent(CtClass.class);
        if (parentClass != null && parentClass.getSimpleName().equals("ProductController")) {
            addPriceLoggerFieldIfAbsent(parentClass);

            String methodName = method.getSimpleName();
            if (methodName.equals("addUser") || methodName.equals("authenticateUser") || methodName.equals("logoutUser")) {
                return;
            }
            if (methodName.equals("getProductById")) {
               // addPriceLoggingToGetProductById(method);
                addProductActivityLogStatement(method);
            }
            // Traiter les autres méthodes comme avant

            addLoggerFieldIfAbsent(parentClass);

            addUserFieldIfAbsent(parentClass);

            // Ajout des déclarations de log dans chaque méthode
            String operationType = determineOperationType(method);
            String logStatement = String.format("logger.info(\"UserID: \" + user.getUserId() + \", Operation: %s, Method: %s\");", operationType, methodName);
            String activityLogStatement = "if(user.getUserId() != null && !user.getUserId().isEmpty()) { userActivityLogService.logUserActivity(user.getUserId(), \"Viewed most expensive product\"); }";

            addLogStatementsToMethod(method, logStatement, activityLogStatement);
        }
    }


    private void addPriceLoggerFieldIfAbsent(CtClass<?> parentClass) {
        CtTypeReference<Logger> typeLogger = getFactory().createCtTypeReference(Logger.class);
        if (!parentClass.getFields().stream().anyMatch(field -> "price".equals(field.getSimpleName()))) {
            CtField<Logger> priceLogger = getFactory().createCtField("price", typeLogger, "LoggerFactory.getLogger(\"Price\")", ModifierKind.PRIVATE, ModifierKind.STATIC);
            parentClass.addFieldAtTop(priceLogger);
        }
    }

    private void addProductTraceLogStatement(CtMethod<?> method) {
        String traceLogTemplate = "if (this.user != null) { " +
                "productActivityService.logProductActivity(this.user.getUserId(), " +
                "productRepository.findById(productId).orElse(null).getName(), " +
                "productRepository.findById(productId).orElse(null).getPrice()); }";
        CtCodeSnippetStatement snippet = getFactory().createCodeSnippetStatement(traceLogTemplate);
        method.getBody().insertBegin(snippet);
    }
    private void addProductActivityLogStatement(CtMethod<?> method) {
        String logTemplate =  "if(user.getUserId() != null && !user.getUserId().isEmpty()) {"
                + "    String actionMessage = \"Viewed Product: \" + product.getName() + \" at Price: \" + product.getPrice();"
                + "    userActivityLogService.logUserActivity(user.getUserId(), actionMessage);"
                + "    logger.info(\"UserID: \" + user.getUserId() + \", Operation: Read, Method: getProductById, Product: \" + product.getName() + \", Price: \" + product.getPrice());"
                + "    userActivityLogService.logUserActivity(this.user.getUserId(), actionMessage);"
                + "}";

        CtCodeSnippetStatement snippet = getFactory().createCodeSnippetStatement(logTemplate);
        method.getBody().insertBegin(snippet);
    }



    private void addLogStatementsToMethod(CtMethod<?> method, String logStatement, String activityLogStatement) {
        CtCodeSnippetStatement logSnippet = getFactory().createCodeSnippetStatement(logStatement);
        CtCodeSnippetStatement activityLogSnippet = getFactory().createCodeSnippetStatement(activityLogStatement);

        CtBlock<?> body = method.getBody();
        if (body != null) {
            body.insertBegin(logSnippet);
            body.insertBegin(activityLogSnippet);
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
        return methodName.contains("ExpensiveProductSearch") || methodName.contains("MaxPriceQuery");
    }

    private boolean isReadOperation(CtMethod<?> method) {
        String methodName = method.getSimpleName();
        return methodName.startsWith("get") || methodName.startsWith("find") || methodName.startsWith("list");
    }

    private void addLoggerFieldIfAbsent(CtClass<?> parentClass) {
        CtTypeReference<Logger> typeLogger = getFactory().createCtTypeReference(Logger.class);
        if (!parentClass.getFields().stream().anyMatch(field -> "logger".equals(field.getSimpleName()))) {
            CtField<Logger> logger = getFactory().createCtField("logger", typeLogger, "LoggerFactory.getLogger(ProductController.class)", ModifierKind.PRIVATE, ModifierKind.STATIC);
            parentClass.addFieldAtTop(logger);
        }
    }

    private void addUserFieldIfAbsent(CtClass<?> parentClass) {
        CtTypeReference<User> typeUser = getFactory().createCtTypeReference(User.class);
        if (!parentClass.getFields().stream().anyMatch(field -> "user".equals(field.getSimpleName()))) {
            CtField<User> userField = getFactory().createCtField("user", typeUser, "new User()", ModifierKind.PRIVATE, ModifierKind.STATIC);
            parentClass.addFieldAtTop(userField);
        }
    }

    private String determineOperationType(CtMethod<?> method) {
        String methodName = method.getSimpleName();
        if (methodName.startsWith("get") || methodName.startsWith("find") || methodName.startsWith("list")) {
            return "Read";
        } else if (methodName.startsWith("save") || methodName.startsWith("update") || methodName.startsWith("delete")) {
            return "Write";
        } else if (methodName.contains("ExpensiveProductSearch") || methodName.contains("MaxPriceQuery")) {
            return "Expensive Product Search";
        }
        return "Unknown";
    }
}
