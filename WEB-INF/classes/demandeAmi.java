import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/demandeAmi")
public class demandeAmi extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("UTF-8");
	Connexion c = null;
	try{
	c = new Connexion("/home/infoetu/coolsaes/tomcat/webapps/Facebook_like/sql/facebook_like.db");
	c.connect();
	
	String userA = req.getParameter("userA");
	String userB = req.getParameter("userB");
	String demandeAmi ="INSERT INTO demandeAmi  (userA, userB) VALUES (?, ?);";
        PreparedStatement ps = c.getConnection().prepareStatement(demandeAmi);
	ps.setString(1, userA);
	ps.setString(2, userB);
	ResultSet rs = ps.executeQuery();

	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}




