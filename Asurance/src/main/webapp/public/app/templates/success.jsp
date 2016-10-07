<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.ekthasol.asurance.models.Customer"%>
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
		
	%>
		 <%
		if (customer != null) {
	%> 
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">Asurance</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid "
		style="margin-top: 70px; margin-bottom: 484px;">
		<div class="row content text-left">

			<div class="col-sm-4 sidenav nav-tabs" style="border-style: none">
				<p>
					<a data-toggle="tab" href="#home">Home</a>
				</p>

				<p>
					<a data-toggle="tab" href="#account">Account Information</a>
				</p>

				<p>
					<a data-toggle="tab" href="#manageQuote">Manage Quote</a>
				</p>
				<p>
					<a data-toggle="tab" href="#faq">Frequently Asked Questions</a>
				</p>


			</div>
			<div class="col-sm-8 " style="border-left: 2px solid orange">
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<h1 style="color: blue">
							Welcome
							<%=customer.getFirstName()%></h1>
					
					</div>
					<div id="manageQuote" class="tab-pane fade"><p>ldjfdljfldfjl</p></div>
					<div id="account" class="tab-pane fade">
						<h3>
							<label>First Name:</label> <label><b><%=customer.getFirstName()%></b></label><br>
							<label>Last Name:</label> <label><b><%=customer.getLastName()%></b></label><br>
							<% String policyNumber = (String) customer.getPolicyNumber(); %>
							<%if(policyNumber != null) {%><label>Your Policy#:</label> <label><b><%=customer.getPolicyNumber()%></b></label><br>
							<label>Your Policy#:</label> <label><b><%=customer.getPolicyNumber()%></b></label><br>
					<%} else {%>
							<label>Your Policy#:</label> <label><b>No Policy purchased Yet! <a href="/Asurance/#/quote">click to buy one</a></b></label><br>
						<%} %>
						</h3>
					</div>
					<div id="faq" class="tab-pane fade"><h1 >Browse All Questions</h1>
				<h3 style="color:green">Click on a question to view the answer</h3>
				
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
					</p></div>
				</div>
			</div>

		</div>
	</div>
 	<%} else {%> 
 	<c:redirect url="/#/login"/>
 	<%} %>
	<footer custom-footer></footer>
	<script src="public/app/modules/modules.js"></script>
	<script src="public/app/components/footer.js"></script>
	<script src="public/app/components/customLogo.js"></script>
</body>
</html>