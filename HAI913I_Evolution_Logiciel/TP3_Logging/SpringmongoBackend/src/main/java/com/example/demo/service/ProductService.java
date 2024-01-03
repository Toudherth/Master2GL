package com.example.demo.service;

import com.example.demo.entity.Product;
import com.example.demo.repository.ProductRepository;
import com.example.demo.exception.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    private ProductRepository productRepository;
    @Autowired
    public ProductService (ProductRepository productRepository) {
        this.productRepository =productRepository;
    }

    public boolean isProductTheMostExpensive(String productId) {
        Product mostExpensiveProduct = productRepository.findTopByOrderByPriceDesc();
        if (mostExpensiveProduct != null) {
            Product currentProduct = productRepository.findById(productId).orElse(null);
            return currentProduct != null && currentProduct.getPrice() ==mostExpensiveProduct.getPrice();
        }
        return false;
    }

    public Iterable<Product> listAll() {
        Iterable<Product> products = productRepository.findAll();
        if (!products.iterator().hasNext()) {
            throw new RuntimeException("Aucun produit trouvé.");
        }
        return products;
    }

    public Result saveProduct(Product product) {
        if (product.getName() != null) {
            // Vérifier si le nom du produit existe déjà
            Product existingProduct = productRepository.findByName(product.getName());
            if (existingProduct == null) {
                try {
                    Product addedProduct = productRepository.save(product);
                    return new Result(true, "Produit sauvegardé avec succès");
                } catch (Exception e) {
                    return new Result(false, "Une erreur s'est produite lors de la sauvegarde du produit");
                }
            } else {
                throw new RuntimeException("Le produit avec le même nom existe déjà.");
            }
        } else {
            return new Result(false, "Les détails du produit ne sont pas complets. Le produit n'a pas été ajouté.");
        }
    }

    public Result updateProduct(String productId, Product updatedProduct) {
        // Vérifiez si le produit existe avant de le mettre à jour
        if (productRepository.existsById(productId)) {
            updatedProduct.setProductId(productId);
            productRepository.save(updatedProduct);
            return new Result(true, "Produit mis à jour avec succès");
        } else {
            return new Result(false, "Produit non trouvé avec l'ID : " + productId);
        }
    }

    public Product getProductById(String productId) throws Exception {
        //logger.info("Fetching product with ID: {}", productId);
        return productRepository.findById(productId)
                .orElseThrow(() -> {
                    return new Exception("Product with ID " + productId + " not found.");
                });
    }

    public void deleteProduct(String productId) throws Exception {
        if (!productRepository.existsById(productId)) {
            throw new Exception("Product with ID " + productId + " not found.");
        }
        productRepository.deleteById(productId);
    }

}

