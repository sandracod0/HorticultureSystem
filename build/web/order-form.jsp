<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Request – Horticulture Department</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f5f5f5; color: #333; }
        header { background: #2e7d32; color: white; padding: 16px 32px; }
        header h1 { margin: 0; font-size: 22px; }
        nav a { color: #c8e6c9; text-decoration: none; margin-right: 16px; font-size: 14px; }
        nav a:hover { color: white; }
        .container { max-width: 560px; margin: 40px auto; padding: 0 16px; }
        .back-link { font-size: 13px; color: #2e7d32; text-decoration: none; display: inline-block; margin-bottom: 20px; }
        .back-link:hover { text-decoration: underline; }
        .form-card { background: white; border-radius: 10px; border: 1px solid #ddd; padding: 32px; }
        .form-card h2 { margin: 0 0 6px; font-size: 20px; color: #1b5e20; }
        .form-card p.sub { font-size: 13px; color: #888; margin: 0 0 24px; }
        .error { background: #ffebee; border: 1px solid #ef9a9a; color: #c62828;
                 padding: 10px 14px; border-radius: 6px; margin-bottom: 20px; font-size: 13px; }
        .form-group { margin-bottom: 18px; }
        label { display: block; font-size: 13px; font-weight: bold; color: #444; margin-bottom: 6px; }
        input[type="text"] { width: 100%; padding: 10px 12px; border: 1px solid #ccc;
                             border-radius: 6px; font-size: 14px; box-sizing: border-box; }
        input[type="text"]:focus { outline: none; border-color: #2e7d32; box-shadow: 0 0 0 2px #c8e6c9; }
        .hint { font-size: 11px; color: #999; margin-top: 4px; }
        .divider { border: none; border-top: 1px solid #eee; margin: 24px 0; }
        .btn-submit { width: 100%; padding: 12px; background: #2e7d32; color: white;
                      border: none; border-radius: 6px; font-size: 15px; cursor: pointer; }
        .btn-submit:hover { background: #1b5e20; }
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

    <div class="form-card">
        <h2>Place an Order Request</h2>
        <p class="sub">Fill in the details below to submit your request to the department.</p>

        <!-- Display validation or DB error from OrderServlet -->
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>

        <!--
            ACTION  → posts to OrderServlet mapped at /order
            METHOD  → POST (never GET for data-changing operations)
        -->
        <form method="post" action="${pageContext.request.contextPath}/order">

            <div class="form-group">
                <label for="userId">User ID</label>
                <input type="text"
                       id="userId"
                       name="userId"
                       placeholder="e.g. U001"
                       value="${param.userId}"
                       required />
                <span class="hint">Your registered user ID in the system.</span>
            </div>

            <div class="form-group">
                <label for="productId">Product ID</label>
                <input type="text"
                       id="productId"
                       name="productId"
                       placeholder="e.g. P001"
                       value="${not empty param.productId ? param.productId : pageParam}"
                       required />
                <span class="hint">The ID of the product you want to request (shown on the catalog).</span>
            </div>

            <hr class="divider"/>

            <button type="submit" class="btn-submit">Submit Order Request</button>
        </form>
    </div>
</div>

<footer>&copy; 2025 Horticulture Department. All rights reserved.</footer>
</body>
</html>
