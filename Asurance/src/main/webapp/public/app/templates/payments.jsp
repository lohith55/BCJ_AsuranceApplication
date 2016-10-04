<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src= "http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Payment Page</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" id="scrollNabar">
		<h2 style="text-align: center; color: red">Asurance</h2>
	</nav>
	<div id="navbar"></div>
<div class="container" style="margin-top: 88px;">
  <form class="form-horizontal" role="form" id="paymentForm" novalidate method="post" action="processPayment">
 
  <div class="form-group">
        <label class="col-sm-3 control-label" for="amount">Total Amount</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" name="amount" id="card-holder-name" value="${newQuote.getQuoteAmount() }" readonly>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="nameOnCard">Name on Card</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" name="nameOnCard" id="card-holder-name" placeholder="Card Holder's Name" required>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="creditCard">Card Number</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" name="creditCard" id="card-number" placeholder="Debit/Credit Card Number" required>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="expiryMonth">Expiration Date</label>
        <div class="col-sm-9">
          <div class="row">
            <div class="col-xs-3">
              <select class="form-control col-sm-2" name="expiryMonth" id="expiry-month" required>
                <option>Month</option>
                <option value="01">Jan (01)</option>
                <option value="02">Feb (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
            </div>
            <div class="col-xs-3">
              <select class="form-control" name="expiryYear" required>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code" required>
        </div>
      </div>
      
         <div class="form-group">
        <label class="col-sm-3 control-label" for="streetAddress">Street Address</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="addressLine1" id="streetAddress" placeholder="Street Address" required>
        </div>
      </div>
         <div class="form-group">
        <label class="col-sm-3 control-label" for="apt">Apt/Suite</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="addressLine2" id="apt" placeholder="apt/suite">
        </div>
      </div>
         <div class="form-group">
        <label class="col-sm-3 control-label" for="city">City</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="city" id="city" placeholder="City" required>
        </div>
      </div>
         <div class="form-group">
        <label class="col-sm-3 control-label" for="zip">Zip</label>
        <div class="col-sm-3">
          <input type="text" class="form-control" name="zip" id="zip" placeholder="Zip" required>
        </div>
      </div>
           
      <div class="form-group">
        <label class="col-sm-3 control-label" for="state">State</label>
        <div class="col-sm-5">
              <select class="form-control col-sm-2" name="state" id="state" required></select>
          </div>
        </div>
    
      
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <button type="submit" class="btn btn-success">Pay Now</button>
        </div>
      </div>

  </form>
</div>
				<hr class="colorgraph">


		<div class="row">
			<div class="col-sm-6">
				<button class="btn btn-md btn-primary" onClick="history.back()">Back</button>


			</div>
			<div class="col-sm-6">
				<a class="btn btn-md btn-primary" href="/Asurance">Cancel</a>
			</div>

		</div>
		</div> 
	</div>
</body>
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
							
						
							$.getJSON('public/app/data/usState.json', function(json){
								$.each(json,function(i, obj){
								console.log(json);
									$("#state").append('<option value="'+obj.name+'">'+obj.name+'</option>');
								});
							});
							
							$("#paymentForm").validate({
				});
							
						});
	</script>
</html>