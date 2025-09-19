package servlet;

import db.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new User(name, email, password);

        try {
            UserDAO dao = new UserDAO();
            boolean registered = dao.register(user);

            if (registered) {
                res.sendRedirect("login.jsp"); // Redirect to login page after successful registration
            } else {
                res.sendRedirect("register.jsp?error=1"); // Show error message
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp"); // Fallback error page
        }
    }
}
