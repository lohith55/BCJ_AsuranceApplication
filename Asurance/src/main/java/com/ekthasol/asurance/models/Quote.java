package com.ekthasol.asurance.models;

import java.util.List;

public class Quote {

	
	private String quoteId;
	private double quoteAmount;
	@Override
	public String toString() {
		return "Quote [quoteId=" + quoteId + ", quoteAmount=" + quoteAmount + ", perMonth=" + perMonth + ", liability="
				+ liability + ", unInsured=" + unInsured + ", underInsured=" + underInsured + ", unInsuredPD="
				+ unInsuredPD + ", injuryProtection=" + injuryProtection + ", comprehensive=" + comprehensive
				+ ", collision=" + collision + ", rental=" + rental + ", roadSide=" + roadSide + ", vin=" + vin
				+ ", vehicleMakeYear=" + vehicleMakeYear + ", driverList=" + driverList + ", ssn=" + ssn
				+ ", education=" + education + "]";
	}
	private double perMonth;
	private double liability;
	private double unInsured;
	private double underInsured;
	private double unInsuredPD;
	private double injuryProtection;
	private double comprehensive;
	private double collision;
	private double rental;
	private double roadSide;
	private String vin;
	private String vehicleMakeYear;
	private List<String> driverList;	
	private String ssn;
	private String education;
	
	
	public double getUnInsured() {
		return unInsured;
	}
	public void setUnInsured(double unInsured) {
		this.unInsured = unInsured;
	}
	public double getUnderInsured() {
		return underInsured;
	}
	public void setUnderInsured(double underInsured) {
		this.underInsured = underInsured;
	}
	public double getUnInsuredPD() {
		return unInsuredPD;
	}
	public void setUnInsuredPD(double unInsuredPD) {
		this.unInsuredPD = unInsuredPD;
	}
	public double getInjuryProtection() {
		return injuryProtection;
	}
	public void setInjuryProtection(double injuryProtection) {
		this.injuryProtection = injuryProtection;
	}
	public double getComprehensive() {
		return comprehensive;
	}
	public void setComprehensive(double comprehensive) {
		this.comprehensive = comprehensive;
	}
	public double getCollision() {
		return collision;
	}
	public void setCollision(double collision) {
		this.collision = collision;
	}
	public double getRental() {
		return rental;
	}
	public void setRental(double rental) {
		this.rental = rental;
	}
	public double getRoadSide() {
		return roadSide;
	}
	public void setRoadSide(double roadSide) {
		this.roadSide = roadSide;
	}
	public String getQuoteId() {
		return quoteId;
	}
	public void setQuoteId(String quoteId) {
		this.quoteId = quoteId;
	}
	public double getQuoteAmount() {
		return quoteAmount;
	}
	public void setQuoteAmount(double quoteAmount) {
		this.quoteAmount = quoteAmount;
	}
	public double getPerMonth() {
		return perMonth;
	}
	public void setPerMonth(double perMonth) {
		this.perMonth = perMonth;
	}
	public double getLiability() {
		return liability;
	}
	public void setLiability(double liability) {
		this.liability = liability;
	}
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	public String getVehicleMakeYear() {
		return vehicleMakeYear;
	}
	public void setVehicleMakeYear(String vehicleMakeYear) {
		this.vehicleMakeYear = vehicleMakeYear;
	}
	public List<String> getDriverList() {
		return driverList;
	}
	public void setDriverList(List<String> driverList) {
		this.driverList = driverList;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	
	
	
}
