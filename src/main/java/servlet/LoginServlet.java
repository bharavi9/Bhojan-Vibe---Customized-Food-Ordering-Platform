package servlet;

import db.UserDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            UserDAO dao = new UserDAO();
            boolean isValid = dao.login(email, password);

            if (isValid) {
                HttpSession session = req.getSession();
                session.setAttribute("email", email);
                res.sendRedirect("menu.jsp"); // Redirect to menu page
                req.setAttribute("msg","You logged in successfully!");

            } else {
                res.sendRedirect("login.jsp?error=1"); // Redirect back to login with error
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp"); // Redirect to a generic error page
        }
    }
}
