package com.ekthasol.asurance.service.payment;

import org.springframework.web.client.RestTemplate;

import com.ekthasol.asurance.models.CreditCard;
import com.google.gson.Gson;

public class PaymentService {

	

	public boolean processPayment(CreditCard creditCard, double amt) {
		String uri = "http://localhost:8080/PaymentHandlerApp/processpayment/";
		Gson gson = new Gson();
		String jsonInString = gson.toJson(creditCard);
		RestTemplate restTemplate = new RestTemplate();
		uri = uri + amt;
		
		return restTemplate.postForObject(uri, jsonInString, Boolean.class);
	}
}
