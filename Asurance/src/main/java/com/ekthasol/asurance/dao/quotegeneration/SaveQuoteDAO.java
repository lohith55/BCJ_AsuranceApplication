package com.ekthasol.asurance.dao.quotegeneration;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ekthasol.asurance.models.Address;
import com.ekthasol.asurance.models.Customer;
import com.ekthasol.asurance.models.CustomerInfo;
import com.ekthasol.asurance.models.FullDetails;
import com.ekthasol.asurance.models.Quote;
import com.ekthasol.asurance.models.Vehicle;

public class SaveQuoteDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public boolean saveQuote(Customer customer,Address address,Vehicle vehicle,Quote quote,CustomerInfo customerInfo){
		
		
		int addressID = 0,customerID = 0,vehicleID = 0,customerInfoID = 0,fulldetailID = 0;
		Session session = sessionFactory.openSession();
		try {
			addressID = (Integer) session.save(address);
			customerID = (Integer) session.save(customer);
			vehicleID = (Integer) session.save(vehicle);
			customerInfoID = (Integer) session.save(customerInfo);
			session.save(quote);
			FullDetails fullDetails = new FullDetails(customerID, addressID, customerInfoID, vehicleID, quote.getQuoteId());
			fulldetailID = (Integer) session.save(fullDetails);
			if(fulldetailID > 0)
				return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
