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
 * Servlet implementation class userprintpref
 */
@WebServlet("/userprintpref")
public class userprintpref extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userprintpref() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Cookie[] cookie=request.getCookies();
		String name="";
		String value;
		PrintWriter out=response.getWriter();
		out.println("<html><head><title>GET AND POST</title></head>");
		out.println("<body><h1>user pref</h1>");
		for(int i=0;i<cookie.length;i++) {
			 name=cookie[i].getName();
			value=cookie[i].getValue();
			out.println("<p>"+name+"</p>");
			out.println("<p>"+value+"</p>");
		}
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
