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
	private int customerID;

	@Column(name = "ADDRESS_ID")
	private int addressID;

	@Column(name = "CUSTOMER_INFO_ID")
	private int customerInfoID;

	@Column(name = "VEHICLE_ID")
	private int vehicleID;

	@Column(name = "QUOTE_ID")
	private String quoteID;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}

	public int getCustomerInfoID() {
		return customerInfoID;
	}

	public void setCustomerInfoID(int customerInfoID) {
		this.customerInfoID = customerInfoID;
	}

	public int getVehicleID() {
		return vehicleID;
	}

	public void setVehicleID(int vehicleID) {
		this.vehicleID = vehicleID;
	}

	public String getQuoteID() {
		return quoteID;
	}

	public void setQuoteID(String quoteID) {
		this.quoteID = quoteID;
	}

	public FullDetails(int customerID, int addressID, int customerInfoID, int vehicleID, String quoteID) {
		super();
		this.customerID = customerID;
		this.addressID = addressID;
		this.customerInfoID = customerInfoID;
		this.vehicleID = vehicleID;
		this.quoteID = quoteID;
	}

	
	
}
