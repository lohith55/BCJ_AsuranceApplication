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

	@RequestMapping(value = "/getCustomer", method = RequestMethod.POST)
	public String getCustomer(@ModelAttribute Customer customer, HttpSession session,
			HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		Customer cust = null;
		try {
			cust = loginService.getCustomer(customer.getEmail(), customer.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (cust != null) {
			String msg = (String) session.getAttribute("notLoggedIn");	
			if("true".equals(msg)){
				return "payments";
			}
			if (cust.getPolicyNumber() != null) {
				FullDetails fullDetails = retrieveQuoteService.retrieveQuote(cust.getPolicyNumber());
				session.setAttribute("full-details", fullDetails);
			}
			session.setAttribute("currentSession", "activeSession");
			session.setAttribute("customer", cust);
			session.setAttribute("loggedIn", "true");
			return ("success");
		} else {
			session.setAttribute("nopassword", "wrong password/email, try again!");
			return "redirect:/#/login";
		}
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String redirectToProfile() {
		return "success";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String redirect(SessionStatus status, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("inside logout " + session.getId());
		return "redirect:/#/login";
	}

}
