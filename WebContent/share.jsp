<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@ page import="com.PasswordHash" %>
<%

String u=session.getAttribute("user").toString();
String d=session.getAttribute("dsgn").toString();
try{
	if(u == null){
   	   response.sendRedirect("login.jsp");
	}
	if(d.equals("S")){
		response.sendRedirect("homeS.jsp");
	}
}catch(Exception ex){
	response.sendRedirect("login.jsp");
}
String b = request.getParameter("b");
String f = request.getParameter("f");

String query = "INSERT INTO SHARED VALUES('"+u+"','"+f+"','"+b+"',SYSDATE)";
System.out.println(query);
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	int x=st.executeUpdate(query);
	if(x>0){
		%>
		<script>	
		alert("File successfully shared!");	
		window.location.href='Upload.jsp';	
		</script>	
		<%
	}
	else
		out.println("Sharing file failed");
	con.close();
}
catch(Exception ex)
{
	%>
	<script>	
	alert("Sharing file failed");	
	window.location.href='Upload.jsp';	
	</script>
	<%
}

%>
