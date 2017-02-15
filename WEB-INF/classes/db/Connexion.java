package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

public class Connexion 
{
	private String DBPath = "/home/infoetu/bontea/tomcat/webapps/Facebook_like/sql/facebook_like.db";
    //private String DBPath = "../../../sql/facebook_like.db";
    private Connection connection = null;
    private Statement statement = null;
 
    public Connexion() 
    {
    }

    public Connection getConnection()
    {
	return this.connection;
    }
 
    public void connect() 
    {
        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:" + DBPath);
            statement = connection.createStatement();
            System.out.println("Connexion a " + DBPath + " avec succès");
        } catch (ClassNotFoundException notFoundException) {
            notFoundException.printStackTrace();
            System.out.println("Erreur de connexion");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
            System.out.println("Erreur de connexion");
        }
    }
    
    public void setDBPath(String path)
    {
	    this.DBPath = path;
    }
    
    public String getDBPath()
    {
	    return this.DBPath;
    }
 
    public void close() 
    {
        try {
            connection.close();
            //statement.close();
        } catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }

    public ResultSet select(String rq) 
    {
       ResultSet resultat= null;
       try {
           resultat = statement.executeQuery(rq);	 
       } catch (SQLException e) {
           e.printStackTrace();
           System.out.println("Erreur dans la requête : " + rq);
       }
       return resultat;  
   }

    public void IUD(String rq)
    {	
	try{
	    statement.executeUpdate(rq);
	}catch(SQLException e){
	   e.printStackTrace();
           System.out.println("Erreur dans la requête : " + rq);
	}
       
    }
    
}
