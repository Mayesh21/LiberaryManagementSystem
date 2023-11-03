<html>
<head>
<style>
body{
	background-image:url("success.jpg");
	background-size:100% 400%;	
	background-repeat:no-repeat;	
 }
.update{
	
	background:#800000;
	height:100px;
	width:400px;
	opacity:0.9;
	position:relative;
	top:60px;
	left:40px;
	bottom:40px;
	text-align:left;
	border:5px solid white;
	border-radius:8px;
	color:white;
	
}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}		
	
</style>
</head>





<form method="get" action="updatelib.jsp"><br>
&nbsp&nbsp<input class="xy" type="submit" value="<--"></form>
<div class="update">

<%@ page language="java" import="java.sql.*,java.text.SimpleDateFormat, java.util.Date" %>
<%
	int flag=0;
	String bname=request.getParameter("bname");
	String bqty=request.getParameter("bqty");

	try{
		Class.forName("org.postgresql.Driver");	
		Connection con1=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");
		ResultSet rs=null;
		PreparedStatement pst2=null;
	PreparedStatement pst3=null;
	pst3=con1.prepareStatement("select book_id from books where name=?");
	pst3.setString(1,bname);
	rs=pst3.executeQuery();
	if(rs.next()==false)
	{}
	else
		flag=1;
	if(flag==1)
	{
		pst2=con1.prepareStatement("update books set quantity=? where name=?");
		pst2.setInt(1,Integer.parseInt(bqty));
		pst2.setString(2,bname);		
		pst2.executeUpdate();
		response.sendRedirect("updatesuccess.jsp");
	}
	else%>
		<h2><center> <%out.println("Book does not exist"); %> </center></h2>
	<%}catch(Exception ee){}
%>
</div>
</form>
</html>
