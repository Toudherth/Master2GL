package com.example.demo.controller;
import com.example.demo.entity.Product;
import com.example.demo.entity.User;
import com.example.demo.exception.Result;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserActivityLogService;
import com.example.demo.service.UserService;
import java.util.Map;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/product")
public class ProductController {
    private static User user = new User();

    private static Logger logger = LoggerFactory.getLogger(ProductController.class);

    private ProductService productService;

    private UserService userService;

    private final UserActivityLogService userActivityLogService;

    /**
     * * Constructor (injection dependences)
     */
    @Autowired
    public ProductController(ProductService productService, UserService userService, UserActivityLogService userActivityLogService) {
        this.productService = productService;
        this.userService = userService;
        this.userActivityLogService = userActivityLogService;
    }

    /**
     * * Read data *
     */
    @GetMapping("/products")
    public Iterable<Product> getProducts() {
        if(user.getUserId() != null && !user.getUserId().isEmpty()) { userActivityLogService.logUserActivity(user.getUserId(), "Viewed most expensive product"); };
        logger.info("UserID: " + user.getUserId() + ", Operation: Read, Method: getProducts");;
        Iterable<Product> products = productService.listAll();
        return products;
    }

    // price a modifier
    @GetMapping("/products/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable
    String productId) throws Exception {
        if(user.getUserId() != null && !user.getUserId().isEmpty()) { userActivityLogService.logUserActivity(user.getUserId(), "Viewed most expensive product"); };
        logger.info("UserID: " + user.getUserId() + ", Operation: Read, Method: getProductById");;
        if(user.getUserId() != null && !user.getUserId().isEmpty()) {    String actionMessage = "Viewed Product: " + product.getName() + " at Price: " + product.getPrice();    userActivityLogService.logUserActivity(user.getUserId(), actionMessage);    logger.info("UserID: " + user.getUserId() + ", Operation: Read, Method: getProductById, Product: " + product.getName() + ", Price: " + product.getPrice());    userActivityLogService.logUserActivity(this.user.getUserId(), actionMessage);};
        Product product = productService.getProductById(productId);
        if (product != null) {
            boolean isMostExpensive = productService.isProductTheMostExpensive(productId);
            // Logique supplémentaire ou renvoyer les informations au client
            return ResponseEntity.ok(product);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produit non trouvé");
        }
    }

    /**
     * * Write data *
     */
    @PostMapping("/products")
    public ResponseEntity<Result> saveProduct(@RequestBody
    Product product) {
        if(user.getUserId() != null && !user.getUserId().isEmpty()) { userActivityLogService.logUserActivity(user.getUserId(), "Viewed most expensive product"); };
        logger.info("UserID: " + user.getUserId() + ", Operation: Write, Method: saveProduct");;
        try {
            Result result = productService.saveProduct(product);
            if (result.isSuccess()) {
                return ResponseEntity.ok(result);
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(new Result(false, "Le produit avec le même nom existe déjà."));
        }
    }

    @PutMapping("/products/{productId}")
    public ResponseEntity<Result> updateProduct(@PathVariable
    String productId, @RequestBody
    Product updatedProduct) {
        if(user.getUserId() != null && !user.getUserId().isEmpty()) { userActivityLogService.logUserActivity(user.getUserId(), "Viewed most expensive product"); };
        logger.info("UserID: " + user.getUserId() + ", Operation: Write, Method: updateProduct");;
        Result result = productService.updateProduct(productId, updatedProduct);
        // Vérifiez le statut de la mise à jour et renvoyez la réponse correspondante
        if (result.isSuccess()) {
            return ResponseEntity.ok(result);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        }
    }

    @DeleteMapping("/products/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable
    String productId) {
        if(user.getUserId() != null && !user.getUserId().isEmpty()) { userActivityLogService.logUserActivity(user.getUserId(), "Viewed most expensive product"); };
        logger.info("UserID: " + user.getUserId() + ", Operation: Write, Method: deleteProduct");;
        try {
            productService.deleteProduct(productId);
            return ResponseEntity.ok(("Product with ID " + productId) + " deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    /**
     * **********************
     */
    /**
     * Controller of users
     */
    @PostMapping("/user/registre")
    public ResponseEntity<?> addUser(@RequestBody
    User user) {
        try {
            User savedUser = userService.addUser(user);
            return ResponseEntity.ok(savedUser);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        }
    }

    @PostMapping("/user/login")
    public ResponseEntity<User> authenticateUser(@RequestBody
    Map<String, String> credentials) {
        String email = credentials.get("email");
        String password = credentials.get("password");
        try {
            User authenticatedUser = userService.authenticateUser(email, password);
            return ResponseEntity.ok(authenticatedUser);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }

    @GetMapping("/user/logout")
    public ResponseEntity<?> logoutUser() {
        userService.deconnexion();
        return ResponseEntity.ok("Déconnexion réussie");
    }
}