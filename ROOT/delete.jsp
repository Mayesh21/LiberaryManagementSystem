<html>
<head>
<style>

body{
	background-image:url("library.jpg");	
	background-repeat:no-repeat;	
	height:100%;
	width:100%;
 }
div{
	background-color:orange;
	opacity:0.9;
	border:2px solid white;
	border-radius:25px;
	height:40%;
	width:60%;
	position:relative;
	top:20px;
	left:10px;
	bottom:60px;
}
h2{
	color:white;
  }

</style>
</head>
<body><br>
<h2> <center> Delete a Book </center></h2><br><br>
<form method="get" action="delete.jsp">
<div><br><br>
&nbsp&nbsp&nbspEnter Book Name<br>
&nbsp&nbsp&nbsp<input type="text" name="bname" placeholder="Enter book name"><br><br>

&nbsp&nbsp&nbsp<input type="submit" name="s" value="delete">
</div>
</form>

<%@ page language="java" import="java.sql.*" %>
<%
//	try{
	String bname=request.getParameter("bname");	

	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	pst=con.prepareStatement("delete from books where name=?");
	pst.setString(1,bname);

	int i=pst.executeUpdate();
	if(i>0)
		out.println("Success");
	else
		out.println("Failed");
//	}catch(Exception ee){}
	
%>



</body>
</html>
