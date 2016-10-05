$(document).ready(function() {

 var quoteAmt = parseFloat($(".quoteAmount").attr("id").substring(5));
 var liabCheckedValue = 0;
 var uninsuredMotoristCheckedValue = 0;
 var underinsuredMotoristBICheckedValue = 0;
 var uninsuredMotoristPDCheckedValue = 0;
 var personalInjuryCheckedValue = 0;
 var compCheckedValue = 0;
 var collCheckedValue = 0;
 var rentCheckedValue = 0;
 var roadCheckedValue = 0;
 
 
console.log(quoteAmt);
/**
handling liability
**/
$("#liability").click(function(){
		 var radioValue = $("input[type='radio']:checked").val();
		 console.log(radioValue);
		 $("#liabilitySelection").html(radioValue);
		 console.log( $("#liabilitySelection").text());
		 var liabailityAmt = parseFloat($(".liabilityAmount").attr("id").substring(5));
		 console.log(liabailityAmt);
		var radioClass = $("input[type='radio']:checked").attr("id"); 
		console.log(radioClass);
		var spanValue = $("#" + radioClass).parent().parent().find('.liabilityOption').text();
		
		if(spanValue!= "Current"){
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= liabCheckedValue;
			}
		liabCheckedValue = parseFloat(spanValue.substring(2));
		liabailityAmt += liabCheckedValue;
		$(".liabilityAmount").html("$" + liabailityAmt);
		quoteAmt += liabCheckedValue;
		console.log(quoteAmt);
		$(".quoteAmount").html("$" + quoteAmt);
		console.log(spanValue);
		} else {
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= liabCheckedValue;
				liabCheckedValue = 0;
			}
			liabailityAmt = parseFloat($(".liabilityAmount").attr("id").substring(5));
				$(".liabilityAmount").html("$" + liabailityAmt);
				$(".quoteAmount").html("$" + quoteAmt);
		}
		
});

/**
handling uninsured motorist 
**/
$("#uninsuredMotorist").click(function(){
		 var radioValue = $("input[type='radio']:checked").val();
		 $("#uninsuredSelection").html(radioValue);
		 var uninsuredAmt = parseFloat($(".uninAmount").attr("id").substring(7));
		 console.log(uninsuredAmt);
		var radioClass = $("input[type='radio']:checked").attr("id"); 
		console.log(radioClass);
		var spanValue = $("#" + radioClass).parent().parent().find('.uninsuredOption').text();
		console.log(spanValue);
		if(spanValue!= "Current"){
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= uninsuredMotoristCheckedValue;
			}
			uninsuredMotoristCheckedValue = parseFloat(spanValue.substring(2));
			uninsuredAmt += uninsuredMotoristCheckedValue;
		$(".uninAmount").html("$" + uninsuredAmt);
		quoteAmt += uninsuredAmt;
		console.log(quoteAmt);
		$(".quoteAmount").html("$" + quoteAmt);
		console.log(spanValue);
		} else {
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= uninsuredMotoristCheckedValue;
				uninsuredMotoristCheckedValue = 0;
			}
			uninsuredAmt = parseFloat($(".uninAmount").attr("id").substring(7));
				$(".uninAmount").html("$" + uninsuredAmt);
				$(".quoteAmount").html("$" + quoteAmt);
		}
		
	
		
		
});

/**
	handling underinsured motorist BI
**/

$("#underInsuredBI").click(function(){
		 var radioValue = $("input[type='radio']:checked").val();
		 console.log(radioValue);
		 $("#underinsuredSelection").html(radioValue);
		 console.log( $("#underinsuredSelection").text());
		 var underInsuredAmt = parseFloat($(".underinAmount").attr("id").substring(10));
		 console.log(underInsuredAmt);
		var radioClass = $("input[type='radio']:checked").attr("id"); 
		console.log(radioClass);
		var spanValue = $("#" + radioClass).parent().parent().find('.underinsuredOption').text();
		
		if(spanValue!= "Current"){
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= underinsuredMotoristBICheckedValue;
			}
			underinsuredMotoristBICheckedValue = parseFloat(spanValue.substring(2));
			underInsuredAmt += underinsuredMotoristBICheckedValue;
		$(".underinAmount").html("$" + underInsuredAmt);
		quoteAmt += underInsuredAmt;
		console.log(quoteAmt);
		$(".quoteAmount").html("$" + quoteAmt);
		console.log(spanValue);
		} else {
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= underinsuredMotoristBICheckedValue;
				underinsuredMotoristBICheckedValue = 0;
			}
			underInsuredAmt = parseFloat($(".underinAmount").attr("id").substring(10));
				$(".underinAmount").html("$" + underInsuredAmt);
				$(".quoteAmount").html("$" + quoteAmt);
		}
		
});

/**
	handling uninsured motorist PD 
**/

