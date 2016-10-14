package com.ekthasol.asurance.dao.savequote;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ekthasol.asurance.models.FullDetails;

@Repository
public class RetrieveQuoteDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public FullDetails retrieveQuote(String quoteID){
		
		FullDetails fullDetails = new FullDetails();
		Session session = sessionFactory.openSession();
		try {
				Query query = session.createQuery("from FullDetails where QUOTE_ID=:quoteID");
				query.setParameter("quoteID", quoteID);
				fullDetails = (FullDetails) query.list().get(0);
				System.out.println(fullDetails.toString());
				fullDetails.getQuote().getQuoteAmount();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return fullDetails;
	}

}
