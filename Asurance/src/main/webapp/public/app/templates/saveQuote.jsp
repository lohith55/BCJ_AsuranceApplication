<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ekthasol.asurance.models.Quote"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Details Saved</title>
</head>
<body>
<div id="navbar"></div>
	<div class="container-fluid"
		style="margin-top: 70px; margin-bottom: 700px;">
		<div class="col-sm-8" style="padding-top: 20px;">
			<h1>Details saved successfully!!!</h1>
			<%Quote quote = (Quote) session.getAttribute("newQuote");%>
			<h2>Your Quote ID is : ${quote.getQuoteId() }</h2>
			<h3>Please save this quote id for future reference.</h3>
			<a href="/Asurance">Click here to go to Home Page</a>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		
		 $("#navbar").load('/Asurance/public/app/templates/navbar-for-quote.html');
  
});
	</script>
	
</body>
</html>