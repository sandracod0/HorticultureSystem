package com.hortlearn.controllers;

import com.hortlearn.models.OrderRequest;
import com.hortlearn.utils.DatabaseConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

/**
 * OrderServlet.java  –  Controller
 *
 * URL mapping:
 *   POST /order  → reads form data, validates, saves to Order_request, redirects
 *
 * Expected form parameters (from order-form.jsp):
 *   userId    – the logged-in user's ID
 *   productId – the product being requested
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private static final String SQL_INSERT =
            "INSERT INTO Order_request (orderId, userId, productId) VALUES (?, ?, ?)";

    // ── POST: receive and save the order request ──────────────────────────────
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // ── 1. Collect form parameters ────────────────────────────────────────
        String userId    = req.getParameter("userId");
        String productId = req.getParameter("productId");

        // ── 2. Basic server-side validation ──────────────────────────────────
        if (isBlank(userId) || isBlank(productId)) {
            req.setAttribute("errorMessage",
                    "Both User ID and Product ID are required to place an order.");
            req.getRequestDispatcher("/order-form.jsp").forward(req, resp);
            return;
        }

        // ── 3. Build the OrderRequest bean ────────────────────────────────────
        // Generate a short unique order ID (first 10 chars of a UUID, uppercase)
        String orderId = UUID.randomUUID().toString()
                             .replace("-", "")
                             .substring(0, 10)
                             .toUpperCase();

        OrderRequest order = new OrderRequest(orderId, userId, productId);

        // ── 4. Persist to database ────────────────────────────────────────────
        try {
            saveOrder(order);
        } catch (SQLException e) {
            log("OrderServlet – DB error while saving order", e);

            String userMessage;
            // FK violation: user or product does not exist
            if (e.getMessage() != null && e.getMessage().contains("foreign key")) {
                userMessage = "The selected user or product was not found. Please check your details.";
            } else {
                userMessage = "We could not process your order right now. Please try again later.";
            }

            req.setAttribute("errorMessage", userMessage);
            req.getRequestDispatcher("/order-form.jsp").forward(req, resp);
            return;
        }

        // ── 5. Success → redirect (PRG pattern prevents duplicate submissions) ─
        req.getSession().setAttribute("lastOrderId", orderId);   // pass orderId for confirmation page
        resp.sendRedirect(req.getContextPath() + "/order-success.jsp");
    }

    // ── GET: show the empty order form ────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Simply display the order form page
        req.getRequestDispatcher("/order-form.jsp").forward(req, resp);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // PRIVATE HELPERS
    // ─────────────────────────────────────────────────────────────────────────

    /** Inserts an OrderRequest row into the database. */
    private void saveOrder(OrderRequest order) throws SQLException {
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_INSERT)) {

            ps.setString(1, order.getOrderId());
            ps.setString(2, order.getUserId());
            ps.setString(3, order.getProductId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Insert returned 0 rows – order was not saved.");
            }
        }
    }

    /** Returns true if the string is null or contains only whitespace. */
    private boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
