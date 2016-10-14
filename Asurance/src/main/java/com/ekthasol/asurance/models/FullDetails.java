package com.ekthasol.asurance.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "full_details", uniqueConstraints = { @UniqueConstraint(columnNames = "ID") })
public class FullDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private int ID;

	public FullDetails() {
		super();
	}

	@ManyToOne
	@JoinColumn(name = "CUSTOMER_ID")
	private Customer customer;

	public FullDetails(Customer customer, Address address, Vehicle vehicle, CustomerInfo customerInfo, Quote quote) {
		super();
		this.customer = customer;
		this.address = address;
		this.vehicle = vehicle;
		this.customerInfo = customerInfo;
		this.quote = quote;
	}

	@ManyToOne
	@JoinColumn(name = "ADDRESS_ID")
	private Address address;
	
	@ManyToOne
	@JoinColumn(name = "VEHICLE_ID")
	private Vehicle vehicle;
	
	@ManyToOne
	@JoinColumn(name = "CUSTOMER_INFO_ID")
	private CustomerInfo customerInfo;
	
	@ManyToOne
	@JoinColumn(name = "QUOTE_ID")
	private Quote quote;

	@Override
	public String toString() {
		return "FullDetails [ID=" + ID + ", customer=" + customer + ", address=" + address + ", vehicle=" + vehicle
				+ ", customerInfo=" + customerInfo + ", quote=" + quote + "]";
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public CustomerInfo getCustomerInfo() {
		return customerInfo;
	}

	public void setCustomerInfo(CustomerInfo customerInfo) {
		this.customerInfo = customerInfo;
	}

	public Quote getQuote() {
		return quote;
	}

	public void setQuote(Quote quote) {
		this.quote = quote;
	}
	
}
