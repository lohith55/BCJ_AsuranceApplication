<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import=" com.ekthasol.asurance.models.Vehicle"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<title>Vehicle</title>
<style>
li {
	cursor: pointer;
	cursor: hand;
}
</style>
</head>
<body >
	<nav class="navbar navbar-inverse navbar-fixed-top" id="scrollNabar">
		<h2 style="text-align: center; color: red">Asurance</h2>
	</nav>
	<div id="navbar"></div>
	<div class="container-fluid text-center" style="margin-top: 86px;">
		<div class="row">
			<div class="col-sm-12">
				<h2 style="color: orange">Add vehicles to your quote.</h2>
				<p>Based on your address, we found the following car:</p>
			</div>
		</div>
		<form method="post" action="questionnaire" id="form">
			<c:forEach items="${vehicleList}" var="vehicleList">
				<hr class="colorgraph">
				<div class="row" id="formDiv">

					<div class="col-sm-6">
						<span id="selected${vehicleList.getVin() }"
							class="glyphicon glyphicon-ok selected"></span> <input
							type="text" name="vin" id="vin${vehicleList.getVin() }"
							value="${vehicleList.getVin() }"
							style="border: none; visibility: hidden;"><br>
						
						
						<div class="col-sm-4" style="margin-left: 10px ;padding:0px ;margin-left: 150px " >
							<label>Year:</label><input type="text" name="year"
								id="year${vehicleList.getVin() }"
								value="${vehicleList.getYear() }" style="border: none;">
							<br> <label>Make:</label><input class="make" type="text" name="make"
								id="make${vehicleList.getVin() }"
								value="${vehicleList.getMake() }" style="border: none;"><br>
							<label>Model:</label><input type="text" name="model"
								id="model${vehicleList.getVin() }"
								value="${vehicleList.getModel() }" style="border: none;"><br>
							<input type="text" name="isSelected"
								id="${vehicleList.getVin() }selected"
								value="${vehicleList.getIsSelected() }"
								style="border: none; visibility: hidden;">
						</div>
						<div class="col-sm-2" style="padding:0px ;">
							<img id=carImage  style="height: 110px; width: 200px; margin:0px" />
						</div>
						

					</div>
					<div class="col-sm-6">
						<button type="button" class="btn btn-lg btn-default addbtn"
							id="${vehicleList.getVin() }">
							<span class="glyphicon glyphicon-plus"></span>Add to quote
						</button>
						<button type="button" class="btn btn-lg btn-default rmvbtn"
							id="remove${vehicleList.getVin() }">
							<span class="glyphicon glyphicon-minus"></span>Remove
						</button>
					</div>
				</div>
			</c:forEach>
			<div class="row">
				<div class="col-sm-12" id="noVehicle">
					<p>At least one vehicle should be added!</p>
				</div>
			</div>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-sm-4">
					<button class="btn btn-md btn-primary" onClick="history.back()">Back</button>
				</div>
				<div class="col-sm-4">
					<a class="btn btn-md btn-primary" href="/Asurance">Cancel</a>
				</div>
				<div class="col-sm-4">
					<input type="submit" class="btn btn-md btn-primary"
						value="Save & Continue" id="submit">
				</div>

			</div>
		</form>
	</div>

	<script>
		$(document).ready(function() {
			var count = 0;
			var addBtnId = "";
			var vinId = $("#formDiv input:nth-child(2)").val();
			console.log(vinId);
			var selected = $("#" + vinId + "selected").val();
			console.log(selected);
			
			 $("#navbar").load('/Asurance/public/app/templates/navbar-for-quote.html');
			$(".rmvbtn").hide();
			$("#noVehicle").hide();
			$(".selected").hide(); 
			if(selected){
				$("#selected" + vinId).show();
				$("#" + vinId).hide();
				$("#remove" + vinId).show();
				count++;
				}
			
			 
			$(".addbtn").click(function() {
				 addBtnId = $(this).attr('id');
				$("#" + addBtnId).hide();
				$("#remove" + addBtnId).show();
				$("#selected" + addBtnId).show();
				$("#" + addBtnId + "selected").val(true);
				$("#noVehicle").hide();
				count++;
				$('input[type="submit"]').prop('disabled', false);
			});
		
			
			$(".rmvbtn").click(function() {
				var rmvBtnId = $(this).attr('id');
				var rmvString = rmvBtnId.substring(6);
				$("#" + rmvBtnId).hide();
				$("#" + rmvString).show();
				$("#" + rmvString + "selected").val(false);
				$("#selected" + rmvString).hide();
				count--;
				if(count == 0){
					$("#noVehicle").show();
					 $('input[type="submit"]').prop('disabled', true);
				}
				
			});
			
			 $("#submit").click(function(){
				if(count==0){
					$("#noVehicle").show();
					 $('input[type="submit"]').prop('disabled', true);
				}  else {
					$("#submit").bind("click", function(){
							console.log("clicked");
						});
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
			 
			 var car = $(".make").val();
			  
			 if(car == 'Honda'){
				 document.getElementById('carImage').src = "http://pngimg.com/upload/honda_PNG10324.png";
			  }
			 else if(car == 'Toyota'){
				 document.getElementById('carImage').src = "http://pngimg.com/upload/small/toyota_PNG1912.png";
			 }		 
			 else if(car == 'Porche'){
				 document.getElementById('carImage').src = "http://pngimg.com/upload/small/porsche_PNG10624.png";
			 }		 
			 else if(car == 'BMW'){
				 document.getElementById('carImage').src = "http://pngimg.com/upload/bmw_PNG1710.png";
			 }		 
			 else if(car == 'Ford'){
				 document.getElementById('carImage').src = "http://images.nadaguides.com/Models/640x480/2015-Ford-Mustang-V6.png";
			 }
			 
			 else if(car == 'Chervole'){
				 document.getElementById('carImage').src = "http://www.pngpix.com/wp-content/uploads/2016/06/PNGPIX-COM-Yellow-Chevrolet-Camaro-1LE-Car-PNG-Image.png"}
			 
			 else
				 document.getElementById('carImage').src = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR-ghh8Xna8s-oxduso3-4O2WbjAh8CBeN7suY4PKfTASbAWN8k";							
		});
		
 		
		
		
	</script>
	<script type="text/javascript">
	
	
   document.onload = function(){
	  var car = $(".make").val(); 
	  console.log(car);
	  if(car == Honda){
		  document.getElementById('someImage').src="http://pngimg.com/upload/honda_PNG10324.png";
	  }
       
   };

	</script>
	




</body>
</html>