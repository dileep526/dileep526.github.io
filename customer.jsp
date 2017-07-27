<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
	Statement st=con.createStatement();
	ResultSet res=st.executeQuery("select * from stock");
	String str="<table border='1'><tr><th>ItemName</th><th>UPC</th><th>Stock</th></tr>";

	while(res.next()){
		str+="<tr><td>"+res.getString(1)+"</td><td>"+res.getInt(2)+"</td><td>"+res.getInt(3)+"</td></td></tr>";
	}
	str+="</table>";
	out.println(str);
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
<form action=cart.jsp>
<input type=text name=upc>
<input type="submit">
</form>
</body>
</html>