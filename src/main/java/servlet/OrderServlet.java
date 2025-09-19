package servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import db.DBConnection;
import model.Order;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Fetch cart and user details
        List<Order> cartItems = (List<Order>) session.getAttribute("cartItems");
        String userName = (String) session.getAttribute("userName");
        Integer userId = (Integer) session.getAttribute("userId");

        if (cartItems == null || cartItems.isEmpty() || userId == null) {
            response.sendRedirect("menu.jsp");
            return;
        }

        double total = 0;
        for (Order item : cartItems) {
            total += item.getQuantity() * item.getPrice();
        }

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // start transaction

            // Insert into orders table
            String insertOrderSQL = "INSERT INTO orders (user_id, total_price) VALUES (?, ?)";
            PreparedStatement orderStmt = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.setDouble(2, total);
            orderStmt.executeUpdate();

            ResultSet generatedKeys = orderStmt.getGeneratedKeys();
            int orderId = 0;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

            // Insert items into order_items
            String insertItemSQL = "INSERT INTO order_items (order_id, item_name, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(insertItemSQL);

            for (Order item : cartItems) {
                itemStmt.setInt(1, orderId);
                itemStmt.setString(2, item.getName());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setDouble(4, item.getPrice());
                itemStmt.addBatch();
            }

            itemStmt.executeBatch();
            conn.commit(); // commit transaction

            // Pass data to success page using session
            session.setAttribute("orderItems", cartItems);
            session.setAttribute("totalPrice", total);

            // Clear cart
            session.removeAttribute("cartItems");

            response.sendRedirect("ordersuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // rollback if error
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            response.getWriter().write("Order failed: " + e.getMessage());
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
}
