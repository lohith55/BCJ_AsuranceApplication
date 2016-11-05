<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html ng-app="components">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="public/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/bower_components/bootstrap/dist/css/bootstrap-theme.min.css">
     <script src="public/bower_components/jquery/dist/jquery.min.js"></script> -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src ="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.js"></script>
<script src "http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Vehicle</title>
<style>
li {
	cursor: pointer;
	cursor: hand;
}
.error {
	border-color: red;
}
#errorMessage { color: red;}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" id="scrollNabar"><h2 style="text-align:center; color:red">Asurance</h2></nav>
<div id="navbar"></div>
	<div class="container" style="
    margin-top: 86px;">
    <div id="errorMessage">Highlighted Field is required</div>

	<form class="form-horizontal" method="post" action="addDriver" novalidate id="driverForm">
			<div class="form-group">
	<label class="col-sm-3 control-label">Gender</label>
				<div class="col-sm-9">
					<label class="radio-inline"> <input type="radio"
						name="gender" value="male" checked>Male
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" value="female">Female
					</label>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Marital Status</label>
				<div class="col-sm-4">
					<select class="form-control" name="marital" required>
						<option value="">Select one</option>
						<option value="Single">Single</option>
						<option value="Married">Married</option>
						<option value="Divorced">Divorced</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Highest Level Of
					Education </label>
				<div class="col-sm-4">
					<select class="form-control" name="education" required>
						<option value="">Select one</option>
						<option value="HighSchool">High School</option>
						<option value="UnderGraduate">Undergraduate</option>
						<option value="Masters">Masters</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Employee Status</label>
				<div class="col-sm-4">
					<select class="form-control" name="employment" id="empStatus" required>
						<option value="">Select one</option>
						<option value="Student">Student</option>
						<option value="Employed">Employed</option> 
						<option value="SelfEmployed">Self-Employed</option>
						<option value="UnEmployed">Unemployed</option>
						<option value="Retired">Retired</option>
					</select>
				</div>
			</div>


			<div class="form-group">

				<label class="col-sm-3 control-label">Social Security Number<br>
				<small>(required for most accurate quote)</small></label>
				<div class="col-sm-4">
					<input class="form-control" id="ssn" name="ssn" maxlength="9" type="text"
						 />
				</div>

				<div class="col-sm-1">
					<a href="#"> <span class="glyphicon glyphicon-lock"></span>
					</a>
				</div>
			</div>

			<hr class="line">

			<!-- <h3>Residency</h3>

			<div class="form-group">
				<label class="col-sm-3 control-label">Primary Residence </label>
				<div class="col-sm-4">
					<select class="form-control" name="residence" >
						<option value=""></option>
						<option value="Permenant">Permanant</option>
						<option value="Temporary">Temporary</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Moved in the last two
					months</label>
				<div class="col-sm-9">
					<label class="radio-inline"> <input type="radio"
						name="moved" value="yes">Yes
					</label> <label class="radio-inline"> <input type="radio"
						name="moved" value="no">No
					</label>
				</div>
			</div> -->
			<hr class="line">
			<h3>Driving History</h3>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">DL Number</label>
				<div class="col-sm-4">
					<input class="form-control" name="licenseNumber" type="text" required>
				</div>
			</div>
			<h4>Accidents, Violations and Claims</h4>

			<div class="form-group">
				<label class="col-sm-3 control-label">Total accidents, claims or
					other damages you had to your vehicle (last 5years/october 2011):<br>
				<small>eg:Hitting a car/object/property/animal, car hits you
						,weather,vandalism,theft,hail</small>
				</label>
				<div class="col-sm-4">
					<input class="form-control" name="claims" type="number"  required min="0">
				</div> 
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">Total tickets or violations
					(last 3 years/oct 2013):</label>
				<div class="col-sm-4">
					<input class="form-control" name="tickets" type="number" required min="0">
				</div>
			</div>
			<hr class="line">

			<h3>Additional Information</h3>

			<div class="form-group">
				<label class="col-sm-3 control-label">Primary Email Address<br>
				<small>(We will NOT sell your email address.)</small></label>
				<div class="col-sm-4">
					<input class="form-control" name="primaryEmail" type="email"
						required>
				</div>
			</div>

			<!-- <div class="form-group">
				<label class="col-sm-3 control-label">How many residents
					live in the home?<br>
				<small>(Including drivers on quote,excluded drivers,children
						and roommates.)</small>
				</label>
				<div class="col-sm-4">
					<input class="form-control" name="residents" type="number" min="1">

				</div>
			</div> -->
			<hr class="colorgraph">
			<div class="row">
				<div class="col-sm-4">
					<button class="btn btn-md btn-primary" onClick="history.back()">Back</button>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-md btn-primary" href="/Asurance">Cancel</a>
				</div>
				<div class="col-sm-4">
					<input  type="submit" class="btn btn-md btn-primary" value="Save & Continue" id="submit">
				</div>
			</div>
	</div>
	</form>
	</div>
	<script>
	$(document).ready(function(){
		$(".navbar").hide();
    	$("#errorMessage").hide();
		 $("#navbar").load('/Asurance/public/app/templates/navbar-for-quote.html');
	
			
			$("#driverForm").validate({
				  messages: {
					 emailPrimary: {
				      required: "We need your email address to contact you",
				      email: "Your email address must be in the format of name@domain.com"
				    }
				  }
				});
		 
		 $(window).scroll(function() {
			    if ($(this).scrollTop() > 150) { 
			        $('#navbar').css({
			            'display': 'none'
			        });
			        $("#scrollNabar").show();
			    }
			    else {
			    	
			    	$("#scrollNabar").hide();
			    	$('#navbar').show();
			    }
			});
		 $("#empStatus").change(function(){
			var selected = $("#empStatus").val();
			if(selected == "Employed")
				$("#ssn").prop('required',true);
			else
				$("#ssn").prop('required',false);
		 });
  
});
	</script>

</body>
</html>