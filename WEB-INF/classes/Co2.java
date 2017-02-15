import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/Co2")
public class Co2 extends HttpServlet
{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		try
		{
			//HttpSession session = req.getSession();

			//String email = session.getAttribute("email").toString();
			//out.print("Welcome    :    " + email);
			
			//res.sendRedirect("../Actualite.jsp");

			out.print("<a href='../Actualite.jsp'> Voir votre Actualite</a>");


		}
		catch(Exception e)
		{
		     out.println("<h2>"+e+"</h2>");
		}
    }
}




