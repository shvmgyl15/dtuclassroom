<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
						<li><a href="NoteSD.jsp"><i class="fa fa-list-alt fa-fw"></i>
								Notice Board</a>
						<li><a href="#"><i class="fa fa-calendar fa-fw"></i>
								Calendar</a></li>
						<li><a href="Download.jsp"><i
								class="fa fa-download fa-fw"></i> Downloads</a></li>
						<li><a href="#"><i
								class="fa fa-bar-chart-o fa-fw"></i> Polls</a>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
	</div>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-5">
				<div class="panel panel-green">
					<div class="panel-heading">Getting Started</div>
					<div class="panel-body">
						<p>-As a student, you get all the updates made from your
							teacher directly.</p>
						<p>-If you by mistake entered a wrong rollno during
							registeration, or have any other queries or feature request,
							write to me at shvmgyl15@hotmail.com</p>
						<p>-The site is still under development, some features might
							not work as of now.</p>
						<p>-Feel free exploring links around!</p>
					</div>

				</div>
				<!-- /.col-lg-4 -->
			</div>
			<div class="row">
				<div class="col-lg-5">
					<div class="panel panel-primary">
						<div class="panel-heading">Links/Shortcuts</div>
						<div class="panel-body">
							<ul class="list-group">
								<li class="list-group-item"><a target="_blank"
									href="http://www.google.com/#">Google</a>
								<li class="list-group-item"><a target="_blank"
									href="http://dtu.ac.in/">DTU Home</a>
								<li class="list-group-item"><a target="_blank"
									href="http://exam.dtu.ac.in/">DTU Exam Portal</a>
								<li class="list-group-item"><a target="_blank"
									href="http://exam.dtu.ac.in/result.htm">Results</a>
								<li class="list-group-item"><a target="_blank"
									href="http://library.dce.edu/home">Library</a>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.col-lg-4 -->
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

	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
