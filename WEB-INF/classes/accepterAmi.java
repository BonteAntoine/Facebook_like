import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/accepterAmi")
public class accepterAmi extends HttpServlet{
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
	String accepterAmiA ="INSERT INTO amitiees(dateamitiee, userA, userB) VALUES (NOW(),?,?);";
	String accepterAmiB = "INSERT INTO amitiees(dateamitiee, userA, userB) VALUES (NOW(),?,?);";

	String reqSuppr = "Select idDemande from demandeAmi where userA = '"+userA+"';";
	String supprimerDemande = "DELETE FROM demandeAmi WHERE idDemande = (?) ;";
     

    PreparedStatement ps1 = c.getConnection().prepareStatement(accepterAmiA);
	ps1.setString(2, userA);
	ps1.setString(3, userB);
	ResultSet rs1 = ps1.executeQuery();


	PreparedStatement ps2 = c.getConnection().prepareStatement(accepterAmiB);
	ps2.setString(2, userB);
	ps2.setString(3, userA);
	ResultSet rs2 = ps2.executeQuery();


	/* Creation de l objet gerant les requetes */
	Statement statement3 = c.getConnection().createStatement();

    /* Execution d'une requete de lecture */
    ResultSet rs4 = statement3.executeQuery(reqSuppr);
    String idDemande = "";

    if(rs4.next())
    {
	    idDemande = rs4.getString("idDemande");
	}else{
	    idDemande = ""; 
	}

	PreparedStatement ps3 = c.getConnection().prepareStatement(supprimerDemande);
	ps3.setString(1, idDemande);
	ResultSet rs3 = ps3.executeQuery();

	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}




