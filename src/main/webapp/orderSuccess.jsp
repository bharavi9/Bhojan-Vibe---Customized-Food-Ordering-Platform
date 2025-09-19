<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Order" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Successful - Bhojan Vibes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff8f0;
            padding: 30px;
            text-align: center;
        }
        h1 {
            color: #4CAF50;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f3a683;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #fceae8;
        }
        .total {
            font-weight: bold;
            font-size: 18px;
            margin-top: 20px;
        }
        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 20px;
            background-color: #f78fb3;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .back-btn:hover {
            background-color: #f45b69;
        }
    </style>
</head>
<body>

    <h1>🎉 Order Placed Successfully!</h1>
    <p>Thank you for ordering from <strong>Bhojan Vibes</strong>.</p>

    <table>
        <tr>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Price (₹)</th>
            <th>Subtotal (₹)</th>
        </tr>

        <%
            List<Order> orderItems = (List<Order>) session.getAttribute("orderItems");

            Double totalObj = (Double) session.getAttribute("totalPrice");
            double total = (totalObj != null) ? totalObj : 0.0;

            if (orderItems != null) {
                for (Order item : orderItems) {
                    double subtotal = item.getQuantity() * item.getPrice();
        %>
        <tr>
            <td><%= item.getName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= subtotal %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <div class="total">
        Grand Total: ₹<%= String.format("%.2f", total) %>
    </div>

    <a class="back-btn" href="menu.jsp">Back to Menu</a>

</body>
</html>
