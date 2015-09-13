<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DTU CLASSROOM</title>
</head>
<body>
<% 
	try{
		String u = session.getAttribute("user").toString();
		String d = session.getAttribute("dsgn").toString();
		if(u == null){
	   	   response.sendRedirect("login.jsp");
		}
		if(d.equals("S")){
			response.sendRedirect("homeS.jsp");
		}else{
			response.sendRedirect("homeT.jsp");
		}
	}catch(Exception ex){
		response.sendRedirect("login.jsp");
	}
%>

</body>
</html>