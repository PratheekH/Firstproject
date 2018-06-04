<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
String user=request.getParameter("userid");
//session.putValue("userid",user);
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useSSL=true","root","Pratheek@18");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from user_login where username='"+user+"'");
if(rs.next())
{
	if(rs.getString(3).equals(pwd)){
		out.println("Welcomes"+user);
	}
	else
	{
		out.println(pwd+" "+rs.getString(2));
		out.println("Invalid password");
	}
}
//else
%>
<a href="index.html">Home</a>
</body>
</html>