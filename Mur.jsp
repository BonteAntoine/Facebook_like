<!DOCTYPE html>
<%@page import="com.database.DataBaseUtils"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@include file="template/header.inc" %>



<%
    if (tableName.trim().length() > 0)
    {
        Connection c = null;
        try
        {
            c = new Connexion("/home/infoetu/coolsaes/tomcat/webapps/Facebook_like/sql/facebook_like.db");
	    c.connect;
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from publications");
            ResultSetMetaData rsmd = rs.getMetaData();
 
            out.write("<table>");
            out.write("<tr style=\"background:#f0f0f0\">");
            for (int i = 1; i <= rsmd.getColumnCount(); i++)
            {
                out.write("<td>" + rsmd.getColumnName(i) + "</td>");
            }
            out.write("</tr>");
 
            while (rs.next())
            {
                out.write("<tr>");
                for (int i = 1; i <= rsmd.getColumnCount(); i++)
                {
                    out.write("<td>" + rs.getString(i) + "</td>");
                }
                out.write("</tr>");
            }
            out.write("</table>");
        }
        catch (Exception e)
        {
 
        }
        finally
        {
		c.closeConnection(connection);
        }        
    }
%>
</body>

