package util;

import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/bhojan";  // Replace with your DB name
    private static final String USER = "root";         // Your DB username
    private static final String PASS = "kavya"; // Your DB password

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load JDBC driver
            return DriverManager.getConnection(URL, USER, PASS); // Establish DB connection
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
