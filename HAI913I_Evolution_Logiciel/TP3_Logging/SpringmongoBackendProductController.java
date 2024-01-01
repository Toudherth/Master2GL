@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    private static final Logger logger = LoggerFactory.getLogger("PRODUCT");

    @GetMapping("/getall")
    public Iterable<Product> getProducts() {
        logger.info("User ID: " + userId + ", Operation: Read, Method: getProducts");
        Iterable<Product> products = productService.listAll();
        return products;
    }

    @GetMapping("/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable
    String productId) {
        logger.info("User ID: " + userId + ", Operation: Read, Method: getProductById");
        try {
            logger.info("Received request to get product with ID: {}", productId);
            Product product = productService.getProductById(productId);
            return ResponseEntity.ok(product);
        } catch (Exception e) {
            logger.error("Error in getting product with ID: {}", productId, e);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @PostMapping("/save")
    public ResponseEntity<Result> saveProduct(@RequestBody
    Product product) {
        logger.info("Received request to save product: {}", product);
        try {
            Result result = productService.saveProduct(product);
            if (result.isSuccess()) {
                logger.info("Product saved successfully: {}", product);
                return ResponseEntity.ok(result);
            } else {
                logger.error("Failed to save product: {}", result.getMessage());
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            }
        } catch (Exception e) {
            logger.error("Failed to save product due to duplication: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.CONFLICT).body(new Result(false, "Le produit avec le même nom existe déjà."));
        }
    }

    @PutMapping("/update/{productId}")
    public ResponseEntity<Result> updateProduct(@PathVariable
    String productId, @RequestBody
    Product updatedProduct) {
        Result result = productService.updateProduct(productId, updatedProduct);
        // Vérifiez le statut de la mise à jour et renvoyez la réponse correspondante
        if (result.isSuccess()) {
            return ResponseEntity.ok(result);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result);
        }
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable
    String productId) {
        try {
            logger.info("Received request to delete product with ID: {}", productId);
            productService.deleteProduct(productId);
            return ResponseEntity.ok(("Product with ID " + productId) + " deleted successfully");
        } catch (Exception e) {
            logger.error("Error in deleting product with ID: {}", productId, e);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
}
