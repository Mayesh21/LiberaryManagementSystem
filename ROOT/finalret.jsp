<%@ page language="java" import="java.sql.*,java.text.SimpleDateFormat, java.util.Date" %>
<%
	int flag=0,flag3=0;
	Date d1=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
	String msg=sdf.format(d1);
	//out.println(msg);

	String str1=msg.substring(3,5);
	
	int a=Integer.parseInt(str1);
	
	
	String yy=msg.substring(6,10);

	int y=Integer.parseInt(yy);
	

	String str=request.getParameter("value");	
	String S=(String)session.getAttribute("uname");
	
	String str2,str3=null,yy1;
		try{
		Class.forName("org.postgresql.Driver");	
		Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/AG25","AG25","");
		ResultSet rs=null;
		PreparedStatement pst=null;
		PreparedStatement pst5=null;
		PreparedStatement pst1=null;
		PreparedStatement pst2=null;
		PreparedStatement pst3=null;
		PreparedStatement pst4=null;
		ResultSet rs1=null;

		pst=con.prepareStatement("select datee from mem_book where u_name=? and book_id=?");
		pst.setString(1,S);
		pst.setInt(2,Integer.parseInt(str));
		rs=pst.executeQuery();
		while(rs.next())
		{
			str3=rs.getString(1);
		}
		str2=str3.substring(0,2);
		int b=Integer.parseInt(str2);
		
		
		yy1=str3.substring(6,10);
		int z=Integer.parseInt(yy1);
		
	
		if(a >= b+1)
		{
			flag=1;
		}
		else if(a==1 && b==12 && y>z)
			flag=0;
		else if(a<b && b<=12)
		{
			if(y>z)
				flag=1;
		}
		else if(a==b)
		{
			if(y>z)
				flag=1;
			else
				flag=0;
		}
		else
			flag=0;
		
		
		out.println(flag);

		
		if(flag==1)
		{
			pst4=con.prepareStatement("select finee from fine where u_name=?");
			pst4.setString(1,S);		
			rs1=pst4.executeQuery();
			if(rs1.next())
			{
				flag3=1;
			}
			else
				flag3=0;

			if(flag3==1)
			{
				pst1=con.prepareStatement("delete from mem_book where u_name=? and book_id=?");
				pst1.setString(1,S);
				pst1.setInt(2,Integer.parseInt(str));
				int i=pst1.executeUpdate();
				
				pst2=con.prepareStatement("update books set quantity=quantity+1 where book_id=?");
				pst2.setInt(1,Integer.parseInt(str));		
				pst2.executeUpdate();
				
				pst3=con.prepareStatement("update fine set finee=finee+200 where u_name=?");
				pst3.setString(1,S);
				pst3.executeUpdate();
			
				if(i>0)
				{
					response.sendRedirect("successful.jsp");
				}
			}	
			else
			{
				int aa=200;
				pst1=con.prepareStatement("delete from mem_book where u_name=? and book_id=?");
				pst1.setString(1,S);
				pst1.setInt(2,Integer.parseInt(str));
				int j=pst1.executeUpdate();

				pst2=con.prepareStatement("update books set quantity=quantity+1 where book_id=?");
				pst2.setInt(1,Integer.parseInt(str));		
				pst2.executeUpdate();
			
				pst5=con.prepareStatement("insert into fine values(?,?)");
				pst5.setString(1,S);
				pst5.setInt(2,aa);
				pst5.executeUpdate();

				if(j>0)
				{
					response.sendRedirect("successful.jsp");
				}
			}
		}
		else
		{
				pst1=con.prepareStatement("delete from mem_book where u_name=? and book_id=?");
				pst1.setString(1,S);
				pst1.setInt(2,Integer.parseInt(str));
				int k=pst1.executeUpdate();

				pst2=con.prepareStatement("update books set quantity=quantity+1 where book_id=?");
				pst2.setInt(1,Integer.parseInt(str));		
				pst2.executeUpdate();
			
				if(k>0)
				{
					response.sendRedirect("successful.jsp");
				}
		}	



}
	catch(Exception e){}%>
