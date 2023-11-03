<html>
<head><style>
table{
	background-color:#393f4d;
	background-size:100% 100%;	
	background-repeat:no-repeat;	
	width:500px;
	height:400px;
	opacity:0.7;
 }
tr{		
	text-decoration:none;
	color:white;
}
body{
	background:lightgrey;
}
a{		
	text-decoration:none;
	color:white;
}
a:hover{	
	 color:black;
	background:#26A69A;
	border-radius:8px;
	width:250px;
	height:35px;
	display:inline-block;
	shadow:black;
}
table{
	border:6px ridge white;
	}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
</style></head>
<body>
<form method="get" action="type.jsp">
<input class="xy" type="submit" value="<--"><br></form>

<%@ page language="java" import="java.sql.*" %>
<%

	String S=(String)session.getAttribute("uname");	
	String a="Encyclopedia";	
	

	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	
	
	pst=con.prepareStatement("select book_id,name,img from books where cat_name=?");
	pst.setString(1,a);
	%><center>
	<table background-img="03.png" cellspacing=5px cellpadding=15px>
	<tr>
	
	<th>Name</th>
	<th>Image</th>
	</tr><%
	rs=pst.executeQuery();
	while(rs.next())
	{
	%>
	<tr>
	<td>&nbsp&nbsp&nbsp&nbsp<a href="success.jsp?value=<% out.println(rs.getInt(1));%>"><% out.println(rs.getString(2));%></td>
	<td><img src=" <%	out.println(rs.getString(3)); %> " height="75px" width="75px"><br></td>
	</tr>
	<%
	}
	
%>
	<br><br><br>

</body>
</html>
