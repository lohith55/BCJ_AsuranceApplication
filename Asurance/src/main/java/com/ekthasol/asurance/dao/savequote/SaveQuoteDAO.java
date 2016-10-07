package com.ekthasol.asurance.dao.savequote;

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
		
		
		int fulldetailID = 0;
		Session session = sessionFactory.openSession();
		try {
			session.save(address);
			session.save(customer);
			session.save(vehicle);
			session.save(customerInfo);
			session.save(quote);
			FullDetails fullDetails = new FullDetails();
			fullDetails.setCustomer(customer);
			fullDetails.setAddress(address);
			fullDetails.setCustomerInfo(customerInfo);
			fullDetails.setVehicle(vehicle);
			fullDetails.setQuote(quote);
			fulldetailID = (Integer) session.save(fullDetails);
			if(fulldetailID > 0)
				return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
