<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@ page import="com.PasswordHash" %>

<%
String n=request.getParameter("uname");
String p=request.getParameter("pwd");
String h=PasswordHash.createHash(p);
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String e = request.getParameter("email");
String mb = request.getParameter("mb");
String d = request.getParameter("dob");
String dn = request.getParameter("dsgntn");

String query = "insert into USERS values('"+n+"' , '"+h+"','"+name+"','"+sex+"',TO_DATE('"+d+"', 'YYYY-MM-DD'),'"+e+"',"+mb+",'"+dn+"')";
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	int x=st.executeUpdate(query);
	if(x>0){
		%>
		<script>	
		alert('REGISTRATION SUCCESSFUL');	
		window.location.href='login.jsp';	
		</script>	
		<%
	}
	else
		out.println("ERROR, username or email already in use!");	
	con.close();
}
catch(Exception ex)
{
	%>
	<script>	
	alert('ERROR, username or email already in use!');	
	window.location.href='error.html';	
	</script>";	
	<%
}


%>