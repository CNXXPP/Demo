package com.great.entity;

public class TrainerTable {
	private String traId;
	private String traName;
	private String traGender;
	private String traAge;
	private String traPhone;
	private String traScore;
	private String traHireDate;
	private String drivingType;
	public TrainerTable() {
		super();
	}
	public TrainerTable(String traId, String traName, String traGender,
			String traAge, String traPhone, String traScore,
			String traHireDate, String drivingType) {
		super();
		this.traId = traId;
		this.traName = traName;
		this.traGender = traGender;
		this.traAge = traAge;
		this.traPhone = traPhone;
		this.traScore = traScore;
		this.traHireDate = traHireDate;
		this.drivingType = drivingType;

	}
	public String getTraId() {
		return traId;
	}
	public void setTraId(String traId) {
		this.traId = traId;
	}
	public String getTraName() {
		return traName;
	}
	public void setTraName(String traName) {
		this.traName = traName;
	}
	public String getTraGender() {
		return traGender;
	}
	public void setTraGender(String traGender) {
		this.traGender = traGender;
	}
	public String getTraAge() {
		return traAge;
	}
	public void setTraAge(String traAge) {
		this.traAge = traAge;
	}
	public String getTraPhone() {
		return traPhone;
	}
	public void setTraPhone(String traPhone) {
		this.traPhone = traPhone;
	}
	public String getTraScore() {
		return traScore;
	}
	public void setTraScore(String traScore) {
		this.traScore = traScore;
	}
	public String getTraHireDate() {
		return traHireDate;
	}
	public void setTraHireDate(String traHireDate) {
		this.traHireDate = traHireDate;
	}
	public String getDrivingType() {
		return drivingType;
	}
	public void setDrivingType(String drivingType) {
		this.drivingType = drivingType;
	}
	
	
	
}
