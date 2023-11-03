<%@ page language="java" import="java.sql.*" %>
<%

	String user=request.getParameter("aname");	
	String pass=request.getParameter("apwd");

	Class.forName("org.postgresql.Driver");	
	Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

	PreparedStatement pst=null;
	ResultSet rs;
	
	pst=con.prepareStatement("select * from librarian where lib_id=? and password=?");
	pst.setString(1,user);
	pst.setString(2,pass);
	
	rs=pst.executeQuery();
	if(!rs.next())
	{
		session.setAttribute("aname",user);
		response.sendRedirect("librarian.jsp");
	}
	else
	{
		response.sendRedirect("nosuccess.html");
	}
	
%>
