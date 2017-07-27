<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Update</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String item=request.getParameter("newitem");
String UPC=request.getParameter("UPC");
String pieces=request.getParameter("pieces");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
	Statement st=con.createStatement();
	int rs=st.executeUpdate("insert into stock values('"+item+"',"+UPC+","+pieces+")");
	out.println("The New item is added Successfully");
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</body>
</html>