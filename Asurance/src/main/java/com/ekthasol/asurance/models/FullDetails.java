package com.ekthasol.asurance.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "full_details", uniqueConstraints = { @UniqueConstraint(columnNames = "ID") })
public class FullDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private int ID;

	@Column(name = "CUSTOMER_ID")
	private Customer customerID;

	@Column(name = "ADDRESS_ID")
	private Address addressID;

	@Column(name = "CUSTOMER_INFO_ID")
	private CustomerInfo customerInfoID;

	@Column(name = "VEHICLE_ID")
	private Vehicle vehicleID;

	@Column(name = "QUOTE_ID")
	private Quote quoteID;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public Customer getCustomerID() {
		return customerID;
	}

	public void setCustomerID(Customer customerID) {
		this.customerID = customerID;
	}

	public Address getAddressID() {
		return addressID;
	}

	public void setAddressID(Address addressID) {
		this.addressID = addressID;
	}

	public CustomerInfo getCustomerInfoID() {
		return customerInfoID;
	}

	public void setCustomerInfoID(CustomerInfo customerInfoID) {
		this.customerInfoID = customerInfoID;
	}

	public Vehicle getVehicleID() {
		return vehicleID;
	}

	public void setVehicleID(Vehicle vehicleID) {
		this.vehicleID = vehicleID;
	}

	public Quote getQuoteID() {
		return quoteID;
	}

	public void setQuoteID(Quote quoteID) {
		this.quoteID = quoteID;
	}

	
	
}
