<%@ page language="java" import="java.sql.*"%>
<%

	String user=request.getParameter("unm");	
	String pass=request.getParameter("pwd");
	String name=request.getParameter("name");	
	String cno=request.getParameter("cno");
	String addr=request.getParameter("addr");	
	
	try{
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");
		PreparedStatement pst=null;
		pst=con.prepareStatement("insert into member_login values(?,?,?,?,?)");
		
		pst.setString(1,name);
		pst.setString(2,user);
		pst.setString(3,pass);
		pst.setString(4,cno);
		pst.setString(5,addr);

		int i=pst.executeUpdate();

		if(i>0)
		{
			response.sendRedirect("login.html");
		}
		else
		{
			response.sendRedirect("signup.html");
		}
	}
	catch(Exception e)
	{}
%>
