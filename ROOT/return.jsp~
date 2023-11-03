<html>
<head>
<style>
body{
	background-image:url("03.png");
	background-size:100% 400%;	
	background-repeat:no-repeat;	
 }

a{		
	text-decoration:none;
	color:white;
	font-size:20px;
	font-style:bold;
}
a:hover{
	color:black;
	background:sienna;
	border-radius:8px;
	width:300px;
	height:48px;
	display:inline-block;
	shadow:black;
	
	}
table{
	background-color:peru;
	opacity:0.8;
	width:40%;
}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
</style>
</head>
<body>

<form method="get" action="main.jsp">
&nbsp<input class="xy" type="submit" value="<--">
</form>


<%@ page language="java" import="java.sql.*" %>
<%

	String S=(String)session.getAttribute("uname");		
	
	try{
	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	
	
	pst=con.prepareStatement("select books.book_id,name,img from books,member_login,mem_book where books.book_id=mem_book.book_id and member_login.u_name=mem_book.u_name and mem_book.u_name=?");
	pst.setString(1,S);
	rs=pst.executeQuery();
	if(rs.next()!=false)
	{
	%><center>
	<br><br>
	<table cellspacing=5px cellpadding=8px border=1px>
	<tr>
	
	<th>Name</th>
	<th>Image</th>
	</tr><%
	rs=pst.executeQuery();
	while(rs.next())
	{
	%>
	<tr>
	<td><a href="finalret.jsp?value=<% out.println(rs.getInt(1));%>">&nbsp<% out.println(rs.getString(2));%></td>
	<td><center><img src=" <%	out.println(rs.getString(3)); %> " height="75px" width="75px"></center><br></td>
	</tr>
	<%
	}}
	else{
		out.println("No books issued");
	}
	}catch(Exception ee){}
	
	
%></body>
</html>
