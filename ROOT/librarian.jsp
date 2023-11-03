<html>
<head>
<meta name="viewport" content="width=device-width",initial-scale=1">
<style>
body{
	font-family:Arial;
	background-image:url("03.png");
	background-size:100% 200%;	
	background-repeat:no-repeat;	
}
a{		
	text-decoration:none;
	color:blue;
	font-size:20px;
	font-style:bold;
	text-align:center;
}
.xx{
	width:350px;
	height:250px;
	border:2px solid white;
	border-radius:8px;
	background:thistle;
	position:relative;
	left:30%;
	opacity:0.9;
}
	
a:hover{
	color:black;
	background:lightblue;
	border-radius:8px;
	width:300px;
	height:30px;
	display:inline-block;
	shadow:black;
	
	}
*{box-sizing:border-box;}

.open-button{
	text-decoration:none;
	background-color:#555;
	color:white;
	padding:16px 20px;
	border:none;
	cursor:none;
	opacity:0.8;
	bottom:500px;
	right:28px;
	width:280px;
}

.form-popup{
	display:none;
	position:fixed;
	bottom:80px;
	right:100px;
	border:3px solid #f1f1f1;
	z-index:9;
	background-color:white;
	}
.form-container{
	background-color:white;
	max-width:300px;
	padding:10px;
	}


.form-container input[type=text]
{	width:100%;
	padding:15px;
	margin:5px 0 22px 0;
	border:none;
	background:#f1f1f1;
}

.form-container input[type=text]:focus
{	background-color:#ddd;
	outline:none;
}

.form-container .btn
{	background-color:#4CAF50;
	color:white;
	padding:16px 20px;
	border:none;
	cuursor:pointer;
	width:100%;
	margin-bottom:10px;
	opacity:0.8;
}

.form-container .cancel
{	background-color:red;
}

.form-container .btn:hover, .open-button:hover
{	opacity:1;
}

.ab{
	top:0px;
	bottom:100px;
	border:1px solid;
	height:20%;
	width:100%;
	border:2px solid white;
 }
.p{
	top:23px;
}	
h1{
	color:white;
}
.pq {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}

</style>

<script>
function validateForm()
{
 var bname=document.forms["myForm"]["bname"].value;

 if(bname==null || bname=="")
 {	alert("Book Name field should not be empty");
	document.myForm.bname.focus();
	return false;
 }
 if(!isNaN(bname))
 {
	alert("Book Name should have only Alphabets");
	document.myForm.bname.focus();
	return false;
 }

 
}
</script>

<script>
function validatedetailsForm()
{
 var m_name=document.forms["mystudentForm"]["m_name"].value;

 if(m_name==null || m_name=="")
 {	alert("Student Name field should not be empty");
	document.myForm.m_name.focus();
	return false;
 }
 if(!isNaN(m_name))
 {
	alert("Students Name should have only Alphabets");
	document.myForm.m_name.focus();
	return false;
 }

 
}
</script>
 
</head>

<body>
<div class="ab">
<center><h1> Welcome Admin
<%
	String S=(String)session.getAttribute("aname");
	if(S=="" || S==null)
	{}
	else
	{
		out.println(S+" !!");
	}
%>
<%@ page language="java" import="java.sql.*" %>
<%
	S=(String)session.getAttribute("aname");
	if(S=="" || S==null)
	{
	}
	else
	{%>
		<div id="xy" class="p" align="right"> <button class="pq" class="x" onclick="location.href='liblogout.jsp'" name="s1"><b> Logout </b> </button>&nbsp&nbsp</div>
	<%}
	
	%>
</div><br><br>
<div class="xx"><br>
&nbsp&nbsp&nbsp<a href="#" onclick="opendeleteForm()">Delete a Book </a>
<div class="form-popup" id="mydeleteForm">
	<form name="myForm" action="delete1.jsp" class="form-container" onsubmit="return validateForm()">
	<h2>Delete</h2>
		&nbsp&nbsp&nbspEnter Book Name<br>
		&nbsp&nbsp&nbsp<input type="text" name="bname" placeholder="Enter book name"><br><br>
	<button type="submit" class="btn">Delete</button></form>
	<form class="form-container">
	<button type="submit" class="btn cancel" onclick="closeForm()">Close</button>
	</form>
</div><br><br><br>
&nbsp&nbsp&nbsp<a href="insert.jsp" >Insert a Book </a><br><br><br>
&nbsp&nbsp&nbsp<a href="updatelib.jsp" >Update Book Quantity</a><br><br><br>

&nbsp&nbsp&nbsp<a href="#" onclick="opendetailsForm()">Student Details</a>
<div class="form-popup" id="mydetailsForm">
	<form name="mystudentForm" action="students_details.jsp" class="form-container" onsubmit="return validatedetailsForm()">
	<h2>Student Details</h2>
		&nbsp&nbsp&nbspEnter Student name<br>
		&nbsp&nbsp&nbsp<input type="text" name="m_name" placeholder="Enter Student name"><br><br>
	<button type="submit" class="btn">Show Details</button></form>
	<form class="form-container">
	<button type="submit" class="btn cancel" onclick="closeForm()">Close</button>
	</form>
</div><br><br><br>
</div>

<script type="text/javascript">
function opendeleteForm()
{	document.getElementById("mydeleteForm").style.display="block";
}
function opendetailsForm()
{	document.getElementById("mydetailsForm").style.display="block";
}
function closeForm()
{	document.getElementById("mydeleteForm").style.display="none";
}
</script>

</body>
</html>

