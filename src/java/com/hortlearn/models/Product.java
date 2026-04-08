package com.hortlearn.models;

/**
 * Product.java – JavaBean / Model
 * Maps directly to the Product table in the database.
 *
 * Columns: productId | productName | description | productCategory
 */
public class Product {
    
    private String productId;
    private String productName;
    private String description;
    private String productCategory;

    // No-arg constructor (required for JavaBean)
    public Product() {}

    // Main constructor used by ProductServlet
    public Product(String productId, String productName, 
                   String description, String productCategory) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.productCategory = productCategory;
    }

    // Getters
    public String getProductId() { return productId; }
    public String getProductName() { return productName; }
    public String getDescription() { return description; }
    public String getProductCategory() { return productCategory; }

    // Setters (optional but good to have)
    public void setProductId(String productId) { this.productId = productId; }
    public void setProductName(String productName) { this.productName = productName; }
    public void setDescription(String description) { this.description = description; }
    public void setProductCategory(String productCategory) { 
        this.productCategory = productCategory; 
    }

    @Override
    public String toString() {
        return "Product{id='" + productId + "', name='" + productName 
                + "', category='" + productCategory + "'}";
    }
}