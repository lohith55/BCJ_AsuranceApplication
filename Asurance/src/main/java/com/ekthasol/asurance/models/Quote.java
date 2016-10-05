package com.ekthasol.asurance.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "quote", uniqueConstraints = { @UniqueConstraint(columnNames = "quoteID") })
public class Quote {

	@Id
	@Column(name = "quoteID")
	private String quoteId;

	@Column(name = "quoteAmount")
	private double quoteAmount;

	@Column(name = "liability")
	private double liability;

	@Column(name = "unInsured")
	private double unInsured;

	@Column(name = "underInsured")
	private double underInsured;

	@Column(name = "unInsuredPD")
	private double unInsuredPD;

	@Column(name = "injuryProtection")
	private double injuryProtection;

	@Column(name = "comprehensive")
	private double comprehensive;

	@Column(name = "collision")
	private double collision;

	@Column(name = "rental")
	private double rental;

	@Column(name = "roadSide")
	private double roadSide;
	
	@Transient
	private String vin;
	@Transient
	private String vehicleMakeYear;
	@Transient
	private List<String> driverList;	
	@Transient
	private String ssn;
	@Transient
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
	@Override
	public String toString() {
		return "Quote [quoteId=" + quoteId + ", quoteAmount=" + quoteAmount + ", liability=" + liability
				+ ", unInsured=" + unInsured + ", underInsured=" + underInsured + ", unInsuredPD=" + unInsuredPD
				+ ", injuryProtection=" + injuryProtection + ", comprehensive=" + comprehensive + ", collision="
				+ collision + ", rental=" + rental + ", roadSide=" + roadSide + ", vin=" + vin + ", vehicleMakeYear="
				+ vehicleMakeYear + ", driverList=" + driverList + ", ssn=" + ssn + ", education=" + education + "]";
	}
	
	
	
}
