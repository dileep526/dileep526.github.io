<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<% 
String upc=request.getParameter("UPC");
String piece=request.getParameter("pieces");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
	Statement st=con.createStatement();
	int p=Integer.parseInt(piece);

	ResultSet res=st.executeQuery("select * from stock where upc="+upc);
	while(res.next())
		{
		p=p+res.getInt(3);
		}
	int rs=st.executeUpdate("update stock set pieces="+p+" where upc="+upc);
	out.println("Updated succesfully");
	
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
<a href=index.html>Home</a>
</body>
</html>