package com.ekthasol.asurance.controllers.quotegeneration;

import java.util.ArrayList;
import java.util.List;

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
import com.ekthasol.asurance.models.Quote;
import com.ekthasol.asurance.models.Vehicle;
import com.ekthasol.asurance.service.quotegeneration.QuoteGenerationService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Controller
public class QuoteGenerationController {

	@Autowired
	QuoteGenerationService quoteGenerationService;

	/*@Autowired
	PaymentService paymentService;*/
	
	public List<String> licenseList = new ArrayList<String>();

	@RequestMapping(value = "/getVehicles", method = RequestMethod.POST)
	public String getVehicles(@ModelAttribute Customer customer, @ModelAttribute Address address, HttpSession session) {
		String output = quoteGenerationService.getVehiclesList(address);
		session.setAttribute("customer", customer);
		session.setAttribute("address", address);
		if (output != null) {
			List<Vehicle> vehicleList = null;
			ObjectMapper mapper = new ObjectMapper();
			try {
				vehicleList = mapper.readValue(output,
						TypeFactory.defaultInstance().constructCollectionType(List.class, Vehicle.class));
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (vehicleList != null && !vehicleList.isEmpty()) {
				session.setAttribute("vehicleList", vehicleList);
				return "vehicleList";
			} else {
				session.setAttribute("message", "No Vehicles found");
				return "redirect:/#/quote";
			}
		} else {

			session.setAttribute("message", "Address did not match");
			return "redirect:/#/quote";
		}
	}

	@RequestMapping(value = "/questionnaire", method = RequestMethod.POST)
	public String getQuestions(@ModelAttribute Vehicle selectedVehicle, HttpSession session) {

		session.setAttribute("selectedVehicle", selectedVehicle);
		System.out.println(selectedVehicle.toString());
		return "questionaire";
	}

	@RequestMapping(value = "/addDriver", method = RequestMethod.POST)
	public String addDriver(@ModelAttribute CustomerInfo customerInfo, HttpSession session) {

		licenseList.add(customerInfo.getLicenseNumber());
		session.setAttribute("licenseList", licenseList);
		for (String license : licenseList)
			System.out.println(license);
		session.setAttribute("customerInfo", customerInfo);
		System.out.println(customerInfo.toString());
		session.setAttribute("failMessage", "");
		return "driverInfo";
	}

	@RequestMapping(value = "/getQuote", method = RequestMethod.POST)
	public String goToPremium(HttpSession session) {

		
		CustomerInfo custInfo = (CustomerInfo) session.getAttribute("customerInfo");
		System.out.println(custInfo.toString());
		Vehicle vehicleInfo = (Vehicle) session.getAttribute("selectedVehicle");

		Quote inputQuote = new Quote();
		inputQuote.setEducation(custInfo.getEducation());
		inputQuote.setDriverList(licenseList);
		inputQuote.setSsn(custInfo.getSsn());
		inputQuote.setVin(vehicleInfo.getVin());
		inputQuote.setVehicleMakeYear(vehicleInfo.getYear());

		Quote resultQuote = quoteGenerationService.getQuoteAmount(inputQuote);
		if(resultQuote != null){
			session.setAttribute("quote", resultQuote);
			licenseList.clear();
			return ("premium");
		}
		else{
			session.setAttribute("failMessage", "Couldn't generate the quote, try again later!!");
			licenseList.clear();
			return ("driverInfo");
		}
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String verifyCreditCard(@RequestBody Quote quote,HttpSession session) {

		System.out.println(quote.toString());
		session.setAttribute("newQuote", quote);
		return "payments";
	}
	
	@RequestMapping(value = "/payments", method = RequestMethod.GET)
	public String goToPayments() {

		return "payments";
	}
	/*
	@RequestMapping(value = "/processPayment", method = RequestMethod.POST)
	public String processPayment(@ModelAttribute CreditCard creditCard,HttpSession session) {

		session.setAttribute("creditCard", creditCard);
		paymentService.processPayment(creditCard, 576.00);
		return "payments";
	}*/
}
