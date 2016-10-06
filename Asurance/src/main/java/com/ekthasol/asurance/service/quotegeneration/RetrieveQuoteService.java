package com.ekthasol.asurance.service.quotegeneration;

import org.springframework.beans.factory.annotation.Autowired;

import com.ekthasol.asurance.dao.quotegeneration.RetrieveQuoteDAO;
import com.ekthasol.asurance.models.FullDetails;

public class RetrieveQuoteService {
	
	@Autowired
	RetrieveQuoteDAO retrieveQuoteDAO;
	
	public FullDetails retrieveQuote(String quoteID){
		FullDetails fullDetails = new FullDetails();
		fullDetails = retrieveQuoteDAO.retrieveQuote(quoteID);
		return fullDetails;
	}

}
