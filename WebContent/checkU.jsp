<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet" %>
<%@page import="com.ConnectionClass" %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
<title>Check uname</title>
</head>
<body>
<%
String n=request.getParameter("q");

ResultSet rs = ConnectionClass.getInstance().getResultSet("select NAME from USERS where UNAME='" + n + "'");
if(rs.next()){
	out.println("Username Not Available");
}
else{
	out.println("Username Available");
}
%>
</body>
</html>