package com.great.entity;
/**
 * 考生考试查询
 * */
public class StuExamInfo {

	private String stuId;//学生id
	
	private String schName;//驾校名称
	
	private String stuName;//考生姓名
	
	private String idCardNo;//身份证号码
	
	private String subName;//考试科目
	
	private String examPlace;//考试地点
	
	private String examType;//考试类型
	
	private String examTime;//考试时间
	
	private String examResult;//考试结果
	
	
	

	public StuExamInfo() {
		super();
	}




	public StuExamInfo(String stuId, String schName, String stuName,
			String idCardNo, String subName, String examPlace, String examType,
			String examTime, String examResult) {
		super();
		this.stuId = stuId;
		this.schName = schName;
		this.stuName = stuName;
		this.idCardNo = idCardNo;
		this.subName = subName;
		this.examPlace = examPlace;
		this.examType = examType;
		this.examTime = examTime;
		this.examResult = examResult;
	}




	public String getStuId() {
		return stuId;
	}




	public void setStuId(String stuId) {
		this.stuId = stuId;
	}




	public String getSchName() {
		return schName;
	}




	public void setSchName(String schName) {
		this.schName = schName;
	}




	public String getStuName() {
		return stuName;
	}




	public void setStuName(String stuName) {
		this.stuName = stuName;
	}




	public String getIdCardNo() {
		return idCardNo;
	}




	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}




	public String getSubName() {
		return subName;
	}




	public void setSubName(String subName) {
		this.subName = subName;
	}




	public String getExamPlace() {
		return examPlace;
	}




	public void setExamPlace(String examPlace) {
		this.examPlace = examPlace;
	}




	public String getExamType() {
		return examType;
	}




	public void setExamType(String examType) {
		this.examType = examType;
	}




	public String getExamTime() {
		return examTime;
	}




	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}




	public String getExamResult() {
		return examResult;
	}




	public void setExamResult(String examResult) {
		this.examResult = examResult;
	}
	
	
	
	
	
}
