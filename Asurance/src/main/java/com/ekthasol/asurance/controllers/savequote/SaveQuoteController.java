package com.ekthasol.asurance.controllers.savequote;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ekthasol.asurance.models.Address;
import com.ekthasol.asurance.models.Customer;
import com.ekthasol.asurance.models.CustomerInfo;
import com.ekthasol.asurance.models.FullDetails;
import com.ekthasol.asurance.models.Quote;
import com.ekthasol.asurance.models.Vehicle;
import com.ekthasol.asurance.service.savequote.RetrieveQuoteService;
import com.ekthasol.asurance.service.savequote.SaveQuoteService;

@Controller
public class SaveQuoteController {

	@Autowired
	SaveQuoteService saveQuoteService;

	@Autowired
	RetrieveQuoteService retrieveQuoteService; 
	
	@RequestMapping(value = "/saveQuote", method = RequestMethod.POST)
	public String saveQuote(@RequestBody Quote quote,HttpSession session) {

		Customer customer = (Customer) session.getAttribute("customer");
		Address address = (Address) session.getAttribute("address");
		Vehicle vehicle = (Vehicle) session.getAttribute("selectedVehicle");
		CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("customerInfo");
		session.setAttribute("newQuote", quote);
		boolean status = saveQuoteService.saveQuote(customer, address, vehicle, quote, customerInfo);
		if(status){
			session.setAttribute("saved", "Details saved successfully!!!");
			return "saveQuote";
		}else
			return "failure";
	}
	
	@RequestMapping(value = "/retrieveQuote", method = RequestMethod.POST)
	public String retrieveQuote(@ModelAttribute Quote quote,HttpSession session) {

		FullDetails fullDetails = retrieveQuoteService.retrieveQuote(quote.getQuoteId());
		session.setAttribute("retrievedQuote", fullDetails);
		return "premium";
	}
	
	@RequestMapping(value = "/saved", method = RequestMethod.GET)
	public String goToPayments() {

		return "saveQuote";
	}
}
