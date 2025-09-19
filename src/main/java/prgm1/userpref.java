package prgm1;
import java.io.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userpref
 */
@WebServlet("/userpref")
public class userpref extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userpref() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String email=request.getParameter("email");
		Cookie c1=new Cookie("firstname",firstname);
		response.addCookie(c1);
		
		Cookie c2=new Cookie("lastname",lastname);
		response.addCookie(c2);
		
		Cookie c3=new Cookie("email",email);
		response.addCookie(c3);
		response.sendRedirect("userprintpref");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
