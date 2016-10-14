<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.ekthasol.asurance.models.FullDetails" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>policy details</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	.panel {
      border: 1px solid #f4511e;
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #f4511e;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #f4511e !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
   .panel-footer .btn {
      margin: 15px 0;
      background-color: #f4511e;
      color: #fff;
  }
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" id="scrollNabar">
		<h2 style="text-align: center; color: red">Asurance</h2>
	</nav>
	<div id="navbar"></div>
	
	<%FullDetails fullDetails = (FullDetails)session.getAttribute("full-details"); %>
	<div class="container" style="margin-top: 86px;">

		<div id="pricing" class="container-fluid">
			<div class="text-center">
				<h2>Your Policy Details</h2>
			</div>
			<div class="row slideanim">
				<div class="col-sm-12 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1>Asurance Basic</h1>
						</div>
						<div class="panel-body">
							<p>
								<strong>Customer Name: </strong> <%=fullDetails.getCustomer().getFirstName()%> <%=fullDetails.getCustomer().getLastName()%>
							</p>
							<p>
								<strong>Vehicle Details: </strong> <br>
								Vin: <%=fullDetails.getVehicle().getVin()%> ; Make: <%=fullDetails.getVehicle().getMake()%>  ; Year: <%=fullDetails.getVehicle().getYear()%>  ; Model: <%=fullDetails.getVehicle().getModel()%> <br>
								
							</p>
							<p>
								<strong>Policy Number: </strong> <%=fullDetails.getQuote().getQuoteId()%> 
							</p>
						
							<p>
								<strong>Coverage Details: </strong> 
								<br>Liability: $ <%=fullDetails.getQuote().getLiability() %>
								<br>Comprehensive: $ <%=fullDetails.getQuote().getComprehensive() %>
								<br>Collision: $ <%=fullDetails.getQuote().getCollision() %>
								<br>Injury Protection: $ <%= fullDetails.getQuote().getInjuryProtection()%>
								<br>Rental: $ <%=fullDetails.getQuote().getRental() %>
								<br>Road Side: $ <%=fullDetails.getQuote().getRoadSide() %>
								<br>UnderInsured: $ <%= fullDetails.getQuote().getUnderInsured()%>
								<br>UnInsured: $ <%= fullDetails.getQuote().getUnInsured()%>
								<br>UnInsuredPD: $ <%= fullDetails.getQuote().getUnInsuredPD()%>
							</p>
						
						</div>
						<div class="panel-footer">
							<button class="btn btn-lg">Go to Profile</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>



		<script>
			$(document)
					.ready(
							function() {

								$("#navbar")
										.load(
												'/Asurance/public/app/templates/navbar-for-quote.html');
								$(window).scroll(function() {
									if ($(this).scrollTop() > 150) {
										$('#navbar').css({
											'display' : 'none'
										});
										$("#scrollNabar").show();
									} else {

										$("#scrollNabar").hide();
										$('#navbar').show();
									}
								});
							});
		</script>
</body>
</html>