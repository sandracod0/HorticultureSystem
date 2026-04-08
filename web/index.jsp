<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home – Horticulture Department</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; color: #333; }

        /* ── Header ── */
        header { background: #2e7d32; color: white; padding: 16px 32px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 10px; }
        header h1 { font-size: 22px; }
        nav a { color: #c8e6c9; text-decoration: none; margin-left: 20px; font-size: 14px; }
        nav a:hover { color: white; }

        /* ── Hero Banner ── */
        .hero { background: linear-gradient(135deg, #1b5e20 0%, #388e3c 60%, #66bb6a 100%);
                color: white; text-align: center; padding: 80px 24px; }
        .hero h2 { font-size: 34px; margin-bottom: 14px; }
        .hero p  { font-size: 16px; color: #c8e6c9; max-width: 560px; margin: 0 auto 32px; line-height: 1.7; }
        .hero-btns { display: flex; gap: 14px; justify-content: center; flex-wrap: wrap; }
        .btn-white  { padding: 12px 28px; background: white; color: #2e7d32;
                      border-radius: 6px; text-decoration: none; font-size: 14px; font-weight: bold; }
        .btn-white:hover { background: #e8f5e9; }
        .btn-outline { padding: 12px 28px; border: 2px solid white; color: white;
                       border-radius: 6px; text-decoration: none; font-size: 14px; }
        .btn-outline:hover { background: rgba(255,255,255,0.1); }

        /* ── Section ── */
        .section { max-width: 1000px; margin: 48px auto; padding: 0 20px; }
        .section-title { font-size: 22px; color: #2e7d32; margin-bottom: 6px; }
        .section-sub   { font-size: 14px; color: #888; margin-bottom: 24px; }

        /* ── Feature Cards ── */
        .features { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 20px; }
        .feature-card { background: white; border-radius: 8px; border: 1px solid #ddd; padding: 24px 20px; text-align: center; }
        .feature-icon { font-size: 36px; margin-bottom: 12px; }
        .feature-card h3 { font-size: 15px; color: #1b5e20; margin-bottom: 8px; }
        .feature-card p  { font-size: 13px; color: #666; line-height: 1.6; }

        /* ── Category Quick Links ── */
        .categories { display: flex; gap: 12px; flex-wrap: wrap; }
        .cat-btn { padding: 10px 20px; background: white; border: 1px solid #a5d6a7;
                   border-radius: 20px; text-decoration: none; color: #2e7d32;
                   font-size: 13px; transition: all .2s; }
        .cat-btn:hover { background: #2e7d32; color: white; border-color: #2e7d32; }

        /* ── How It Works ── */
        .steps { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 20px; }
        .step { background: white; border-radius: 8px; border: 1px solid #ddd; padding: 24px 20px; }
        .step-num { width: 36px; height: 36px; background: #2e7d32; color: white;
                    border-radius: 50%; display: flex; align-items: center; justify-content: center;
                    font-weight: bold; font-size: 16px; margin-bottom: 12px; }
        .step h3 { font-size: 14px; color: #1b5e20; margin-bottom: 6px; }
        .step p  { font-size: 13px; color: #666; line-height: 1.6; }

        /* ── CTA Banner ── */
        .cta { background: #e8f5e9; border: 1px solid #a5d6a7; border-radius: 10px;
               padding: 40px 32px; text-align: center; margin: 48px 20px; max-width: 1000px; margin-left: auto; margin-right: auto; }
        .cta h3 { font-size: 20px; color: #1b5e20; margin-bottom: 10px; }
        .cta p  { font-size: 14px; color: #555; margin-bottom: 24px; }
        .btn-green { padding: 12px 28px; background: #2e7d32; color: white;
                     border-radius: 6px; text-decoration: none; font-size: 14px; }
        .btn-green:hover { background: #1b5e20; }

        /* ── Footer ── */
        footer { background: #1b5e20; color: #a5d6a7; text-align: center;
                 padding: 24px; font-size: 13px; margin-top: 60px; }
    </style>
</head>
<body>

<!-- ── Header ── -->
<header>
    <h1>🌿 Horticulture Department</h1>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products">Catalog</a>
        <a href="order">Order Request</a>
        <a href="contact.jsp">Contact</a>
    </nav>
</header>

<!-- ── Hero ── -->
<div class="hero">
    <h2>Welcome to the Horticulture Department</h2>
    <p>Explore our wide selection of plants, seedlings, fruits, and vegetables.
       Browse the catalog and place your order request directly with our department.</p>
    <div class="hero-btns">
        <a href="products" class="btn-white">Browse Catalog</a>
        <a href="order"    class="btn-outline">Place an Order</a>
    </div>
</div>

<!-- ── What We Offer ── -->
<div class="section">
    <h2 class="section-title">What We Offer</h2>
    <p class="section-sub">Quality horticultural products for every need</p>
    <div class="features">
        <div class="feature-card">
            <div class="feature-icon">🌹</div>
            <h3>Ornamental Plants</h3>
            <p>Beautiful flowering plants and shrubs to enhance any garden or space.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🌳</div>
            <h3>Tree Seedlings</h3>
            <p>Hardy tree seedlings for reforestation, shade, and fruit production.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🥦</div>
            <h3>Vegetables</h3>
            <p>Fresh vegetable seeds and seedlings for home and commercial growing.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🍋</div>
            <h3>Fruit Plants</h3>
            <p>Grafted and certified fruit plant varieties for reliable yields.</p>
        </div>
    </div>
</div>

<!-- ── Browse by Category ── -->
<div class="section">
    <h2 class="section-title">Browse by Category</h2>
    <p class="section-sub">Jump straight to what you need</p>
    <div class="categories">
        <a href="products" class="cat-btn">🌿 All Products</a>
        <a href="products" class="cat-btn">🌹 Ornamental</a>
        <a href="products" class="cat-btn">🍋 Fruit</a>
        <a href="products" class="cat-btn">🥦 Vegetable</a>
        <a href="products" class="cat-btn">🌳 Seedlings</a>
    </div>
</div>

<!-- ── How It Works ── -->
<div class="section">
    <h2 class="section-title">How It Works</h2>
    <p class="section-sub">Three simple steps to place your order</p>
    <div class="steps">
        <div class="step">
            <div class="step-num">1</div>
            <h3>Browse the Catalog</h3>
            <p>Explore all available horticultural products and click to view full details.</p>
        </div>
        <div class="step">
            <div class="step-num">2</div>
            <h3>Fill the Order Form</h3>
            <p>Enter your user ID and the product ID you would like to request.</p>
        </div>
        <div class="step">
            <div class="step-num">3</div>
            <h3>Receive Confirmation</h3>
            <p>Get your order reference number and wait for the department to follow up.</p>
        </div>
        <div class="step">
            <div class="step-num">4</div>
            <h3>Collect Your Order</h3>
            <p>Visit the department at the agreed time to collect your products.</p>
        </div>
    </div>
</div>

<!-- ── CTA ── -->
<div class="cta">
    <h3>Ready to place your order?</h3>
    <p>Visit our product catalog and submit a request directly to the Horticulture Department today.</p>
    <a href="products" class="btn-green">View All Products</a>
</div>

<!-- ── Footer ── -->
<footer>
    &copy; 2025 Horticulture Department &nbsp;|&nbsp; All rights reserved
</footer>

</body>
</html>

