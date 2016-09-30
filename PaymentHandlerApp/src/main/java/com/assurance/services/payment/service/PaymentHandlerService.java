package com.assurance.services.payment.service;

import org.springframework.web.client.RestTemplate;

/**
 * @author Chandra Mouli This is a service class for the implementation of
 *         processPayment webservice
 */
public class PaymentHandlerService {

	

	/**
	 * This method has rest client to call processpayment webservice provided by
	 * DicoverBank
	 * @param inputJson
	 * @param amt
	 * @return
	 */
	public boolean processPayment(String inputJson, double amt) {
		String uri = "http://localhost:8282/DiscoverBank/processpayment/";
		RestTemplate restTemplate = new RestTemplate();
		uri = uri + amt;
		boolean result = restTemplate.postForObject(uri, inputJson, Boolean.class);
		return result;

	}

}
