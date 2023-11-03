<html>
<head>
<script>
function validateForm()
{
 var aname=document.forms["myForm"]["aname"].value;
 var apwd=document.forms["myForm"]["apwd"].value;

 if(aname==null || aname=="")
 {	alert("Librarian name field cannot be empty");
	document.myForm.aname.focus();
	return false;
 }
 if(apwd==null || apwd=="")
 {	alert("Librarian Password field cannot be empty");
	document.myForm.apwd.focus();
	return false;
 }
 		
}
</script>


<style>
.b{	
	background-image:url("lib.jpg");
	height:100%;
	width:100%;
 
 }
.a{background-color:#deb887;
	text-align:left;
	height:40%;
	width:30%;
	border-radius:16px;
	position:relative;
	top:100px;
	left:360px;
	bottom:40px;
	opacity:0.9;
}
.x{
	color:white;
	text-size:20;
	background-color:green;
	height:40px;
	width:197px;
	border-radius:4px;
	box-shadow:lightgrey;	
}
.x:hover{
	color:white;
	background:green;
	height:45px;
	width:200px;
	display:inline-block;
	box-shadow:5px 5px grey;
	}
h1{
	color:white;
}
.aa{	background-color:sandybrown;
	text-align:center;
	height:7%;
	width:30%;
	border-radius:6px;
	
}
.xy {
	background-color:#3498DB;
	color:white;
	font-size:20px;
	border-color:#3498DB
	}	
</style>
</head>

<body >
<div class="b"><br>

<form method="get" action="main.jsp">
&nbsp&nbsp<input class="xy" type="submit" value="<--"><br></form>

<center><div class="aa">
<h1> Librarian Login </h1></div></center>
<div class="a">
<form name="myForm" method="get" action="adminlogin.jsp" onsubmit="return validateForm()">
<br>
&nbsp&nbspUsername<br>
&nbsp&nbsp<input type="text" name="aname" placeholder="Enter Username"><br><br>
&nbsp&nbspPassword<br>
&nbsp&nbsp<input type="password" name="apwd" placeholder="Enter Password"><br><br>

&nbsp&nbsp<input class="x" type="submit" value="Login" width="30">
</div>
</form> 
</div>


</body> </html>
