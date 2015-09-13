<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.FileInputStream" %>
        <%
        try{
        String filename = request.getParameter("file");
        ServletContext context = pageContext.getServletContext();
        String filePath = context.getInitParameter("file-upload");
		response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition","attachment;filename=\""+ filename+"\"");
        ServletOutputStream outFile = response.getOutputStream();
        byte[] buf = new byte[4 * 1024];
        FileInputStream fileInputStream = new FileInputStream(filePath+filename);
        int bytesRead;
        while ((bytesRead=fileInputStream.read(buf,0,4096)) != -1)
                { 
        	outFile.write(buf,0,bytesRead);
            }
        fileInputStream.close();
        outFile.flush();
        outFile.close();
        out.close();
        }
        catch(Exception e)
        {
        	//System.out.println(e.getMessage());
        	
        }
        %>