$("#unInsuredMotoristPD").click(function(){
		 var radioValue = $("input[type='radio']:checked").val();
		 console.log(radioValue);
		 $("#uninsuredMotoristSelection").html(radioValue);
		 console.log( $("#uninsuredMotoristSelection").text());
		 var underInsuredPDAmt = parseFloat($(".underinPDAmount").attr("id").substring(7));
		 console.log(underInsuredPDAmt);
		var radioClass = $("input[type='radio']:checked").attr("id"); 
		console.log(radioClass);
		var spanValue = $("#" + radioClass).parent().parent().find('.unInsuredMotoristOption').text();
		
		if(spanValue!= "Current"){
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= uninsuredMotoristPDCheckedValue;
			}
			uninsuredMotoristPDCheckedValue = parseFloat(spanValue.substring(2));
			underInsuredPDAmt += uninsuredMotoristPDCheckedValue;
		$(".underinPDAmount").html("$" + underInsuredPDAmt);
		quoteAmt += underInsuredPDAmt;
		console.log(quoteAmt);
		$(".quoteAmount").html("$" + quoteAmt);
		console.log(spanValue);
		} else {
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= uninsuredMotoristPDCheckedValue;
				uninsuredMotoristPDCheckedValue = 0;
			}
			underInsuredPDAmt = parseFloat($(".underinPDAmount").attr("id").substring(7));
				$(".underinPDAmount").html("$" + underInsuredPDAmt);
				$(".quoteAmount").html("$" + quoteAmt);
		}
		
});

/**
	handling uninsured personal injury plan
**/

$("#personalInjury").click(function(){
		 var radioValue = $("input[type='radio']:checked").val();
		 console.log(radioValue);
		 $("#personalInjurySelection").html(radioValue);
		 console.log( $("#personalInjurySelection").text());
		 var personalInjuryAmt = parseFloat($(".personalAmount").attr("id").substring(14));
		 console.log(personalInjuryAmt);
		var radioClass = $("input[type='radio']:checked").attr("id"); 
		console.log(radioClass);
		var spanValue = $("#" + radioClass).parent().parent().find('.personalInjuryOption').text();
		
		if(spanValue!= "Current"){
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= personalInjuryCheckedValue;
			}
			personalInjuryCheckedValue = parseFloat(spanValue.substring(2));
			personalInjuryAmt += personalInjuryCheckedValue;
		$(".personalAmount").html("$" + personalInjuryAmt);
		quoteAmt += personalInjuryAmt;
		console.log(quoteAmt);
		$(".quoteAmount").html("$" + quoteAmt);
		console.log(spanValue);
		} else {
			if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= personalInjuryCheckedValue;
				personalInjuryCheckedValue = 0;
			}
			personalInjuryAmt = parseFloat($(".personalAmount").attr("id").substring(14));
				$(".personalAmount").html("$" + personalInjuryAmt);
				$(".quoteAmount").html("$" + quoteAmt);
		}
		
});

//Code for Comprehensive
$("#comprehensive").click(function(){
	 var radioValue = $("input[type='radio']:checked").val();
	 console.log(radioValue);
	 $("#compSelection").html(radioValue);
	 console.log( $("#compSelection").text());
	 var compAmt = parseFloat($(".compAmount").attr("id").substring(5));
	 console.log(compAmt);
	var radioClass = $("input[type='radio']:checked").attr("id");
	console.log(radioClass);
	var spanValue = $("#" + radioClass).parent().parent().find('.compOption').text();
	console.log(spanValue);
	if(spanValue!= "Current"){
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= compCheckedValue;
		}
	compCheckedValue = parseFloat(spanValue.substring(2));
	console.log(compCheckedValue);
	compAmt += compCheckedValue;
	console.log(compAmt);
	$(".compAmount").html("$" + compAmt);
		quoteAmt += compAmt;
	console.log(quoteAmt);
	$(".quoteAmount").html("$" + quoteAmt);
	
	} else {
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= compCheckedValue;
			compCheckedValue = 0;
		}
		compAmt = parseFloat($(".compAmount").attr("id").substring(5));
			$(".compAmount").html("$" + compAmt);
			$(".quoteAmount").html("$" + quoteAmt);
	}
	
});

//Code for Collision
$("#collision").click(function(){
	 var radioValue = $("input[type='radio']:checked").val();
	 console.log(radioValue);
	 $("#collSelection").html(radioValue);
	 console.log( $("#collSelection").text());
	 var collAmt = parseFloat($(".collAmount").attr("id").substring(5));
	 console.log(collAmt);
	var radioClass = $("input[type='radio']:checked").attr("id");
	console.log(radioClass);
	var spanValue = $("#" + radioClass).parent().parent().find('.collOption').text();
	console.log(spanValue);
	console.log(quoteAmt);
	if(spanValue!= "Current"){
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
				quoteAmt -= collCheckedValue;
		}
	collCheckedValue = parseFloat(spanValue.substring(2));
	console.log(collCheckedValue);
	collAmt += collCheckedValue;
	$(".collAmount").html("$" + collAmt);
		quoteAmt += collAmt;
	console.log(quoteAmt);
	$(".quoteAmount").html("$" + quoteAmt);
	console.log(spanValue);
	} else {
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= collCheckedValue;
			collCheckedValue = 0;
		}
		collAmt = parseFloat($(".collAmount").attr("id").substring(5));
			$(".collAmount").html("$" + collAmt);
			$(".quoteAmount").html("$" + quoteAmt);
	}
	
});

