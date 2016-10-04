package com.ekthasol.asurance.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "customer_info", uniqueConstraints = { @UniqueConstraint(columnNames = "ID") })
public class CustomerInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private int customerInfoID;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "marital")
	private String marital;

	@Column(name = "education")
	private String education;

	@Column(name = "employment")
	private String employment;

	@Column(name = "ssn")
	private String ssn;

	/*@Column(name = "residence")
	private String residence;

	@Column(name = "moved")
	private String moved;*/

	@Column(name = "licenseNumber")
	private String licenseNumber;

	@Column(name = "primaryEmail")
	private String primaryEmail;

	@Column(name = "residents")
	private int residents;

	@Column(name = "claims")
	private int claims;

	@Column(name = "tickets")
	private int tickets;
	
	public int getCustomerInfoID() {
		return customerInfoID;
	}
	public void setCustomerInfoID(int customerInfoID) {
		this.customerInfoID = customerInfoID;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMarital() {
		return marital;
	}
	public void setMarital(String marital) {
		this.marital = marital;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	
	public String getEmployment() {
		return employment;
	}
	public void setEmployment(String employment) {
		this.employment = employment;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	/*public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public String getMoved() {
		return moved;
	}
	public void setMoved(String moved) {
		this.moved = moved;
	}*/
	public String getLicenseNumber() {
		return licenseNumber;
	}
	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}
	public String getPrimaryEmail() {
		return primaryEmail;
	}
	public void setPrimaryEmail(String primaryEmail) {
		this.primaryEmail = primaryEmail;
	}
	public int getResidents() {
		return residents;
	}
	public void setResidents(int residents) {
		this.residents = residents;
	}
	public int getClaims() {
		return claims;
	}
	public void setClaims(int claims) {
		this.claims = claims;
	}
	public int getTickets() {
		return tickets;
	}
	public void setTickets(int tickets) {
		this.tickets = tickets;
	}
	@Override
	public String toString() {
		return "CustomerInfo [customerInfoID=" + customerInfoID + ", gender=" + gender + ", marital=" + marital
				+ ", education=" + education + ", employment=" + employment + ", ssn=" + ssn + ", licenseNumber="
				+ licenseNumber + ", primaryEmail=" + primaryEmail + ", residents=" + residents + ", claims=" + claims
				+ ", tickets=" + tickets + "]";
	}
	
	
}
