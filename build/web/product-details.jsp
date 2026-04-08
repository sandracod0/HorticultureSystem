<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.productName} – Horticulture Department</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f5f5f5; color: #333; }
        header { background: #2e7d32; color: white; padding: 16px 32px; }
        header h1 { margin: 0; font-size: 22px; }
        nav a { color: #c8e6c9; text-decoration: none; margin-right: 16px; font-size: 14px; }
        nav a:hover { color: white; }
        .container { max-width: 700px; margin: 40px auto; padding: 0 16px; }
        .back-link { font-size: 13px; color: #2e7d32; text-decoration: none; display: inline-block; margin-bottom: 20px; }
        .back-link:hover { text-decoration: underline; }
        .error { background: #ffebee; border: 1px solid #ef9a9a; color: #c62828;
                 padding: 12px 16px; border-radius: 6px; margin-bottom: 16px; }
        .detail-card { background: white; border-radius: 10px; border: 1px solid #ddd; padding: 32px; }
        .badge { font-size: 11px; text-transform: uppercase; letter-spacing: 1px;
                 color: #fff; background: #66bb6a; border-radius: 4px;
                 padding: 4px 10px; display: inline-block; margin-bottom: 16px; }
        .detail-card h2 { margin: 0 0 16px; font-size: 24px; color: #1b5e20; }
        .detail-row { display: flex; gap: 12px; margin-bottom: 12px; }
        .detail-label { font-size: 13px; color: #888; width: 100px; flex-shrink: 0; padding-top: 1px; }
        .detail-value { font-size: 14px; color: #333; line-height: 1.6; }
        .divider { border: none; border-top: 1px solid #eee; margin: 24px 0; }
        .actions { display: flex; gap: 12px; }
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
    <a href="products" class="back-link">← Back to Catalog</a>

    <!-- Error state -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <!-- Product detail card -->
    <c:if test="${not empty product}">
        <div class="detail-card">
            <span class="badge">${product.productCategory}</span>
            <h2>${product.productName}</h2>

            <div class="detail-row">
                <span class="detail-label">Product ID</span>
                <span class="detail-value">${product.productId}</span>
            </div>

            <div class="detail-row">
                <span class="detail-label">Category</span>
                <span class="detail-value">${product.productCategory}</span>
            </div>

            <div class="detail-row">
                <span class="detail-label">Description</span>
                <span class="detail-value">
                    <c:choose>
                        <c:when test="${not empty product.description}">${product.description}</c:when>
                        <c:otherwise>No description available for this product.</c:otherwise>
                    </c:choose>
                </span>
            </div>

            <hr class="divider"/>

            <div class="actions">
                <!-- Pre-fills productId in the order form -->
                <a href="order-form.jsp?productId=${product.productId}" class="btn-primary">Request This Product</a>
                <a href="products" class="btn-secondary">Back to Catalog</a>
            </div>
        </div>
    </c:if>
</div>

<footer>&copy; 2025 Horticulture Department. All rights reserved.</footer>
</body>
</html>
