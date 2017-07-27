<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<form action=update1.jsp method=post>
<table>
<tr>
<td>Enter UID number of item:</td>
<td><input type=text name="UPC"></td>
</tr>
<tr>
<td>Enter the new stock of Item:</td>
<td><input type=text name="pieces"></td>
</tr>
<tr>
<td><input type=submit></td>
</tr>
</table>
</form>

</body>
</html>