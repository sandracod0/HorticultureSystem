package com.hortlearn.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.hortlearn.models.Product;
import com.hortlearn.utils.DatabaseConfig;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String productId = request.getParameter("id");
        
        try {
            if (productId == null || productId.trim().isEmpty()) {
                List<Product> products = getAllProducts();
                System.out.println("Number of products fetched: " + products.size()); // This will print in NetBeans console
                request.setAttribute("products", products);
                request.getRequestDispatcher("/catalog.jsp").forward(request, response);
            } else {
                Product product = getProductById(productId);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/product-details.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database connection failed: " + e.getMessage());
            request.getRequestDispatcher("/catalog.jsp").forward(request, response);
        }
    }

    private List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT productId, productName, description, productCategory FROM Product";
        
        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                list.add(new Product(
                    rs.getString("productId"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getString("productCategory")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Error in getAllProducts: " + e.getMessage());
        }
        return list;
    }

    private Product getProductById(String id) {
        String sql = "SELECT productId, productName, description, productCategory FROM Product WHERE productId = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getString("productCategory")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}