<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ConnectionClass" %>
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

<!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">


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

</head>

<body>

	<%
		String u = "";
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
			style="margin-bottom: 0">
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
								Notice Board</a>
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
					<h1 class="page-header">Notice Board</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-success">
						<div class="panel-heading">Add Notice</div>

						<!-- /.panel-heading -->
						<div class="panel-body">
							<form role="form" id="myform" action="addNote.jsp" method="post">
								<fieldset>
									<div class="form-group">
										<label class="control-label">Batch</label> <select id="b"
											name="b" style="" class="form-control">
											<option id="NA" value="n">Select Batch</option>
											<%
												String query = "select BNAME from BATCHES where TNAME='" + u + "'";
												ResultSet rs = ConnectionClass.getInstance().getResultSet(query);
												while (rs.next()) {
													String x = rs.getString("BNAME");
											%>
											<option id="<%=x%>" value="<%=x%>"><%=x%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label class="control-label">Subject</label> <input
											class="form-control" id="sub" style=""
											placeholder="Not more than 15 characters" name="sub"
											type="text" required>

									</div>
									<div class="form-group">
										<label class="control-label">Text area for notice</label>
										<textarea name="tA" id="tA"
											placeholder="HTML Tags work here, you can use them freely :)"
											class="form-control" rows="3"></textarea>
									</div>
									<div class="form-group">
										<input type="submit" id="add" class="btn btn-primary"
											value="Add" onClick=""></input>
									</div>

								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Past Notices</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables">
									<thead>
										<tr>
											<th>Batch</th>
											<th>Subject</th>
											<th>Date Time</th>
											<th>Notice</th>
										</tr>
									</thead>
									<%
										query = "select * from TEACHERS where TNAME='" + u + "' ORDER BY DATE_TIME DESC";
										rs = ConnectionClass.getInstance().getResultSet(query);
									%><tbody>
									<%
										while (rs.next()) {
									%>
										<tr>
											<td><%=rs.getString(rs.findColumn("BNAME"))%></td>
											<td><%=rs.getString(rs.findColumn("SUB"))%></td>
											<td><%=rs.getString(rs.findColumn("DATE_TIME"))%></td>
											<td><%=rs.getString(rs.findColumn("NOTICE"))%></td>
										</tr>
									<%
										}
									%>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

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
