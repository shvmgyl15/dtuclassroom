<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
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
			if (d.equals("T")) {
				response.sendRedirect("homeT.jsp");
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
						<li><a href="NoteSD.jsp"><i class="fa fa-list-alt fa-fw"></i>
								Notice Board</a>
						<li><a href="tables.html"><i class="fa fa-calendar fa-fw"></i>
								Calendar</a></li>
						<li><a href="Download.jsp"><i
								class="fa fa-download fa-fw"></i> Downloads</a></li>
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
					<h1 class="page-header">Downloads</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Files shared with you</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables">
									<thead>
										<tr>
											<th>File</th>
											<th>Date Time</th>
											<th>By</th>
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
											query = "SELECT YEAR, BATCH, BNO, ROLLNO FROM STUDENTS WHERE UNAME = '"
													+ u + "'";
											System.out.println(query);
											ResultSet r = st.executeQuery(query);
											r.next();
											int y = r.getInt(r.findColumn("YEAR"));
											int bn = r.getInt(r.findColumn("BNO"));
											int roll = r.getInt(r.findColumn("ROLLNO"));
											String b = r.getString(r.findColumn("BATCH"));
											String q1 = "select TNAME||BNAME from BATCHES where YEAR = "
													+ y + " AND BATCH = '" + b + "' AND BNO = " + bn
													+ " AND " + roll + " BETWEEN ST_ROLL AND EN_ROLL";
											System.out.println(q1);
											query = "select * from SHARED where TNAME||BNAME IN (" + q1
													+ ") ORDER BY DATE_TIME DESC";
											System.out.println(query);
											ResultSet rs = st.executeQuery(query);
									%><tbody>
										<%
											while (rs.next()) {
										%>
										<tr>
											<td><a href="d.jsp?file=<%=rs.getString("FILENAME")%>"><%=rs.getString("FILENAME")%></a></td>
											<td><%=rs.getString("DATE_TIME")%></td>
											<td><%=rs.getString("TNAME")%></td>
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
										out.println("ERROR");
									}
								%>

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
