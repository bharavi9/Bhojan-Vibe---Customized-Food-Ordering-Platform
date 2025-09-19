package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;

@WebServlet("/cart")
public class AddToCartServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/bhojan";
    private static final String USER = "root";
    private static final String PASSWORD = "kavya"; // Change to your actual password
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/)
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();

        CartItem[] cartItems = gson.fromJson(reader, CartItem[].class);
        double total = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ Ensure MySQL connector JAR is added
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "INSERT INTO cart (name, price, qty) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            for (CartItem item : cartItems) {
                total += item.price * item.qty;

                stmt.setString(1, item.name);
                stmt.setDouble(2, item.price);
                stmt.setInt(3, item.qty);
                stmt.executeUpdate();
            }

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Database Error\"}");
            return;
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\":\"success\",\"total\":" + total + "}");
    }

    static class CartItem {
        String name;
        double price;
        int qty;
    }
}
