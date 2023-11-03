<html>
<%@ page language="java" import="java.sql.*,java.text.SimpleDateFormat, java.util.Date" %>
<%
	java.util.Date d1=new java.util.Date();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	String msg=sdf.format(d1);
	
%>
<%
	int flag=0;
	String S=(String)session.getAttribute("uname");
	String str=request.getParameter("value");	
	try{
		Class.forName("org.postgresql.Driver");	
		Connection con1=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");

		PreparedStatement pst1=null;
		ResultSet rs=null;
		pst1=con1.prepareStatement("select book_id from mem_book where u_name=?");
		pst1.setString(1,S);
		rs=pst1.executeQuery();
		while(rs.next())
		{
			if(Integer.parseInt(str)==(rs.getInt(1)))
			{
				flag=1;
				break;
			}
				
		}
		
	}
	catch(Exception aa){}
%>
<%	
	int flag1=0;
		
	try{
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");
		ResultSet rs1=null;
		PreparedStatement pst=null;
		PreparedStatement pst2=null;
		PreparedStatement pst3=null;

		pst3=con.prepareStatement("select quantity from books where book_id=?");
		pst3.setInt(1,Integer.parseInt(str));		
		rs1=pst3.executeQuery();
		while(rs1.next())
		{
			if(rs1.getInt(1)==0)
			{
				flag1=1;
			}
		}
		if(flag1==0)
		{		
			
			if(flag==0)
			{
				pst2=con.prepareStatement("update books set quantity=quantity-1 where book_id=?");
				pst2.setInt(1,Integer.parseInt(str));		
				pst2.executeUpdate();
				pst=con.prepareStatement("insert into mem_book values(?,?,?)");
				pst.setString(1,S);
				pst.setInt(2,Integer.parseInt(str));
				pst.setString(3,msg);
				int i=pst.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("sure.jsp");
				}
			}
			else
			{
				out.println("Already issued");
			}
		}
		else
		{
			out.println("No books available");
		}
	}
	catch(Exception e){}

%>
</html>
