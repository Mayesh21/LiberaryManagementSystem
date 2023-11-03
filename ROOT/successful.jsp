<html>
<head>
<style>
body{
	background-image:url("success.jpg");
	background-size:100% 500%;	
	background-repeat:no-repeat;
	color:white;	
 }
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
h3{
	height:35px;
	width:400px;
	background-color:black;
	border-radius:6px;
	text-align:center;
}
</style>
</head>
<body>
<form method="get" action="main.jsp">
<input class="xy" type="submit" value="Home">
</form>
<hr><br>
<center>
<h2>Book returned successfully</h2>
</center><br>
<hr>


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
	<center><h3> <% out.println("Total Pending Fine by "+S+" : "+rs.getInt(1)); %></h3></center>
	<%}
	else{%>
		<center><h3><% out.println("No Pending Fine by "+S); %></h3></center>
	<%}%>

</body>
</html>
