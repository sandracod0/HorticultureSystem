<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmed – Horticulture Department</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f5f5f5; color: #333; }
        header { background: #2e7d32; color: white; padding: 16px 32px; }
        header h1 { margin: 0; font-size: 22px; }
        nav a { color: #c8e6c9; text-decoration: none; margin-right: 16px; font-size: 14px; }
        nav a:hover { color: white; }
        .container { max-width: 560px; margin: 60px auto; padding: 0 16px; text-align: center; }
        .success-card { background: white; border-radius: 10px; border: 1px solid #ddd; padding: 40px 32px; }
        .icon { font-size: 52px; margin-bottom: 16px; }
        .success-card h2 { font-size: 22px; color: #2e7d32; margin: 0 0 10px; }
        .success-card p { font-size: 14px; color: #555; line-height: 1.6; margin: 0 0 20px; }
        .order-id-box { background: #e8f5e9; border: 1px solid #a5d6a7; border-radius: 6px;
                        padding: 12px 20px; display: inline-block; margin-bottom: 28px; }
        .order-id-box span { font-size: 13px; color: #388e3c; display: block; margin-bottom: 4px; }
        .order-id-box strong { font-size: 18px; color: #1b5e20; font-family: monospace; letter-spacing: 1px; }
        .actions { display: flex; gap: 12px; justify-content: center; flex-wrap: wrap; }
        .btn-primary { padding: 10px 24px; background: #2e7d32; color: white;
                       text-decoration: none; border-radius: 6px; font-size: 14px; }
        .btn-primary:hover { background: #1b5e20; }
        .btn-secondary { padding: 10px 24px; border: 1px solid #ccc; color: #555;
                         text-decoration: none; border-radius: 6px; font-size: 14px; background: white; }
        .btn-secondary:hover { background: #f5f5f5; }
        footer { text-align: center; padding: 24px; color: #888; font-size: 12px; margin-top: 40px; }
    </style>
</head>
<body>

<header>
    <h1>🌿 Horticulture Department</h1>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products">Catalog</a>
        <a href="order">Order Request</a>
        <a href="contact.jsp">Contact</a>
    </nav>
</header>

<div class="container">
    <div class="success-card">
        <div class="icon">✅</div>
        <h2>Order Request Received!</h2>
        <p>Thank you for your request. The Horticulture Department will review it and get back to you shortly.</p>

        <!-- Order ID passed from OrderServlet via the session -->
        <c:if test="${not empty sessionScope.lastOrderId}">
            <div class="order-id-box">
                <span>Your Order Reference</span>
                <strong>${sessionScope.lastOrderId}</strong>
            </div>
        </c:if>

        <p>Please keep your order reference number for follow-up inquiries.</p>

        <div class="actions">
            <a href="products" class="btn-primary">Browse More Products</a>
            <a href="order" class="btn-secondary">Place Another Order</a>
        </div>
    </div>
</div>

<footer>&copy; 2025 Horticulture Department. All rights reserved.</footer>
</body>
</html>
