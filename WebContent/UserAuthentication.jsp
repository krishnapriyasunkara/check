<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head><title>Sudent Authentication</title></head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con =
DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","krishna");
Statement st = con.createStatement();
String uname = request.getParameter("username");
String pword = request.getParameter("pwd");
//String but = request.getParameter("button2");
String n = new String();
String p = new String();
if(uname.equals("admin")
		&& pword.equals("admin"))
{
	response.sendRedirect("addphones.html");
}
else
{
ResultSet rs = st.executeQuery("select user_name, password from users where user_name='"+uname+"'and password='"+pword+"'" );
if (rs.next())
{
	//out.println(but);
	session.setAttribute("user",uname);
	response.sendRedirect("catalogue.jsp");
}
else
	response.sendRedirect("login.html");
}
%>
</body>
</html>