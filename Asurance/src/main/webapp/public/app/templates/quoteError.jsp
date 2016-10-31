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
<link href="../Asurance/public/css/footer.css" rel="stylesheet">
<script src="public/bower_components/angular/angular.js"></script>

<title>Retrieve Quote Failed</title>
</head>
<body>
	<div id="navbar"></div>
	<div  style="margin-top: 150px; width:800px;">
		<div class="col-sm-8" style="margin-left:500px">

			<div class="col-sm-8">
				<img
					src="https://www.usabourse.com/index_files/sold-out.png"
					style="padding-top: 20px;" width=400px height=200px>
			</div>
			
			<div class="col-sm-12"
				style="padding-right: 0px; padding-top: 30px;">
				<h1>Quote Already Purchased !</h1>
				<button type="button" class="btn btn-danger" style="margin-left:100px"><a href="/Asurance"> <b><font color="black">Click Here To Go Home</font></b></a></button>
				
			</div>
		</div>


	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$("#navbar")
									.load(
											'/Asurance/public/app/templates/navbar-for-quote.html');

						});
	</script>	
</body>
</html>