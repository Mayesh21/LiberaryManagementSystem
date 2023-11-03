<html>
<head>
<style>
body{
	background-color:thistle;
	opacity:0.8;
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
&nbsp&nbsp<input class="xy" type="submit" value="HOME"><br></form>
<br><h3><center>Book Successfully Issued!!</center></h3><br><hr><br>
<%@ page language="java" import="java.sql.*" %>
<%
	String str=null;
	
	String S=(String)session.getAttribute("uname");	
	

	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	pst=con.prepareStatement("select mname from member_login where u_name=?");
	pst.setString(1,S);
	rs=pst.executeQuery();
	while(rs.next()){
		//out.println(rs.getString(1));
		str = rs.getString(1);
		
	}
		
	PreparedStatement pst1=null;
	ResultSet rs1;
%>	
	<h4>Books Issued by <% out.println(S); %> are : </h4>
	
	<h3>&nbsp&nbspBooks</h3>
	<ul>	
<%
	pst1=con.prepareStatement("select name from books,member_login,mem_book where books.book_id=mem_book.book_id and member_login.u_name=mem_book.u_name and mname=?");
	pst1.setString(1,str);
	rs1=pst1.executeQuery();
	
	while(rs1.next())
	{%>
		
		
		<li><%out.println(rs1.getString(1));%></li><br>
			
<%
	}
%>
	</ul>
</body></html>
