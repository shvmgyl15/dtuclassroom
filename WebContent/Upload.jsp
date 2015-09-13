<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>DTU CLASSROOM</title>

<!-- Bootstrap Core CSS -->
<link href="bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="jquery-1.4.2.min.js"></script>

<script src="jquery-dropzone.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var url = input.value;
		var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
		if (input.files
				&& input.files[0]
				&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		} else {
			$('#blah').attr('src', 'np.png');
		}
	}

	$(document).ready(function() {
		$("#bno").hide();
		$("#batch").change(function() {
			var id = $(this).find("option:selected").attr("id");
			switch (id) {
			case "A":
				$("#bno").show();
				break;
			case "B":
				$("#bno").show();
				break;
			default:
				$("#bno").hide();
			}
		});
	});
</script>

</head>

<body>

	<%
		String u = "User";
		try {
			u = session.getAttribute("user").toString();
			String d = session.getAttribute("dsgn").toString();
			if (u == null) {
				response.sendRedirect("login.jsp");
			}
			if (d.equals("S")) {
				response.sendRedirect("homeS.jsp");
			}
		} catch (Exception ex) {
			response.sendRedirect("login.jsp");
		}
	%>


	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.jsp">DTU CLASSROOM</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<%=u%> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="home.jsp"><i class="fa fa-dashboard fa-fw"></i>
								Dashboard</a></li>
						<li><a href="NoteT.jsp"><i class="fa fa-list-alt fa-fw"></i>
								Notice Board</a></li>
						<li><a href="tables.html"><i class="fa fa-calendar fa-fw"></i>
								Calendar</a></li>
						<li><a href="Upload.jsp"><i class="fa fa-upload fa-fw"></i>
								Upload Files</a></li>
						<li><a href="forms.html"><i
								class="fa fa-bar-chart-o fa-fw"></i> Polls</a>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Share files, images with your students</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="col-lg-5">
					<div class="panel panel-green">
						<div class="panel-heading">Upload</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form action="u.jsp" method="post" class="dropzone"
								enctype="multipart/form-data">
								<div class="form-group">
								<label class="control-label">Choose a file to upload</label><br>
									<img id="blah" data-type="editable" src="np.png"
										alt="selected file" width="100" height="100" /> <input
										id="imgInp" name="file" onchange="readURL(this);" class="form-group"
										type="file" size="50" />
								<span style="color:orange; font-style: italic; font-size: small;">(filename not greater than 50 characters)</span>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-success start">
										<i class="glyphicon glyphicon-upload"></i> &nbsp;Upload
									</button>
								</div>
							</form>

						</div>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="panel panel-primary">
						<div class="panel-heading">Share</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form role="form" id="myform" action="share.jsp" method="post">
								<fieldset>
									<div class="form-group">
										<label class="control-label">File</label> <select id="f"
											name="f" style="" class="form-control">
											<option id="NAF" value="n">Select File</option>
											<%
												try {
													String query;
													Class.forName("oracle.jdbc.driver.OracleDriver");
													Connection con = DriverManager.getConnection(
															"jdbc:oracle:thin:@localhost:1521:xe", "system",
															"system");
													Statement st = con.createStatement();
													query = "select FILENAME from UPLOADED_FILES where TNAME='" + u
															+ "' ORDER BY DATE_TIME DESC";
													ResultSet rs = st.executeQuery(query);
													System.out.println(query);
													while (rs.next()) {
														String x = rs.getString("FILENAME");
											%>
											<option id="<%=x%>" value="<%=x%>"><%=x%></option>
											<%
												}
													con.close();
												} catch (Exception e) {
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label class="control-label">Batch</label> <select id="b"
											name="b" style="" class="form-control">
											<option id="NA" value="n">Select Batch</option>
											<%
												try {
													String query;
													Class.forName("oracle.jdbc.driver.OracleDriver");
													Connection con = DriverManager.getConnection(
															"jdbc:oracle:thin:@localhost:1521:xe", "system",
															"system");
													Statement st = con.createStatement();
													query = "select BNAME from BATCHES where TNAME='" + u + "'";
													ResultSet rs = st.executeQuery(query);
													System.out.println(query);
													while (rs.next()) {
														String x = rs.getString(rs.findColumn("BNAME"));
											%>
											<option id="<%=x%>" value="<%=x%>"><%=x%></option>
											<%
												}
													con.close();
												} catch (Exception e) {
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<input type="submit" id="share" class="btn btn-primary"
											value="Share" onClick=""></input>
									</div>

								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-lg- -->
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Files uploaded in past</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables">
									<thead>
										<tr>
											<th>File Name</th>
											<th>Upload Date</th>
											<th>Shared with</th>
										</tr>
									</thead>
									<%
										try {
											String query;
											Class.forName("oracle.jdbc.driver.OracleDriver");
											Connection con = DriverManager.getConnection(
													"jdbc:oracle:thin:@localhost:1521:xe", "system",
													"system");
											Statement st = con.createStatement();
											query = "select * from UPLOADED_FILES where TNAME='" + u
													+ "' ORDER BY DATE_TIME DESC";
											ResultSet rs = st.executeQuery(query);
									%><tbody>
										<%
											while (rs.next()) {
												String fName = rs.getString("FILENAME");
												String s="";
												query = "select BNAME from SHARED where FILENAME='" + fName
														+ "' ORDER BY DATE_TIME DESC";
												System.out.println(query);
												Class.forName("oracle.jdbc.driver.OracleDriver");
												Connection co = DriverManager.getConnection(
														"jdbc:oracle:thin:@localhost:1521:xe", "system",
														"system");
												Statement t = con.createStatement();
												
												ResultSet r = t.executeQuery(query);
												while(r.next()){
													s += r.getString("BNAME") + "<br>";
												}
												co.close();
												if(!s.contains("<br>")){
													s="-";
												}
										%>
										<tr>
											<td><%=fName%></td>
											<td><%=rs.getString("DATE_TIME")%></td>
											<td><%=s%></td>
										</tr>
										<%
											}
												con.close();
										%>
									</tbody>
								</table>
								<%
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>
