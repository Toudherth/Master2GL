package com.example.demo.controller;
import com.example.demo.entity.Product;
import com.example.demo.entity.User;
import com.example.demo.exception.Result;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;
import java.util.Map;
import org.slf4j.Logger;
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

    // l'ajout des logs
    private static Logger priceLogger = org.slf4j.LoggerFactory.getLogger("priceLogger");

    private static Logger writeLogger = org.slf4j.LoggerFactory.getLogger("writeLogger");

    private static Logger readLogger = org.slf4j.LoggerFactory.getLogger("readLogger");

    private ProductService productService;

    private UserService userService;

    private static User user;

    /**
     * * Constructor (injection dependences)
     */
    @Autowired
    public ProductController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    // TODO : controller of products
    /**
     * * Read data * Les methodes n'ont pas des logs et uniquement les methodes de produits qui auront des logs
     */
    @GetMapping("/products")
    public Iterable<Product> getProducts() {
        readLogger.info("\"message\": \"getProducts\", \"User\": \"" + user.getName() + "\", \"UserID\": \"" + user.getUserId() + "\"");;
        Iterable<Product> products = productService.listAll();
        return products;
    }

    // price a modifier
    @GetMapping("/products/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable
    String productId) throws Exception {
        Product product = productService.getProductById(productId);
        if (product != null) {
            boolean isMostExpensive = productService.isProductTheMostExpensive(productId);
            Logger currentLogger = isMostExpensive ? priceLogger : readLogger;
            if (user != null)
                currentLogger.info("\"message\": \"getProductById\", \"User\": \"" + user.getName() + "\", \"UserID\": \"" + user.getUserId() + "\", \"Product\": \"" + product.getName() + "\", \"ProductID\": \"" + product.getProductId() + "\", \"Price\": " + product.getPrice() + "");

            return ResponseEntity.ok(product);
        } else
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produit non trouvé");

    }

    /**
     * * Write data *
     */
    @PostMapping("/products")
    public ResponseEntity<Result> saveProduct(@RequestBody
    Product product) {
        writeLogger.info("\"message\": \"saveProduct\", \"User\": \"" + user.getName() + "\", \"UserID\": \"" + user.getUserId() + "\"");;
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
        writeLogger.info("\"message\": \"updateProduct\", \"User\": \"" + user.getName() + "\", \"UserID\": \"" + user.getUserId() + "\"");;
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
        writeLogger.info("\"message\": \"deleteProduct\", \"User\": \"" + user.getName() + "\", \"UserID\": \"" + user.getUserId() + "\"");;
        try {
            productService.deleteProduct(productId);
            return ResponseEntity.ok(("Product with ID " + productId) + " deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    // TODO : Controller of users
    @PostMapping("/user/registre")
    public ResponseEntity<?> addUser(@RequestBody
    User user) {
        try {
            User savedUser = userService.addUser(user);
            this.user = savedUser;// Mettre à jour l'utilisateur actuel après l'enregistrement

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
            this.user = authenticatedUser;// Mettre à jour l'utilisateur actuel ici

            return ResponseEntity.ok(authenticatedUser);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }

    @GetMapping("/user/logout")
    public ResponseEntity<?> logoutUser() {
        this.user = null;// Mettre à jour l'utilisateur actuel sur null lors de la déconnexion

        return ResponseEntity.ok("Déconnexion réussie");
    }

    public User getUser() {
        return this.user;
    }
}