<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>display</title>
    </head>
    <body>
        <h1>CATALOGUE</h1>
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
            
            Statement st=con.createStatement();
            String disp = request.getParameter("search");
            ResultSet rs=st.executeQuery("select * from phonesdb where specs='"+disp+"' or model='"+disp+"' or price='"+disp+"'");

            while(rs.next())
            {
              String id=rs.getString(1);
              InputStream is=rs.getBinaryStream(5);
              FileOutputStream fos=new FileOutputStream("E:/km/check2/WebContent/pics/"+id+".png");
              int k;
              while((k=is.read())!=-1)
                  fos.write(k);
                %>
            <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td> 
            <td><%=rs.getString(4)%></td>
            <td><img src="pics/<%=id%>.png" height="90" width="70"/></td>
            <td><a href="cart.jsp?some=<%=rs.getString(1)%>">buy now</a></td>
            </tr>
            <%
                 fos.close();
            }
            %>
        </table>
    </body>
    </html>
