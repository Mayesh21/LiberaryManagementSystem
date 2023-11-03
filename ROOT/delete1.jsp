<html>
<head>

<style>
body{
	background-image:url("success.jpg");
	background-size:100% 400%;	
	background-repeat:no-repeat;
	color:white;	
 }
.lib{
	
	background:#800000;
	height:100px;
	width:400px;
	opacity:0.8;
	position:relative;
	
	text-align:center;
	border:5px solid white;
	border-radius:8px;
	
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
<form method="get" action="librarian.jsp"><br>
&nbsp&nbsp<input class="xy" type="submit" value="<--"></form><br><br>
<div class="lib">
<%@ page language="java" import="java.sql.*" %>
<%
	try{
	int flag=0;
	int var=0;
	String bname=request.getParameter("bname");	

	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	PreparedStatement pst1=null;
	PreparedStatement pst2=null;
	ResultSet rs;
	ResultSet rs1;
	ResultSet rs2;	

	pst1=con.prepareStatement("select book_id from books where name=?");
	pst1.setString(1,bname);
	rs1=pst1.executeQuery();
	while(rs1.next())
	{
		var= rs1.getInt(1);
	}

	pst2=con.prepareStatement("select u_name from mem_book where book_id=?");
	pst2.setInt(1,var);
	rs2=pst2.executeQuery();
	while(rs2.next())
	{
		flag=1;
	}
	if(flag==0)
	{
		pst=con.prepareStatement("delete from books where name=?");
		pst.setString(1,bname);

		int i=pst.executeUpdate();
		if(i>0)
		{
			out.println("Book deleted!!");
		}

		else
		{
			out.println("Book does not exist!!");
	
		}
	}
	else{%>
		<b> <% out.println("Cannot delete the Book since it is issued by some members. You can delete the book once returned by all the members."); %> </b>
	<%}}catch(Exception ee){}
	
%>
</div>
</html>

