package com.ekthasol.asurance.controllers.registration;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ekthasol.asurance.models.Address;
import com.ekthasol.asurance.models.Customer;
import com.ekthasol.asurance.models.Quote;
import com.ekthasol.asurance.service.registration.RegistrationService;

@Controller
public class RegistrationController {

	@Autowired
	RegistrationService registrationService;


	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerCustomer(@RequestBody Customer customer, @ModelAttribute Address address,HttpSession session, HttpServletResponse  response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");


		boolean status = registrationService.saveCustomer(customer, address);

		if (status){
			Quote quote = (Quote) session.getAttribute("newQuote");	
			if(quote != null && quote.getQuoteAmount() > 0.00){
				return "redirect:/payments";
			}
			session.setAttribute("currentSession", "activeSession");
			session.setAttribute("customer", customer);
			return "success";
		}
		else{
			session.setAttribute("failure", "Could not register, try again!");
			return "redirect:/#/register";
		}
	
	}
	@RequestMapping(value = "/registered", method = RequestMethod.GET)
	public String goToPayments() {

		return "success";
	}
}
