package db;

import model.Order;
import java.sql.*;
import java.util.*;

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean placeOrder(int userId, List<Order> items) {
        String sql = "INSERT INTO orders(user_id, item_name, quantity, price, total) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (Order item : items) {
                stmt.setInt(1, userId);
                stmt.setString(2, item.getName());
                stmt.setInt(3, item.getQuantity());
                stmt.setDouble(4, item.getPrice());
                stmt.setDouble(5, item.getPrice() * item.getQuantity());
                stmt.addBatch();
            }
            stmt.executeBatch();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
