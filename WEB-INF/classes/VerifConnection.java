import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/VerifConnection")
public class VerifConnection extends HttpServlet
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

			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String mdp = req.getParameter("mdp");
			
			String verifReq="select * from utilisateurs where email = ? and mdp = ?; ";
     	  		PreparedStatement ps = c.getConnection().prepareStatement(verifReq);
			
			ps.setString(1, email);
			ps.setString(2, mdp);
				ResultSet rs = ps.executeQuery();

			if(rs.next())//test si la req est bonne ou non pour vérifier la connection
			{
				res.sendRedirect("Connection");
			}

			res.sendRedirect("../");//Facebook_like

		}
		catch(Exception e)
		{
		     out.println("<h2>"+e+"</h2>");
		}
    }
}




