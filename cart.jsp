<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%
try
{String upc=request.getParameter("upc");
int p;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
	Statement st=con.createStatement();
	ResultSet res=st.executeQuery("select * from stock where upc="+upc);
	while(res.next())
		{if(res.getInt(3)==0)
			out.println("<h1>Item cannot be added The stock is over</h1><br>");
		else
			{out.println("<h1>Item Bought successfully</h1><br>");
			p=res.getInt(3)-1;
			int rs=st.executeUpdate("update stock set pieces="+p+" where upc="+upc);
			}
		}
		
}
catch(Exception e)
{
e.printStackTrace();	
}
%>

<a href=customer.jsp>Continue Shopping</a><br>
</body>
</html>