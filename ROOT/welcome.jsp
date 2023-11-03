<html>
<head>
<style>
.a{
	background-image:url("library.jpg");	
	color:white;
	height:85%;
	width:100%;
	opacity:0.7;
	
}
</style>
</head>
<body>
<div class="a">
<center> <h1>Welcome Admin
<%
	String S=(String)session.getAttribute("aname");
	if(S=="" || S==null)
	{}
	else
	{
		out.println(S+" !!");
	}
%>
</h1> </center>


</div>

</body>
</html>
