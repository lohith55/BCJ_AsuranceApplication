package com.ekthasol.asurance.service.savequote;

import org.springframework.beans.factory.annotation.Autowired;

import com.ekthasol.asurance.dao.savequote.RetrieveQuoteDAO;
import com.ekthasol.asurance.models.FullDetails;

public class RetrieveQuoteService {
	
	@Autowired
	RetrieveQuoteDAO retrieveQuoteDAO;
	
	public FullDetails retrieveQuote(String quoteID){	
		
		return retrieveQuoteDAO.retrieveQuote(quoteID);
	}
}

