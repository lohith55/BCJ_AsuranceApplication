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
	 * 
	 * @param inputJson
	 * @param amt
	 * @return
	 */
	public boolean processPayment(String inputJson, double amt) {

		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.postForObject("http://localhost:8282/DiscoverBank/processpayment/" + amt, inputJson,
				Boolean.class);
	}

}
