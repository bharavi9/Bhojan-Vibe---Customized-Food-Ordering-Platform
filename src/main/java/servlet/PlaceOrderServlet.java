package servlet;

import com.google.gson.Gson;
import db.OrderDAO;
import db.DBConnection;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.util.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"message\": \"User not logged in.\"}");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Order[] items = gson.fromJson(reader, Order[].class);

        if (items == null || items.length == 0) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"message\": \"Empty cart.\"}");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            OrderDAO dao = new OrderDAO(conn);
            boolean success = dao.placeOrder(userId, Arrays.asList(items));

            if (success) {
                response.getWriter().write("{\"message\": \"Order placed successfully.\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"message\": \"Order failed. Try again.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\": \"Server error.\"}");
        }
    }
}
