import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/Connection")
public class Connection extends HttpServlet
{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		Connexion c = null;
		
		try
		{
			c = new Connexion();
			c.connect();

			String str = req.getParameter("email");

			HttpSession session = req.getSession();
			session.setAttribute("email", str);

			//res.sendRedirect("../Actualite.jsp");
			res.sendRedirect("Co2");
		}
		catch(Exception e)
		{
		     out.println("<h2>"+e+"</h2>");
		}
    }
}




