<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@ page import="com.PasswordHash" %>
<%
String n=request.getParameter("uname");
String p=request.getParameter("pwd");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	String query = "select PWD,D from USERS where UNAME='"+n+"'";
	ResultSet rs=st.executeQuery(query);
	if(rs.next())
	{
		String h = rs.getString(rs.findColumn("PWD"));
		String d = rs.getString(rs.findColumn("D"));
		if(PasswordHash.validatePassword(p, h)){
			session.setAttribute("user",n);
			session.setAttribute("dsgn",d);
			if(d.equals("S")){
				response.sendRedirect("homeS.jsp");
			}else{
				response.sendRedirect("homeT.jsp");
			}
			
		}else{
			out.println("Invalid username or password");
		}
	}
	else
	{
		response.sendRedirect("error.html");
	}
	con.close();
}
catch(Exception e)
{
	%>
	<script>	
	alert('Invalid username or password! Note: username and password are case sensitive');	
	window.location.href='login.jsp';	
	</script>	
	<%	
}

%>
