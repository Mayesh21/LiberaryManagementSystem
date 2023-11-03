<html>
<head>

<script>
function validateForm()
{
 var bname=document.forms["myForm"]["bname"].value;
 var bimg=document.forms["myForm"]["bimg"].value;
 var bauth=document.forms["myForm"]["bauth"].value;
 var bqty=document.forms["myForm"]["bqty"].value;
 //var r1=document.forms["myForm"]["r1"].value;
 var r1=document.getElementsByName('r1');
 /*var fileInput=document.getElementById('file');
 var filePath=fileInput.value;
 var allowed=/(\.jpg|\.png)$/i;*/
  
 if(bname==null || bname=="")
 {	alert("Book Name field cannot be empty");
	document.myForm.bname.focus();
	return false;
 }
 if(!isNaN(bname))
 {
	alert("Book Name should have only Alphabets");
	document.myForm.bname.focus();
	return false;
 }
 if(bimg==null || bimg=="")
 {	alert("Book image name field cannot be empty");
	document.myForm.bimg.focus();
	return false;
 }
 /*if(!allowed.exec(filePath))
 {	alert("Invalid Book image extension");
	document.myForm.uname.focus();
	return false;
 }*/
 if(bauth==null || bauth=="")
 {	alert("Book Author name field cannot be empty");
	document.myForm.bauth.focus();
	return false;
 }
 if(!isNaN(bauth))
 {
	alert("Book Author should have only Alphabets");
	document.myForm.bauth.focus();
	return false;
 }
 if(bqty==null || bqty=="")
 {	alert("Book Quantity field cannot be empty");
	document.myForm.bqty.focus();
	return false;
 }
 if(isNaN(bqty))
 {
 	alert("Quantity should contain only digits !");
	document.myForm.bqty.focus();
	return false;
 }
 if(!(r1[0].checked || r1[1].checked || r1[2].checked ))
 {	alert("Category field cannot be empty");
	return false;
 }
 else
 	alert("Inserted!!");
 
		
}
</script>

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
	height:90%;
	width:40%;
	position:relative;
	top:20px;
	left:10px;
	bottom:60px;
}
h2{
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
<body>
<form method="get" action="librarian.jsp">
&nbsp&nbsp<input class="xy" type="submit" value="<--"><br></form>

<br>
<h2> <center> Insert a Book </center></h2><br><br>
<form name="myForm" method="get" onsubmit="return validateForm()">
<div><br><br>


&nbsp&nbsp&nbspEnter Book Name<br>
&nbsp&nbsp&nbsp<input type="text" name="bname" placeholder="Enter book name"><br><br>

&nbsp&nbsp&nbspEnter Book Image<br>
&nbsp&nbsp&nbsp<input type="text" name="bimg" placeholder="Enter book image"><br><br>

&nbsp&nbsp&nbspEnter Book Author<br>
&nbsp&nbsp&nbsp<input type="text" name="bauth" placeholder="Enter book author"><br><br>

&nbsp&nbsp&nbspEnter Book Quantity<br>
&nbsp&nbsp&nbsp<input type="text" name="bqty" placeholder="Enter book quantity"><br><br>

&nbsp&nbsp&nbspEnter Book Category:&nbsp&nbsp
<input type="radio" name="r1" value="fiction">Fiction<br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="radio" name="r1" value="non-fiction">Non-Fiction<br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="radio" name="r1" value="encyclopedia">Encyclopedia<br>

&nbsp&nbsp&nbsp<button class="xy" value="Update" >Insert </button>
</div>


<%@ page language="java" import="java.sql.*" %>
<%
try{
	
	
	String bname=request.getParameter("bname");
	String bimg=request.getParameter("bimg");
	String bauth=request.getParameter("bauth");	
	int bqty=Integer.parseInt(request.getParameter("bqty"));
	String bcat=request.getParameter("r1");	
	
	
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

		PreparedStatement pst=null;
		pst=con.prepareStatement("insert into books values(DEFAULT,?,?,?,?,?)");		
		pst.setString(1,bname);
		pst.setString(2,bimg);
		pst.setString(3,bauth);
		pst.setInt(4,bqty);
		pst.setString(5,bcat);	
		int i=pst.executeUpdate();
		/*if(i>0)
		{%>
		<h1 color="red">	<% out.println("Success"); %> </h1>
		<%}
		else
			out.println("Failed");
*/	}
	catch(Exception e){}
%>
</form>	
</body>
</html>

