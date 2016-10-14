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
import com.ekthasol.asurance.service.savequote.SaveQuoteService;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	SaveQuoteService saveQuoteService;
	
	@RequestMapping(value = "/processPayment",method = RequestMethod.POST)
		public String handlePayment(@ModelAttribute CreditCard creditCard,@ModelAttribute Address address, HttpSession session, HttpServletResponse  response) {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			System.out.println("in payment controller");
			Quote quote = (Quote) session.getAttribute("newQuote");
			creditCard.setBillingAddress(address);
			System.out.println(quote.getQuoteId());
			session.setAttribute("paidQuote", quote);
			boolean result = paymentService.processPayment(creditCard,quote.getQuoteAmount());
			System.out.println(result);
			System.out.println(quote.getQuoteId());
			if(result){
				Customer customer = (Customer) session.getAttribute("customer");
				customer.setPolicyNumber(quote.getQuoteId());
				Vehicle vehicle = (Vehicle) session.getAttribute("selectedVehicle");
				CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("customerInfo");
				saveQuoteService.saveQuote(customer, address, vehicle, quote, customerInfo);
				FullDetails fullDetails = new FullDetails(customer, address, vehicle, customerInfo, quote);
				session.setAttribute("full-details", fullDetails);
				return "policyDetails";
			}else
				return "paymentfailed";
	}
 }
			
		
