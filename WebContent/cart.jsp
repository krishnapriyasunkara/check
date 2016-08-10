<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
<body>
<table border="2">
                <tr>
              <th>Phone Id</th>
            <th>Model</th>
            <th>Price</th>
            <th>Specs</th>
                <th>photo</th>
                </tr>
      <%
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con =
                DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","krishna");
                String val = request.getParameter("some");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from phonesdb where id='"+val+"'");
            while(rs.next())
            {
            %>
            <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td> 
            <td><%=rs.getString(4)%></td>
            <td><img src="pics/<%=val%>.png" height="90" width="70"/></td>
            <td><a href="success.jsp">confirm payment</a></td>
            </tr>
            <%
            String ide=rs.getString(1);
            session.setAttribute("id",ide);
            }
            %>
           </table>
           </body>
           </html>