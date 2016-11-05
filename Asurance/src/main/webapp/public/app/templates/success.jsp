<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.ekthasol.asurance.models.Customer"%>
<%@page import="com.ekthasol.asurance.models.Quote"%>
<%@page import="com.ekthasol.asurance.models.FullDetails" %>
<%@page import="com.ekthasol.asurance.dao.savequote.RetrieveQuoteDAO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>Logged in</title>
<style type="text/css">
#myNavbar ul li {
font-size:20px;
margin-top:20px;
}
.glyphicon {color: red;}

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
      padding: 1px;
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
  
  .panel-body {
      font-size: 20px;
  }
</style>
</head>

<body ng-app="components">

	<%
		HttpSession sessiona = request.getSession(false);
	%>
	<%-- <%
		if (sessiona != null) {
	%> --%>
	<%
		Customer customer = (Customer) session.getAttribute("customer");
		FullDetails fullDetails = (FullDetails) session.getAttribute("fullDetails");
			 
		
	%>

	<%
		if (customer != null) {
	%>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				
				<ul class="nav navbar-nav">
				<li><a class="navbar-nav"><img src="./public/images/logo.png"
					style="height: 55px; width: 200px" /></a></li>
					
				</ul>
				
				
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">

				<ul class="nav navbar-nav navbar-right">
				<li><a href=""> <span class="glyphicon glyphicon-user"></span>Welcome <%=customer.getFirstName()%> </a></li>
					<li><a href="/Asurance/#/quote"> <span
							class="glyphicon glyphicon-edit"></span>Get Quote
					</a></li>
					<li><a href="/Asurance/#/retrieve-quote"> <span
							class="glyphicon glyphicon-edit"></span>Retrieve Quote
					</a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid "
		style="margin-top: 70px; margin-bottom: 484px;">
		<div class="row content text-left">

			<div class="col-sm-3 sidenav nav-tabs" style="border-style: none">
				<p>
					<a data-toggle="tab" href="#home" class="active">Home</a>
				</p>

				<p>
					<a data-toggle="tab" href="#manageQuote">Manage Quote</a>
				</p>
				<p>
					<a data-toggle="tab" href="#faq">Frequently Asked Questions</a>
				</p>


			</div>
			<div class="col-sm-7 " style="border-left: 2px solid orange">
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<h3>
							<label>First Name:</label> <label><b><%=customer.getFirstName()%></b></label><br>
							<label>Last Name:</label> <label><b><%=customer.getLastName()%></b></label><br>
							<%
								String policyNumber = (String) customer.getPolicyNumber();
							%>
							<%
								if (policyNumber != null) {
							%><label>Policy#:</label> <label><b><%=customer.getPolicyNumber()%></b></label><br>							
							<button id="viewPolicy" class="btn btn-lg btn-danger">View Policy</button>
							<div id="showPolicy">
							<div class="container" style="margin-top: 86px;">

		<div id="pricing" class="container-fluid">
		
			<div class="row slideanim">
				<div class="col-sm-12 col-xs-12">
					<div class="panel panel-default text-center" style="width:600px ; margin-left:200px">
						<div class="panel-heading">
							<h1><b style="color:black">Your Policy Details</b></h1>
						</div>
						<div class="panel-body">
							<p>
								<strong>Customer Name: </strong> <%=fullDetails.getCustomer().getFirstName()%> <%=fullDetails.getCustomer().getLastName()%>
							</p>
							<p>
								<strong>Vehicle Details: </strong> <br>
								VIN : <%=fullDetails.getVehicle().getVin()%> <br> Make  : <%=fullDetails.getVehicle().getMake()%>  <br> Year  : <%=fullDetails.getVehicle().getYear()%>  <br> Model  : <%=fullDetails.getVehicle().getModel()%> <br>
								
							</p>
							<p>
								<strong>Policy Number: </strong> <%=fullDetails.getQuote().getQuoteId()%> 
							</p>
						
							<p>
								<strong>Coverage Details: </strong> 
								<br>Policy Amount: $ <%=fullDetails.getQuote().getQuoteAmount() %>
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
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
								
							</div>
							<%
								} else {
							%>
							<label>Your Policy#:</label> <label><b>No Policy
									purchased Yet! <a href="/Asurance/#/quote">click to buy one</a>
							</b></label><br>
							<%
								}
							%>
						</h3>
					</div>
					<div id="manageQuote" class="tab-pane fade">
						<h1>How to manage quote</h1>
						<iframe width="800" height="315"
							src="https://www.youtube.com/embed/IUO_qs92Sxg" frameborder="0"
							allowfullscreen></iframe>
					</div>
					<div id="faq" class="tab-pane fade">
						<h1>Browse All Questions</h1>
						<h3 style="color: green">Click on a question to view the
							answer</h3>

						<p>
							<a href="#">Can I call to make changes to my policy?</a>
						</p>

						<p>
							<a href="#">Can I add or remove coverages in the middle of my
								policy?</a>
						</p>

						<p>
							<a href="#">How quickly do changes I make go into effect?</a>
						</p>

						<p>
							<a href="#">Do I need to start a new policy to add a new
								driver or vehicle?</a>
						</p>
					</div>
				</div>
			</div>

		</div>

	</div>

	<%
		} else {
	%>
	<c:redirect url="/#/login" />
	<%
		}
	%>
	<footer custom-footer></footer>
	<script>
	$(document).ready(function() {
		$("#showPolicy").hide();
		$("#viewPolicy").click(function(){
			$("#showPolicy").show();	
		})
	
	})
	</script>
	<script src="public/app/modules/modules.js"></script>
	<script src="public/app/components/footer.js"></script>
	<script src="public/app/components/customLogo.js"></script>
</body>
</html>