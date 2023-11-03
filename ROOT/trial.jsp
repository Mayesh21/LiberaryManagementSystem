<%@ page language="java" import="java.sql.*" %>
<%
		String S=(String)session.getAttribute("uname");
	String languages="";
	String lang[]=request.getParameterValues("list");
	for(int i=0;i<lang.length;i++)
	{
		languages+=lang[i]+" ";
	}
	try{
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1:5432/AG25","AG25","");
		Statement st=con.createStatement();
		int i=st.executeUpdate("insert into mem_book values(?,?,?)");
		st.setString(1,S);
		st.setInt(2,Integer.parseInt(languages));
		st.setInt(3,0);
	}
	catch(Exception ee){}
%>
