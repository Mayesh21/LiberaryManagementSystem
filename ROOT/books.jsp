<html>
<body>
<head>


<style>

body{	
	background-image:url("fiction.jpg");
	background-size:100% 400%;	
	background-repeat:no-repeat;
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
<input class="xy" type="submit" value="<--"><br></form>


<%@ page language="java" import="java.sql.*" %>
<%

	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String S=(String)session.getAttribute("uname");	
		
	Class.forName("org.postgresql.Driver");	
	con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	
	st=con.createStatement();
	rs=st.executeQuery("select img,name from books");
	
	%><left><br><%
	while(rs.next())
	{%>
<img src=" <%	out.println(rs.getString(1)); %> " height="75px" width="75px"><br>
	 <% out.println(rs.getString(2)); %><br><br> <%
	}
%>	
