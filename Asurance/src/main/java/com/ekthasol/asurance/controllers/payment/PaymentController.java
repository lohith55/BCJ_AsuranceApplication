package com.ekthasol.asurance.controllers.payment;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ekthasol.asurance.models.Address;
import com.ekthasol.asurance.models.CreditCard;
import com.ekthasol.asurance.models.Customer;
import com.ekthasol.asurance.models.CustomerInfo;
import com.ekthasol.asurance.models.FullDetails;
import com.ekthasol.asurance.models.Quote;
import com.ekthasol.asurance.models.Vehicle;
import com.ekthasol.asurance.service.payment.PaymentService;
import com.ekthasol.asurance.service.savequote.RetrieveQuoteService;
import com.ekthasol.asurance.service.savequote.SaveQuoteService;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@Autowired
	SaveQuoteService saveQuoteService;
	
	@Autowired
	RetrieveQuoteService retrieveQuoteService;

	/*
	 * Credit Card details and the billing address are sent to the controller as modelattributes 
	 */
	@RequestMapping(value = "/processPayment", method = RequestMethod.POST)
	public String paymentHandler(@ModelAttribute CreditCard creditCard, @ModelAttribute Address address,
			HttpSession session, HttpServletResponse response) {

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		//newQuote is retrieved from the session which is set in Quotegeneration controller
		Quote quote = (Quote) session.getAttribute("newQuote");
		
		//received address is set to the billing address in credit card
		creditCard.setBillingAddress(address);
		
		//the quote retrieved from the session is set the session as 'paidQuote'
		session.setAttribute("paidQuote", quote);
		
		//quote amount and creditcard are sent to the payment service
		boolean result = paymentService.processPayment(creditCard, quote.getQuoteAmount());

		
		// if result is true that means, payment is processed
		if (result) {
			
			//retrieving fulldetails from the session set into the session in QuoteGenerationController
			FullDetails fulldetails = (FullDetails) session.getAttribute("fullDetails");
			
			/*
			 * if fulldetails is not null, getting the quote id from customer and updating
			 * in the customer table as policy number.
			 */
			if (fulldetails != null) {
				
				Customer customer = fulldetails.getCustomer();
				customer.setPolicyNumber(quote.getQuoteId());
				
				saveQuoteService.updateCustomer(customer);
				session.setAttribute("customer", customer);
				
				return "policyDetails";
			} 
			
			/*
			 * if fulldetails is null, populating the full details with customer, quote id, vehicle, customerinfo
			 * from session.
			 */
			else {
				
				// getting attributes from session and setting into fulldetails
				Customer customer = (Customer) session.getAttribute("customer");
				customer.setPolicyNumber(quote.getQuoteId());
				Vehicle vehicle = (Vehicle) session.getAttribute("selectedVehicle");
				CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("customerInfo");
				
				//passing to service layer for saving the quote in the database
				saveQuoteService.saveQuote(customer, address, vehicle, quote, customerInfo);
				
				FullDetails fullDetails = new FullDetails(customer, address, vehicle, customerInfo, quote);
				
				session.setAttribute("fullDetails", fullDetails);
				
				return "policyDetails";
			}
		} 
		
		//if result is false, payment failed page is displayed
		else
			return "paymentfailed";
	}
}
