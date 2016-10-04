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
import com.ekthasol.asurance.models.Quote;
import com.ekthasol.asurance.service.payment.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@RequestMapping(value = "/processPayment",method = RequestMethod.POST)
		public String handlePayment(@ModelAttribute CreditCard creditCard,@ModelAttribute Address address, HttpSession session, HttpServletResponse  response) {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			System.out.println("in payment controller");
			Quote quote = (Quote) session.getAttribute("newQuote");
			creditCard.setBillingAddress(address);
			boolean result = paymentService.processPayment(creditCard,quote.getQuoteAmount());
			System.out.println(result);
			if(result)
				return "paymentsuccess";
			else
				return "failure";
	}
 }
			
		
