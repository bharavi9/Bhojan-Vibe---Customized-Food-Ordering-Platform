<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.MenuItem" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div id="cartBox">
        <h2>Your Cart</h2>
        <div id="cartContainer"></div>
        <button onclick="submitCart()">Checkout</button>
        <button id="closeCart">Close</button>
    </div>

    <script src="js/menu.js"></script>
</body>
</html>
