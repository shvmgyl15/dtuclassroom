<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.ConnectionClass"%>

<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%
	String u = session.getAttribute("user").toString();
	File file;
	String fileName = "";
	ArrayList<String> files = new ArrayList<String>();
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	ServletContext context = pageContext.getServletContext();
	String filePath = context.getInitParameter("file-upload");

	// Verify the content type
	String contentType = request.getContentType();
	if ((contentType.indexOf("multipart/form-data") >= 0)) {

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);
		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					fileName = fi.getName();
					//check if a file with same name exists already on server
					String query = "select FILENAME from UPLOADED_FILES";
					ResultSet rs = ConnectionClass.getInstance().getResultSet(query);
					while(rs.next()){
						files.add(rs.getString("FILENAME").toLowerCase());
					}
					if(files.contains(fileName.toLowerCase())){
						%>
						<script>	
						alert("a file with same name already exists on server, plz rename the selected file, and try uploading again");	
						window.location.href='Upload.jsp';	
						</script>	
						<%
						throw new Exception("a file with same name already exists on server, plz rename the selected file, and try uploading again");
					}
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(filePath
								+ fileName.substring(fileName
										.lastIndexOf("\\")));
					} else {
						file = new File(filePath
								+ fileName.substring(fileName
										.lastIndexOf("\\") + 1));
					}
					fi.write(file);
					query = "INSERT INTO UPLOADED_FILES VALUES('" + u + "','" + fileName + "',SYSDATE)";
					ConnectionClass.getInstance().updateDb(query);
						
					%>
					<script>	
					alert('File uploaded successfully');	
					window.location.href='Upload.jsp';	
					</script>	
					<%
				}
			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
	} else {
		%>
		<script>	
		alert('File upload failed');	
		window.location.href='Upload.jsp';	
		</script>	
		<%
	}
%>