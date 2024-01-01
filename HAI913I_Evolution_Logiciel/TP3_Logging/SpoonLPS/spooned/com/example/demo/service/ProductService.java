package com.example.demo.service;
import com.example.demo.entity.Product;
import com.example.demo.repository.ProductRepository;
import exception.Result;
import java.util.List;
import java.util.function.Supplier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ProductService {
    private static final Logger logger = LoggerFactory.getLogger("PRODUCT");

    private List<Product> products;

    private ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Iterable<Product> listAll() {
        products = productRepository.findAll();
        if (products.isEmpty()) {
            logger.info("Aucun étudiant trouvé.");
        } else {
            logger.info("Liste de tous les étudiants récupérée.");
        }
        return products;
    }

    public Result saveProduct(Product product) {
        if (product.getName() != null) {
            // Vérifier si le nom du produit existe déjà
            Product existingProduct = productRepository.findByName(product.getName());
            if (existingProduct == null) {
                // Aucun produit avec le même nom n'existe, vous pouvez l'ajouter
                logger.info("Saving product: {}", product);
                try {
                    Product addedProduct = productRepository.save(product);
                    logger.info("Product added successfully: {}", addedProduct);
                    return new Result(true, "Produit sauvegardé avec succès");
                } catch (Exception e) {
                    logger.error("Erreur lors de la sauvegarde du produit", e);
                    return new Result(false, "Une erreur s'est produite lors de la sauvegarde du produit");
                }
            } else {
                // Le produit existe déjà avec le même nom, lancez une exception
                logger.error("Product with name {} already exists. Unable to save.", product.getName());
                throw new RuntimeException("Le produit avec le même nom existe déjà.");
            }
        } else {
            logger.warn("Tentative d'ajout d'un produit avec des détails incomplets : {}", product);
            return new Result(false, "Les détails du produit ne sont pas complets. Le produit n'a pas été ajouté.");
        }
    }

    public Result updateProduct(String productId, Product updatedProduct) {
        logger.info("Updating product by ID: {}", productId);
        // Vérifiez si le produit existe avant de le mettre à jour
        if (productRepository.existsById(productId)) {
            updatedProduct.setProductId(productId);
            productRepository.save(updatedProduct);
            logger.info("Product updated successfully");
            return new Result(true, "Produit mis à jour avec succès");
        } else {
            logger.warn("Product not found with ID: {}. Unable to update.", productId);
            return new Result(false, "Produit non trouvé avec l'ID : " + productId);
        }
    }

    public Product getProductById(String productId) throws Exception {
        logger.info("User ID: {}, Operation: Read, Method: getProductById");// , userId);

        // logger.info("Fetching product with ID: {}", productId);
        return productRepository.findById(productId).orElseThrow(() -> {
            logger.error("Product not found with ID: {}", productId);
            return new Exception(("Product with ID " + productId) + " not found.");
        });
    }

    public void deleteProduct(String productId) throws Exception {
        logger.info("Attempting to delete product with ID: {}", productId);
        if (!productRepository.existsById(productId)) {
            logger.error("Delete failed: Product with ID {} not found", productId);
            throw new Exception(("Product with ID " + productId) + " not found.");
        }
        productRepository.deleteById(productId);
        logger.info("Product with ID {} deleted successfully", productId);
    }
}