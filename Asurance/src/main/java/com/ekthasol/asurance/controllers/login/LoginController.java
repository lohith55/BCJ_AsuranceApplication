package com.ekthasol.asurance.controllers.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.ekthasol.asurance.models.Customer;
import com.ekthasol.asurance.models.FullDetails;
import com.ekthasol.asurance.service.login.LoginService;
import com.ekthasol.asurance.service.savequote.RetrieveQuoteService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	RetrieveQuoteService retrieveQuoteService;

	
	
	/*
	 * Here we get the customer login credentials like email & password from login.jsp
	 */	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String customerLogin(@ModelAttribute Customer customer, HttpSession session,
			HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		Customer cust = null;
		
		/*
		 * customer email id & password are being sent to the service layer
		 * to retrieve the customer
		 */
		try {
			cust = loginService.getCustomer(customer.getEmail(), customer.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * If customer is not null, it means the customer has registered previously
		 */
		if (cust != null) {
			
			
			/*
			 * Here we check if the customer has a policy number.
			 * If customer has a policy number, quote has been bought and
			 * we retrieve fullDetails using quote id/policy number 
			 */
			if (cust.getPolicyNumber() != null) {
				FullDetails fullDetails = retrieveQuoteService.retrieveQuote(cust.getPolicyNumber());
				session.setAttribute("fullDetails", fullDetails);
			}
			
			/*
			 * Setting the customer attribute to the session
			 */
			session.setAttribute("currentSession", "activeSession");
			session.setAttribute("customer", cust);
			session.setAttribute("loggedIn", "true");
			return ("success");
		} 
		
		/*
		 * No customer has been retrieved i.e, the customer is not registered.
		 * Redirecting customer to login
		 */
		else {
			session.setAttribute("nopassword", "wrong password/email, try again!");
			return "redirect:/#/login";
		}
	}

	
	
	
	// Link to Home page
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String redirectToProfile() {
		return "success";
	}

	
	/*
	 *  Customer logs out, session get invalidated.
	 *  Customer will be redirected to login page
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/#/login";
	}

}
