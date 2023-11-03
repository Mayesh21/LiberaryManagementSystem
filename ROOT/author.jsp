<html><head><style>
body{
	background-image:url("issue.jpg");
	background-size:100% 250%;	
	background-repeat:no-repeat;	
	width:500px;
	height:400px;
	opacity:0.9;
 }
.author{
	background:#4282A2;
	height:750px;
	width:400px;
	opacity:0.7;
	position:relative;
	top:80px;
	left:60px;
	bottom:40px;
	text-align:center;
	border:5px ridge white;
	border-radius:8px;
}
a{
	text-decoration:none;
	color:white;
	font-size:20px;
	display:inline-block;
	font-style:bold;
}
a:hover{	
	 color:black;
	background:#26A69A;
	border-radius:8px;
	width:300px;
	height:25px;
	display:inline-block;
	shadow:black;
}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
</style>
<body>
<form method="get" action="main.jsp">
&nbsp&nbsp<input class="xy" type="submit" value="<--"></form>
<div class="author"><br><br>
<%@ page language="java" import="java.sql.*" %>
<%	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String S=(String)session.getAttribute("uname");	
		
	Class.forName("org.postgresql.Driver");	
	con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	st=con.createStatement();
	
	rs=st.executeQuery("select distinct(author) from books order by author");
	
	while(rs.next())
	{
	if(S==null||S=="")
	{%>
		&nbsp<a href="login.html"  onclick="alert('Please Login to issue books')"> <% out.println(rs.getString(1)); %> </a><br><br>		
	<%}
	else{%>
	<a href="authbook.jsp?value=<% out.println(rs.getString(1));%> "> <% out.println(rs.getString(1)); %> </a><br><br>
	<%}}
%>
</body>
</html>
