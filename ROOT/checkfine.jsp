<html>
<head>
<style>
body{
	background-color:pink;
	background-repeat:no-repeat;	
 }
.pq {
	background-color:darkblue;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
</style>
</head>
<body>

<form method="get" action="main.jsp">
&nbsp&nbsp<input class="pq" type="submit" value="Home"><br></form>
<%@ page language="java" import="java.sql.*" %>
<%
	
	String S=(String)session.getAttribute("uname");

	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;

	pst=con.prepareStatement("select finee from fine where u_name=?");
	pst.setString(1,S);
	rs=pst.executeQuery();
	if(rs.next())
	{%>
		<center> <% out.println("Total Pending Fine by "+S+" : "+rs.getInt(1)); %> </center>
	<%}
	else
	{	out.println("No Pending Fine by "+S);	}
%>
</body>
</html>
