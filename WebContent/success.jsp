<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Page</title>
    </head>
    <body>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con =
        DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","krishna");
        Statement st = con.createStatement();
        out.println("your order for :");
        String ide=(String)session.getAttribute("id");
        ResultSet rs=st.executeQuery("select * from phonesdb where id='"+ide+"'");
        if(rs.next())
        {
        	String item=rs.getString(2);
        out.println(item+" is confirmed");
        }
        else
        {
        	out.println("try again later");
        }
        %>
        </body>
        </html>
