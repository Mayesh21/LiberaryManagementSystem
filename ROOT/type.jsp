<html>
<head>
<style>

body{
	background-image:url("images.jpg");
	background-size:1200px 800px;	
	background-repeat:no-repeat;	
 }
a{		
	text-decoration:none;
	color:lightbrown;
}
a:hover{
	color:white;
	}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
</style>
</head>
<form method="get" action="main.jsp">
&nbsp&nbsp<input class="xy" type="submit" value="<--"><br></form>

<body>
<%@ page language="java" import="java.sql.*" %>
<%
String S=(String)session.getAttribute("uname");
	/*Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String S=(String)session.getAttribute("uname");	
		
	

	Class.forName("org.postgresql.Driver");	
	con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	
	st=con.createStatement();
	
	rs=st.executeQuery("select cat_name from category");
	
	
	
	while(rs.next())
	{*/
	if(S==null||S=="")
	{%>
	<h2>&nbsp<a href="login.html"  onclick="alert('Please Login to issue books')"> Fiction </a><br>
	<h2>&nbsp<a href="login.html"  onclick="alert('Please Login to issue books')"> Non-Fiction </a><br>
	<h2>&nbsp<a href="login.html"  onclick="alert('Please Login to issue books')"> Encyclopedia </a><br>	
	<%}
	else{%>
		<h2>&nbsp<a href="fiction.jsp" > Fiction </a><br>
		<h2>&nbsp<a href="nonfiction.jsp" > Non-Fiction </a><br>
		<h2>&nbsp<a href="encyc.jsp" > Encyclopedia </a><br>
<%
	}
	
%>
</body>

