<html>
<head>
<style>
body{
	background-image:url("issue.jpg");
	height:100px;
	width:100px;
	
	background-size:cover;	
	background-repeat:no-repeat;
 }
.details{
	background:#4282A2;
	height:400px;
	width:400px;
	opacity:0.9;
	position:relative;
	top:60px;
	left:40px;
	bottom:40px;
	text-align:left;
	border:5px solid white;
	border-radius:8px;
	
}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}
</style></head>
<body>
<%@ page language="java" import="java.sql.*" %>
<form method="get" action="librarian.jsp">
<input class="xy" type="submit" value="<--"><br></form><div class="details"><b><font color="white"><br><br>
<%
	String S=(String)request.getParameter("m_name");
	
	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	pst=con.prepareStatement("select name from books,mem_book,member_login where books.book_id=mem_book.book_id and member_login.u_name=mem_book.u_name and mname=?");

	pst.setString(1,S);
	 
	

	rs=pst.executeQuery();
	
	if(!rs.next())
	{%>
		<center><% out.println("No books issued by "+S);%></center>
		
	<%}
	else
	{%>
		
		&nbsp&nbsp<%out.println("Books issued by "+S+" are: "); %>
		<ol><%
		rs=pst.executeQuery();
		while(rs.next())
		{%>
			<li> <% out.println(rs.getString(1)); %> </li><%
		}
	}%></ol>
</div></font></b>
</body></html>
