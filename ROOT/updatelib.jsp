<html><head>

<script>
function validateForm()
{
 var bname=document.forms["myForm"]["bname"].value;
 var bqty=document.forms["myForm"]["bqty"].value;
 
 if(bname==null || bname=="")
 {	alert("Book Name Field cannot be empty");
	document.myForm.bname.focus();
	return false;
 }
 if(!isNaN(bname))
 {
	alert("Book Name should have only Alphabets");
	document.myForm.bname.focus();
	return false;
 }
 if(bqty==null || bqty=="")
 {	alert("Quantity cannot be empty");
	document.myForm.bqty.focus();
	return false;
 }
 if(isNaN(bqty))
 {
 	alert("Quantity should contain only digits !");
	document.myForm.bqty.focus();
	return false;
 }
}
</script>
<style>
body{
	background-image:url("success.jpg");
	background-size:100% 400%;	
	background-repeat:no-repeat;	
 }
.lib{
	
	background:#800000;
	height:400px;
	width:600px;
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
<form method="get" action="librarian.jsp">
&nbsp&nbsp<input class="xy" type="submit" value="<--"><br></form>
<body><br><br><center><div class="lib"><br><br><br>
<b><font color="white" face="verdana">
<form name="myForm" method="get" onsubmit="return validateForm()" action="updatefinal.jsp">

&nbsp&nbsp&nbspEnter Book Name<br>
&nbsp&nbsp&nbsp<input type="text" name="bname" placeholder="Enter book name"><br><br>
&nbsp&nbsp&nbspEnter Quantity<br>
&nbsp&nbsp&nbsp<input type="text" name="bqty" placeholder="Enter Quantity"><br><br>
&nbsp&nbsp&nbsp<input class="xy" type="submit" name="s" value="Update">
</b></font></form><center>
</div>
</body>
</html>



