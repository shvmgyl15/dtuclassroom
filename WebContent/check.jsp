<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet" %>
<%@ page import="com.*" %>
<%
String n=request.getParameter("uname");
String p=request.getParameter("pwd");

String query = "select PWD,D from USERS where UNAME='" + n + "'";
ResultSet rs = ConnectionClass.getInstance().getResultSet(query);
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

%>
