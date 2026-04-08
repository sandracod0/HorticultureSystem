package com.hortlearn.models;

/**
 * OrderRequest.java  –  JavaBean / Model
 * Maps directly to the Order_request table in the database.
 *
 *  orderId | userId | productId
 */
public class OrderRequest {

    private String orderId;
    private String userId;
    private String productId;

    // ── No-arg constructor (required for JavaBean) ───────────────────────────
    public OrderRequest() {}

    // ── Convenience constructor ───────────────────────────────────────────────
    public OrderRequest(String orderId, String userId, String productId) {
        this.orderId   = orderId;
        this.userId    = userId;
        this.productId = productId;
    }

    // ── Getters & Setters ─────────────────────────────────────────────────────
    public String getOrderId()   { return orderId; }
    public void   setOrderId(String orderId) { this.orderId = orderId; }

    public String getUserId()    { return userId; }
    public void   setUserId(String userId) { this.userId = userId; }

    public String getProductId() { return productId; }
    public void   setProductId(String productId) { this.productId = productId; }

    @Override
    public String toString() {
        return "OrderRequest{orderId='" + orderId
                + "', userId='" + userId
                + "', productId='" + productId + "'}";
    }
}
