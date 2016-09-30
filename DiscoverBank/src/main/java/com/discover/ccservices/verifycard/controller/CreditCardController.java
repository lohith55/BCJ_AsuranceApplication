package com.discover.ccservices.verifycard.controller;

import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.discover.ccservices.verifycard.webservice.DiscoverCCWebService;

/**
 * @author Lohith Thota
 * This is the controller class that is exposed as a rest webservice
 * This service returns a boolean response in the form of a JSON String.
 */
@RestController
public class CreditCardController {

	@Autowired
	DiscoverCCWebService ccServices;

	boolean result;

	/*
	 * Accept credit card info in the form of a JSON string and quote amount as a path Variable
	 */
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@RequestMapping(value = "/processpayment/{quoteAmount}")
	public boolean processPayment(@RequestBody String cerditCardfromUser, @PathVariable("quoteAmount") final double quoteAmount) {

		if (cerditCardfromUser != null) {
			System.out.println("In discover app");
			System.out.println(cerditCardfromUser);
			System.out.println("completed");
			return ccServices.processPayment(cerditCardfromUser, quoteAmount);
		
		} else
			return false;

	}
}
