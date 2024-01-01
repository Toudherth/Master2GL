package com.example.demo.controller;
import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserActivityLogService;
import exception.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/products")
public class ProductController {
    private ProductService productService;

    private final UserActivityLogService userActivityLogService;

    private static final Logger logger = LoggerFactory.getLogger("PRODUCT");

    /**
     * Constructor
     */
    @Autowired
    public ProductController(ProductService productService, UserActivityLogService userActivityLogService) {
        this.productService = productService;
        this.userActivityLogService = userActivityLogService;
    }

    @GetMapping("/list")
    public Iterable<Product> getProducts(@RequestParam(required = false)
    String userId) {
        logger.info("UserID: " + userId + ", Operation: Read, Method: getProducts");;
        logger.info(("UserID: " + userId) + ", Operation: Read, Method: getProducts");
        if ((userId != null) && (!userId.isEmpty())) {
            userActivityLogService.logUserActivity(userId, "Viewed product list");
        }
        Iterable<Product> products = productService.listAll();
        return products;
    }

    @GetMapping("/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable
    String productId, @RequestParam(required = false)
    String userId) {
        logger.info("UserID: " + userId + ", Operation: Read, Method: getProductById");;
        logger.info(("UserID: " + userId) + ", Operation: Read, Method: getProductById");
        try {
            if ((userId != null) && (!userId.isEmpty())) {
                userActivityLogService.logUserActivity(userId, "Viewed product ");
            }
            Product product = productService.getProductById(productId);
            return ResponseEntity.ok(product);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @PostMapping("/save")
    public ResponseEntity<Result> saveProduct(@RequestBody
    Product product, @RequestParam(required = false)
    String userId) {
        logger.info("UserID: " + userId + ", Operation: Write, Method: saveProduct");;
        logger.info(("UserID: " + userId) + ", Operation: Write, Method: saveProduct");
        try {
            Result result = productService.saveProduct(product);
            if (result.isSuccess()) {
                if ((userId != null) && (!userId.isEmpty())) {
                    userActivityLogService.logUserActivity(userId, "Added product");
                }
                return ResponseEntity.ok(result);
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(new Result(false, "Le produit avec le même nom existe déjà."));
        }
    }

    @PutMapping("/update/{productId}")
    public ResponseEntity<Result> updateProduct(@PathVariable
    String productId, @RequestBody
    Product updatedProduct, @RequestParam(required = false)
    String userId) {
        logger.info("UserID: " + userId + ", Operation: Write, Method: updateProduct");;
        logger.info(("UserID: " + userId) + ", Operation: Write, Method: updateProduct");
        Result result = productService.updateProduct(productId, updatedProduct);
        // Vérifiez le statut de la mise à jour et renvoyez la réponse correspondante
        if (result.isSuccess()) {
            if ((userId != null) && (!userId.isEmpty())) {
                userActivityLogService.logUserActivity(userId, "Update product");
            }
            return ResponseEntity.ok(result);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        }
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable
    String productId, @RequestParam(required = false)
    String userId) {
        logger.info("UserID: " + userId + ", Operation: Write, Method: deleteProduct");;
        logger.info(("UserID: " + userId) + ", Operation: Write, Method: deleteProduct");
        try {
            if ((userId != null) && (!userId.isEmpty())) {
                userActivityLogService.logUserActivity(userId, "Delete product");
            }
            productService.deleteProduct(productId);
            return ResponseEntity.ok(("Product with ID " + productId) + " deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    // price
    @GetMapping("/prix/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable
    String productId) throws Exception {
        logger.info("UserID: " + userId + ", Operation: Read, Method: getProductById");;
        Product product = productService.getProductById(productId);
        if (product != null) {
            boolean isMostExpensive = productService.isProductTheMostExpensive(productId);
            // Logique supplémentaire ou renvoyer les informations au client
            return ResponseEntity.ok(product);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produit non trouvé");
        }
    }
}