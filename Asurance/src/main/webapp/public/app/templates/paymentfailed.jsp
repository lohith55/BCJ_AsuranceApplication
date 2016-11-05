<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../../css/footer.css" rel="stylesheet">
<script src="../../bower_components/angular/angular.js"></script>
<title>Payment Failed</title>
</head>
<body ng-app="components">
<div navbar-header></div>
	
<div class="container-fluid"
		style="margin-top: 70px; margin-bottom: 600px;">
		<div class="col-sm-8" >
<img src="../../images/paymentFailed.jpg" style="
    padding-top: 20px;">
</div>
		<div class="col-sm-6" style="
    padding-right: 0px;
    padding-top: 30px;" >
<h1>Unable to process the payment!!! </h1>
<h1>Try again later</h1>
<a href="/Asurance" ><h3>Click here to go to Home Page</h3></a>
</div>

</div>

<footer custom-footer-2></footer>
	<script src="../../app/modules/modules.js"></script>
	<script src="../components/navbar-for-quote.js"></script>
	<script src="../components/footer.js"></script>
	<script src="../components/customLogo.js"></script>
</body>
</html>