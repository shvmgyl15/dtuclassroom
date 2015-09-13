<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Register now</title>
<!-- Bootstrap Core CSS -->
<link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

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
<style>
.error { color: red; padding-left: 10px; font-style: italic; font-size: x-small; }
</style>


<script src="jquery-1.4.2.min.js"></script>

<script type="text/javascript">
	
	function f(){
		var e = document.getElementById("designation");
		var v = e.options[e.selectedIndex].value;
		if(v=="n"){
			$("#dn").show();
			return false;
		}
		if(v=="S"){
			$("#dn").hide();
			
		}
		if(v=="T"){
			$("#dn").hide();
		}
	}

	$(document).ready(function() {
		$("#bno").hide();
		$(".error").hide();
		$("#S").hide();
		$("#designation").change(function() {
			var id = $(this).find("option:selected").attr("id");
			switch (id) {
			case "student":
				$("#S").show();
				$('#myform').prop('action', 'signupStudents.jsp');
				break;
			case "teacher":
				$("#S").hide();
				$('#myform').prop('action', 'signupTeachers.jsp');
				break;
			case "NA":
				$("#S").hide();
				$('#myform').prop('action', 'error.jsp');
			}
		});
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
		$("#reset").click(function(event) {
			$(".form-control").each(function() {
				$(this).parent().removeClass("has-error has-success");
				$(".error").hide();
				$("#T").hide();
				$("#S").hide();
			});
		});
		
		$("#uname").blur(function(){
			var data = $(this).val();
			var xmlhttp;
			var f=true;
			if (data.length < 6 && data.length>0) {
				$(this).parent().addClass("has-error");
				$("#u").html("Minimum 6 characters");
				$("#u").show();
				f=false;
			} else if(data.length!=0){
				$(this).parent().removeClass("has-error has-success");
				$(this).parent().addClass("has-success");
				$("#u").hide();
			}
			if(data.length==0){
				f=false;
			}
			if(f){
				xmlhttp=new XMLHttpRequest();  
				try{
					xmlhttp.onreadystatechange=function() {			
						  if (xmlhttp.readyState==4){
							  var x = xmlhttp.responseText;
							  $("#u").css({"color":"orange"});
							  $("#u").html(x);
							  $("#u").show();
						  }else {
							  $("#u").css({"color":"blue"});
							  $("#u").html("Checking availability...");
							  $("#u").show();
						  }
						}
						xmlhttp.open("GET","checkU.jsp?q="+data,true);
						xmlhttp.send();	
				}catch(e){
					alert("Unable to connect to server");
				}
				
			}
		});
		
		$("#pwd").blur(function(){
			var data = $(this).val();
			if (data.length < 6 && data.length>0) {
				$(this).parent().addClass("has-error");
				$("#p").html("Minimum 6 characters");
				$("#p").show();
			} else if(data.length!=0){
				$(this).parent().removeClass("has-error has-success");
				$(this).parent().addClass("has-success");
				$("#p").hide();
			}
		});
		
		$("#cpwd").blur(function(){
			var p = $("#pwd").val();
			if(p.length>=6){
				if ($(this).val() != p) {
					$(this).parent().addClass("has-error");
					$("#cp").show();
				} else {
					$(this).parent().removeClass("has-error has-success");
					$(this).parent().addClass("has-success");
					$("#cp").hide();
				}	
			}
		});
		
	});
	
</script>

</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Fill in your details... (all fields are required)</h3>
					</div>
					<div class="panel-body">
						<form role="form" id="myform" action="error.html" method="post">
							<fieldset>
								<div class="form-group">
									<label class="control-label">Username</label>  <input id="uname" class="form-control" style=""
										placeholder="Enter a username" name="uname" type="text" autofocus  required>
										<span id="u" class="error">This field is required.</span>
								</div>
								<div class="form-group">
									<label class="control-label">Password</label> <input
										class="form-control" id="pwd" placeholder="Choose a strong password"
										name="pwd" type="password" value="" required>
									<span id="p" class="error">This field is required.</span>
								</div>
								<div class="form-group">
									<label class="control-label">Confirm Password</label> <input
										class="form-control" id="cpwd" placeholder="Re-enter the password"
										name="cpwd" type="password" value="" required>
									<span id="cp" class="error">Entered Passwords don't match</span>
								</div>
								<hr>
								<div class="form-group">
									<label class="control-label">Name</label> <input
										class="form-control" style="" placeholder="Enter your name" name="name"
										type="text" required>
									<span id="n" class="error">This field is required.</span>
								</div>
								<div class="form-group">
									<label class="control-label">Sex :</label>&nbsp;&nbsp;&nbsp;&nbsp;<label class="radio-inline"> <input
										type="radio" name="sex" id="male" value="M" checked>Male
									</label> <label class="radio-inline"> <input type="radio"
										name="sex" id="female" value="F">Female
									</label>
								</div>
								<div class="form-group">
									<label class="control-label">Date of Birth</label> <input
										class="form-control" name="dob" type="date"  required>
									<span id="d" class="error">This field is required.</span>
								</div>
								<div class="form-group">
									<label class="control-label">Mobile no.</label> <input
										class="form-control" style="" placeholder="Enter your mobile number" name="mb"
										type="number" min="1000000000" max="9999999999"  required>
									<span id="m" class="error">This field is required.</span>
								</div>
								<div class="form-group">
									<label class="control-label">Email Id</label> <input
										class="form-control" style="" placeholder="abc@xyz.com" name="email"
										type="email" required>
									<span id="e" class="error">This field is required.</span>
								</div>
								
								<div class="form-group">
									<label>Designation</label> <select id="designation"
										name="dsgntn" class="form-control">
										<option id="NA" value="n">Select an option</option>
										<option id="student" value="S">Student</option>
										<option id="teacher" value="T">Teacher</option>
									</select>
									<span id="dn" class="error">You must select a designation</span>
								</div>
								<div id="S" class="form-inline">
									<label class="control-label">Roll no.</label>
									 <select id="year"
										name="year" style="width:auto;" class="form-control selectWidth">
										<option id="NA" value="n">Year</option>
										<option id="2015" value="2015">2K15</option>
										<option id="2014" value="2014">2K14</option>
										<option id="2013" value="2013">2K13</option>
										<option id="2012" value="2012">2K12</option>
									</select>
									/
									  <select id="batch"
										name="batch" style="width:auto;" class="form-control">
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
									</select>
									<input
										class="form-control" id="bno" style="width:80px;" placeholder="No." name="bno"
										min="1" type="number">
									/
									 <input class="form-control" id = "rollno" style="width:80px;"
										placeholder="Roll" name="rollno" min="1" type="number" autofocus>
									<span id="r" class="error">This field is required.</span>
								</div>
								<br>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" id="reg" class="btn btn-primary"
									value="Register" onClick="return f()"></input>
								<button type="reset" id="reset" class="btn btn-default">Reset</button>
							</fieldset>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

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
