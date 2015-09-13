<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
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
String tA = request.getParameter("tA");
tA = tA.replaceAll("\r\n", "<br>");
tA = tA.replaceAll("\n", "<br>");
String sub = request.getParameter("sub");

String query = "INSERT INTO TEACHERS VALUES('"+u+"','"+b+"','"+sub+"','"+tA+"',SYSDATE)";
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
		alert('Note added successfully');	
		window.location.href='NoteT.jsp';	
		</script>
		<%
	}
	else
		out.println("Adding note failed, check if u selected a batch, or if subject is less than equal to 15 characters");
	con.close();
}
catch(Exception ex)
{
	ex.printStackTrace();
	%>
	<script>	
	alert('Adding note FAILED, check if u selected a batch, or if subject is less than equal to 15 characters');	
	window.location.href='NoteT.jsp';	
	</script>
	<%
}

%>
