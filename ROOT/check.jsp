<html><head>
<style>
body{
	background-image:url("check.jpg");
	background-size:100% 400%;	
	background-repeat:no-repeat;	
 }
.check{
	
	background:#800000;
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
	
	
</style>
</head>
 <body><div class="check">
<%@ page language="java" import="java.sql.*" %>
<%

	String S=(String)session.getAttribute("uname");
	if(S=="" || S==null)
	{
		response.sendRedirect("signup.html");
	}
	else
	{
		response.sendRedirect("errormem.html");
	}
%></div>
</body> </html>
