<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.ekthasol.asurance.models.Customer" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../Asurance/public/css/footer.css" rel="stylesheet">
<!-- <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<script src="public/bower_components/angular/angular.js"></script>
<title>Customer Details</title>
<style>

/*  div.footer-para{
          text-align: justify;
          margin:20px 150px 20px 150px;
      }
footer{
      position: fixed;
      bottom: 0;
      background-color: #555;
      color: white;
      padding: 15px;
    } 
     */
    .navbar-inverse {
   /*  background-image: linear-gradient(to bottom,#3c3c3c 0,#f5f5f5 100%); */
    }
/*     .navbar-nav {
float:none;
margin:0 auto;
display: block;
text-align: center;
}

.navbar-nav>li {
font-size: 30px;
display: inline-block;
float:none;
} */
    </style> 
 
</head>
<body ng-app="components">
 
<%HttpSession sessiona = request.getSession(false); %>
<%if(sessiona != null) {%>
<% Customer customer = (Customer)session.getAttribute("customer"); %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">Asurance</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        <li><a href="/Asurance"><span class="glyphicon glyphicon-home"></span> Home </a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container " style="
    margin-top: 70px;
    margin-bottom: 484px;
    ">
	<div class="row">
		<div class="col-sm-12">
			<h1 style="color:blue">Welcome <%=customer.getFirstName()%></h1>
			<h3>
				<label>First Name:</label> <label><b><%=customer.getFirstName()%></b></label><br>
				<label>Last Name:</label> <label><b><%=customer.getLastName()%></b></label><br>
			</h3>
		</div>
	</div>
	
</div>
<%}%>
<footer custom-footer></footer>
 <script src="public/app/modules/modules.js"></script>
 <script src= "public/app/components/footer.js"></script>
 <script src= "public/app/components/customLogo.js"></script>	 
</body>
</html>