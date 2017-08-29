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

<script src="jquery-1.4.2.min.js"></script>

<script type="text/javascript">
	function f() {
		var e = document.getElementById("year");
		var v = e.options[e.selectedIndex].value;
		if (v == "n") {
			return false;
		}
		e = document.getElementById("batch");
		v = e.options[e.selectedIndex].value;
		if (v == "n") {
			return false;
		}
		if (v == "A" || v == "B") {
			e = document.getElementById("bno");
			v = e.options[e.selectedIndex].value;
			if (v == "n") {
				return false;
			}
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
						<li><a href="#"><i class="fa fa-calendar fa-fw"></i>
								Calendar</a></li>
						<li><a href="Upload.jsp"><i class="fa fa-upload fa-fw"></i>
								Upload Files</a></li>
						<li><a href="#"><i
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
							<p>-As a teacher, you can create batches of students you
								teach and easily make announcements, share documents and
								assignments.</p>
							<p>-Go on to Create Batch tab, and get started right away.
								Choose a batch name and enter the starting and end roll number
								to create a batch.</p>
							<p>-To make an announcement, notice to students, click on
								Notice Board tab in the left sidebar.</p>
						</div>
						
					</div>
					<!-- /.col-lg-4 -->
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">Create Batch</div>
						<div class="panel-body">
							<form role="form" id="myform" action="createBatch.jsp"
								method="post">
								<div class="form-group">
									<label class="control-label">Batch name</label> <input
										class="form-control" id="bname" style="" placeholder=""
										name="bname" type="text" required>
								</div>
								<div class="form-inline">
									<label class="control-label">Roll no. (Start to End)</label><br>
									<select id="year" name="year" style="width: auto;"
										class="form-control selectWidth">
										<option id="NA" value="n">Year</option>
										<option id="2015" value="2015">2K15</option>
										<option id="2014" value="2014">2K14</option>
										<option id="2013" value="2013">2K13</option>
										<option id="2012" value="2012">2K12</option>
									</select> / <select id="batch" name="batch" style="width: auto;"
										class="form-control">
										<option id="NA" value="n">Batch</option>
										<option id="A" value="A">A</option>
										<option id="B" value="B">B</option>
										<option id="AE" value="AE">AE</option>
										<option id="BT" value="BT">BT</option>
										<option id="CE" value="CE">CE</option>
										<option id="COE" value="COE">COE</option>
										<option id="ECE" value="ECE">ECE</option>
										<option id="EE" value="EE">EE</option>
										<option id="EEE" value="EEE">EEE</option>
										<option id="ENE" value="ENE">ENE</option>
										<option id="EP" value="EP">EP</option>
										<option id="IT" value="IT">IT</option>
										<option id="MCE" value="MCE">MCE</option>
										<option id="ME" value="ME">ME</option>
										<option id="PCT" value="PCT">PCT</option>
										<option id="PIE" value="PIE">PIE</option>
										<option id="SE" value="SE">SE</option>
									</select> <input class="form-control" id="bno" style="width: 80px;"
										placeholder="No." name="bno" min="1" type="number"> /
									<input class="form-control" id="rollno" style="width: 80px;"
										placeholder="Roll" name="sRoll" min="1" type="number" required>
									&nbsp; <b>to</b> &nbsp; <input class="form-control" id="rollno"
										style="width: 80px;" placeholder="Roll" name="eRoll" min="1"
										type="number" required>
								</div>
								<br>
								<div class="form-group">
									<input type="submit" id="cb" class="btn btn-primary"
										value="Create" onClick="return f()"></input>
								</div>
							</form>


						</div>
						
					</div>
					<!-- /.col-lg-4 -->
				</div>
			</div>
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
