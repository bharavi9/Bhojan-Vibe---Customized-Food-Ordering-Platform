package servlet;

import db.MenuDAO;
import model.MenuItem;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	MenuDAO dao = new MenuDAO();
        List<MenuItem> items = dao.getAllMenuItems();
        request.setAttribute("menuItems", items);
        RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/menu.jsp");
        rd.forward(request, response);
    }
}
