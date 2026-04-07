/**
 * 
 */
package com.hotlearn.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.hotlearn.models.Product;
import com.hotlearn.utils.DBConnection;

public class ProductDAO {

		// Method to fetch all products for the catalog page
	    List<Product> getAllProducts() {
	        List<Product> products = new ArrayList<>();
	        String query = "SELECT * FROM Product"; // Matches your HortDb.sql table name

	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	                // Using the parameterized constructor we created earlier
	                // Note: productId is now a String to match VARCHAR(10) in your SQL
	                Product product = new Product(
	                    rs.getString("productId"), 
	                    rs.getString("productName"),
	                    rs.getString("productCategory"),
	                    0.0, // Add a price column to your SQL later if needed
	                    rs.getString("description"),
	                    "default.jpg" // Placeholder for imagePath
	                );
	                products.add(product);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return products;
	    }
	

	    public static void main(String[] args) {
	        ProductDAO dao = new ProductDAO();
	        java.util.List<com.hotlearn.models.Product> list = dao.getAllProducts();

	        if (list.isEmpty()) {
	            System.out.println("Connected, but no products found in the table.");
	        } else {
	            System.out.println("Success! Found " + list.size() + " products.");
	            for (com.hotlearn.models.Product p : list) {
	                System.out.println("Product: " + p.getName());
	            }
	        }
	    }

}
