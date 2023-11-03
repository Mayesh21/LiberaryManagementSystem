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
	background:orange;
	border-radius:8px;
	width:180px;
	height:25px;
	display:inline-block;
	shadow:black;
	
	}
.b{
	
	height:100%;
	width:100%;
 }
.x{
	color:white;
	background-color:orange;
	padding:8px 15px;
	border-radius:4px;
	
}
.x:hover{
	color:white;
	background:brown;
	padding:8px 15px;
	display:inline-block;
	box-shadow:3px 3px lightgrey;
	}

.c{	background-color:orange;
	opacity:0.9;
	border:2px solid white;
	border-radius:25px;
	height:43%;
	width:40%;
	position:relative;
	top:150px;
	left:300px;
	bottom:40px;
}
.f{	background-image:url("books1.jpg");
	height:100%;
	width:100%;
	text-align:center;


  }
.k{		
	text-decoration:none;
	color:white;
}
.k:hover{
	color:white;
	background:brown;
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
<font color="white">
<h1> <center> Fergusson College Library </center></h1>
<p align="right">
<%@ page language="java" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat" %>
<%
	String S=(String)session.getAttribute("uname");
	if(S=="" || S==null)
	{}
	else
	{
		out.println("Welcome "+S);
	}%>
	<br>
	<%
	Date d1=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
	String msg=sdf.format(d1);
	out.println(msg);
%></font><br><br>
<%@ page language="java" import="java.sql.*" %>
<%
	S=(String)session.getAttribute("uname");
	if(S=="" || S==null)
	{
	}
	else
	{%>
	<%@ page language="java" import="java.sql.*" %>
<%

	try{
	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	
	
	pst=con.prepareStatement("select books.book_id,name,img from books,member_login,mem_book where books.book_id=mem_book.book_id and member_login.u_name=mem_book.u_name and mem_book.u_name=?");
	pst.setString(1,S);
	rs=pst.executeQuery();
	if(rs.next())
	{%>
		<button class="x" onclick="location.href='return.jsp'" name="s1"><b> Return </b> </button>&nbsp&nbsp
	<%}
	else
	{%>
		<button class="x" onclick="alert('No books issued !!')" name="s1"><b> Return </b> </button>&nbsp&nbsp
	<%}%>

	<button class="x" onclick="location.href='logout.jsp'" name="s1"><b> Logout </b> </button>
	<%}
	catch(Exception ee){}
	}
%>
</p>
<%@ page language="java" import="java.sql.*" %>
<%
	S=(String)session.getAttribute("uname");
	if(S=="" || S==null)
	{
	%>
<button class="xy" onclick="location.href='adminlogin1.jsp';"> Librarian Login </button>
<%
	}
	else
	{
		
	}%>
<hr>
<center>

<br>


<b><a href="books.jsp" > Books </a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

<%@ page language="java" import="java.sql.*" %>
<%
	S=(String)session.getAttribute("uname");
	if(S=="" || S==null)
	{
	%>
<a href="signup.html" > Membership </a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	
 
<%
	}
	else
	{
	}%>
<a href="about.html" > About Us </a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="contact.html" > Contact </a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp


<%@ page language="java" import="java.sql.*" %>
<%
	try{
	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/TYAG13","TYAG13","");

	PreparedStatement pst=null;
	ResultSet rs;
	if(S==null||S=="")
	{}
	else
	{
	pst=con.prepareStatement("select finee from fine where u_name=?");
	pst.setString(1,S);
	rs=pst.executeQuery();
	if(rs.next())
	{%>
		<a href="checkfine.jsp" > Check Fine </a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<%}
	else
	{%>
		<a href="#"  onclick="alert('No Pending Fine by Member!')"> Check Fine </a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<%}}
	}catch(Exception ee){}
%>

<%@ page language="java" import="java.sql.*" %>
<%
	S=(String)session.getAttribute("uname");
	if(S=="" || S==null)
	{
	%>
<a href="login.html" > Login </a> &nbsp&nbsp<br><br>
<%
	}
	else
	{%>
		
<%}%>

</b><br><br><hr>
</center>

<div class="f">

<div class="c">
<br>
<a class="k" href="type.jsp" > Select by Type </a><br><br><br><br>
<a class="k" href="author.jsp" > Select by Author </a> <br><br><br><br><%
	S=(String)session.getAttribute("uname");
	if(S==null||S=="")
	{%>
	&nbsp<a class="k" href="login.html"  onclick="alert('Please Login to check the books issued')"> Books Issued  </a><br>
	<%}
	else{%>
		&nbsp<a class="k" href="issued.jsp"  > Books issued </a><br>
<%
	}%>
</div>

</div>




