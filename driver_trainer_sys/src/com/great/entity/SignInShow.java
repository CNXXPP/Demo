package com.great.entity;
/**
 * 学员打卡信息显示
 * */
public class SignInShow {

	private String schoolName;//驾校名称
	
	private String stuName;//学员姓名
	
	private String idCard;//身份证号码
	
	private String subject;//科目
	
	private double  totalHours;//总学时
	
	private double cumulativeHours;//累计学时

	public SignInShow() {
		super();
	}

	public SignInShow(String schoolName, String stuName, String idCard,
			String subject, double totalHours, double cumulativeHours) {
		super();
		this.schoolName = schoolName;
		this.stuName = stuName;
		this.idCard = idCard;
		this.subject = subject;
		this.totalHours = totalHours;
		this.cumulativeHours = cumulativeHours;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public double getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(double totalHours) {
		this.totalHours = totalHours;
	}

	public double getCumulativeHours() {
		return cumulativeHours;
	}

	public void setCumulativeHours(double cumulativeHours) {
		this.cumulativeHours = cumulativeHours;
	}

	
	
	
	
}
