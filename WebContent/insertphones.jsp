<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>phone insertion Page</title>
    </head>
    <body>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con =
        DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","krishna");
        Statement st = con.createStatement();

            String phnid=request.getParameter("id");
            String model=request.getParameter("model");
             
             String price=request.getParameter("price");
             String specs=request.getParameter("specs");
       
                  String path=request.getParameter("photo");
                  String path1="E:/km/check2/WebContent/pics/"+path; 
                   
             
             //String status="pending";
             PreparedStatement ps=con.prepareStatement("insert into phonesdb values(?,?,?,?,?)");
             
             ps.setString(1,phnid);
             ps.setString(2,model);
             ps.setString(3,price);
             ps.setString(4,specs);
             //ps.setString(5,status);
             
              File f=new File(path1);
           int s=(int)f.length();
           FileInputStream fis=new FileInputStream(f);
           ps.setBinaryStream(5,fis,s);
           
             int k=ps.executeUpdate();
             if(k!=0)
             {
                 out.println("inserted sucessfully");
             }
             %>
             
             
                            
                            
    </body>
</html>
