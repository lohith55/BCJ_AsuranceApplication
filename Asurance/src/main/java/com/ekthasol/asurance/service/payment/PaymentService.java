package com.ekthasol.asurance.service.payment;

import org.springframework.web.client.RestTemplate;

import com.ekthasol.asurance.models.CreditCard;
import com.google.gson.Gson;

public class PaymentService {

	

	public boolean processPayment(CreditCard creditCard, double amt) {
		String uri = "http://localhost:8080/PaymentHandlerApp/processpayment/";
		System.out.println("in payment service");
		Gson gson = new Gson();
		String jsonInString = gson.toJson(creditCard);
		RestTemplate restTemplate = new RestTemplate();
		uri = uri + amt;
		System.out.println(uri);
		System.out.println(jsonInString);
		boolean result = restTemplate.postForObject(uri, jsonInString, Boolean.class);

		return result;

	}
}
