package com.great.entity;
/**
 * �������Բ�ѯ
 * */
public class StuExamInfo {

	private String stuId;//ѧ��id
	
	private String schName;//��У����
	
	private String stuName;//��������
	
	private String idCardNo;//���֤����
	
	private String subName;//���Կ�Ŀ
	
	private String examPlace;//���Եص�
	
	private String examType;//��������
	
	private String examTime;//����ʱ��
	
	private String examResult;//���Խ��
	
	
	

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
