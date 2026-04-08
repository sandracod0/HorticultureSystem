<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Product Catalog</title>
</head>
<body>
    <h1>Product Catalog</h1>
    
    <c:if test="${not empty products}">
        <c:forEach var="p" items="${products}">
            <div style="border:1px solid #ccc; margin:15px; padding:15px; width:300px; display:inline-block;">
                <h3>${p.productName}</h3>
                <p><strong>Category:</strong> ${p.productCategory}</p>
                <p>${p.description}</p>
                <a href="products?id=${p.productId}">View Details</a>
            </div>
        </c:forEach>
    </c:if>
    
    <c:if test="${empty products}">
        <p>No products found in database.</p>
    </c:if>
</body>
</html>