//Code for Rental
$("#rental").click(function(){
	 var radioValue = $("input[type='radio']:checked").val();
	 console.log(radioValue);
	 $("#rentSelection").html(radioValue);
	 console.log( $("#rentSelection").text());
	 var rentAmt = parseFloat($(".rentAmount").attr("id").substring(5));
	 console.log(rentAmt);
	var radioClass = $("input[type='radio']:checked").attr("id");
	console.log(radioClass);
	var spanValue = $("#" + radioClass).parent().parent().find('.rentOption').text();
	console.log(spanValue);
	console.log(quoteAmt);
	if(spanValue!= "Current"){
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= rentCheckedValue;
	}
	rentCheckedValue = parseFloat(spanValue.substring(2));
	console.log(rentCheckedValue);
	rentAmt += rentCheckedValue;
	$(".rentAmount").html("$" + rentAmt);
	quoteAmt += rentAmt;
	console.log(quoteAmt);
	$(".quoteAmount").html("$" + quoteAmt);
	console.log(spanValue);
	} else {
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= rentCheckedValue;
			rentCheckedValue = 0;
		}
		rentAmt = parseFloat($(".rentAmount").attr("id").substring(5));
			$(".rentAmount").html("$" + rentAmt);
			$(".quoteAmount").html("$" + quoteAmt);
	}
	
});

//Code for RoadSide
$("#roadside").click(function(){
	 var radioValue = $("input[type='radio']:checked").val();
	 console.log(radioValue);
	 $("#roadSelection").html(radioValue);
	 console.log( $("#roadSelection").text());
	 var roadAmt = parseFloat($(".roadAmount").attr("id").substring(5));
	 console.log(roadAmt);
	var radioClass = $("input[type='radio']:checked").attr("id");
	console.log(radioClass);
	var spanValue = $("#" + radioClass).parent().parent().find('.roadOption').text();
	console.log(spanValue);
	console.log(quoteAmt);
	if(spanValue!= "Current"){
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= roadCheckedValue;
	}
	roadCheckedValue = parseFloat(spanValue.substring(2));
	console.log(roadCheckedValue);
	roadAmt += roadCheckedValue;
	$(".roadAmount").html("$" + roadAmt);
	quoteAmt += roadAmt;
	console.log(quoteAmt);
	$(".quoteAmount").html("$" + quoteAmt);
	console.log(spanValue);
	} else {
		if(quoteAmt > parseFloat($(".quoteAmount").attr("id").substring(5))){
			quoteAmt -= roadCheckedValue;
			roadCheckedValue = 0;
		}
		roadAmt = parseFloat($(".roadAmount").attr("id").substring(5));
			$(".roadAmount").html("$" + roadAmt);
			$(".quoteAmount").html("$" + quoteAmt);
	}
	
});

$(".submit").click(function(e){
	e.preventDefault();
	var quoteID = $(".quoteId").text();
	var quoteAmt = $(".quoteAmount").text().substring(1);
	var liabilityAmt = $(".liabilityAmount").text().substring(1);
	var uninsuredAmt = $(".uninAmount").text().substring(1);
	var underInsuredAmt = $(".underinAmount").text().substring(1);
	var uninsuredPDAmt = $(".underinPDAmount").text().substring(1);
	var injuryProtectionAmt = $(".personalAmount").text().substring(1);
	var comprehensiveAmt = $(".compAmount").text().substring(1);
	var collisionAmt = $(".collAmount").text().substring(1);
	var rentalAmt = $(".rentAmount").text().substring(1);
	var roadsideAmt = $(".roadAmount").text().substring(1);
	var formData = {
			quoteId: quoteID,
			quoteAmount: quoteAmt,
			liability: liabilityAmt,
			unInsured: uninsuredAmt,
			underInsured: uninsuredAmt,
			uninsuredPD: uninsuredPDAmt,
			injuryProtection: injuryProtectionAmt,
			comprehensive: comprehensiveAmt,
			collision: collisionAmt,
			rental: rentalAmt,
			roadSide: roadsideAmt
	};
	   $.ajax(
		        {
		            type: "POST",
		            data: JSON.stringify(formData),
		            url: "payment",
		            contentType: 'application/json; charset=utf-8',
		            success: function(data){
		            	console.log(data);
		            	window.location.href = "payments";
		            }
		        });
});
	
	/*$("#liabilityInput").attr("value", liability);
	$("#unInsuredInput").attr("value", uninsured);
	$("#underInsuredInput").attr("value", underInsured);
	$("#unInsuredPDInput").attr("value", uninsuredPD);
	$("#injuryProtectionInput").attr("value", injuryProtection);
	$("#comprehensiveInput").attr("value", comphrensive);
	$("#collisionInput").attr("value", collision);
	$("#rentalInput").attr("value", rental);
	$("#roadSideInput").attr("value", roadside);
*/



});
