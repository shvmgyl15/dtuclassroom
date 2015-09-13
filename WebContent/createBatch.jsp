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
String bname = request.getParameter("bname");
int sRoll = Integer.parseInt(request.getParameter("sRoll"));
int eRoll = Integer.parseInt(request.getParameter("eRoll"));
int yr = Integer.parseInt(request.getParameter("year"));
String b = request.getParameter("batch");
int bno;
if(b.equals("A")||b.equals("B")){
	bno = Integer.parseInt(request.getParameter("bno"));
}else{
	bno = 0;
}

String query = "INSERT INTO BATCHES VALUES('"+u+"','"+bname+"',"+yr+",'"+b+"',"+bno+","+sRoll+","+eRoll+")";
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	int x=st.executeUpdate(query);
	if(x>0){
		%>
		<script>	
		alert("BATCH created successfully!");	
		window.location.href='homeT.jsp';	
		</script>	
		<%
	}
	else
		out.println("BATCH '"+bname+"' creation failed!");
	con.close();
}
catch(Exception ex)
{
	%>
	<script>	
	alert("BATCH creation failed!");	
	window.location.href='homeT.jsp';	
	</script>	
	<%
}

%>
