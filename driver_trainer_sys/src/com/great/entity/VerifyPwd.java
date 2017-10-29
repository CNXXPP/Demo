package com.great.entity;

public class VerifyPwd {
	
	
	private String id;
	private String pwd;
	
	public VerifyPwd(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "VerifyPwd [id=" + id + ", pwd=" + pwd + "]";
	}
	
	
	

}
