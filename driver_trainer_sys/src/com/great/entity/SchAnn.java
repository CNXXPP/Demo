package com.great.entity;

public class SchAnn {
	private String anUuid;
	private String anTitle;
	private String sender;
	private String anContext;
	private String anDate;
	
	public SchAnn() {
		super();
	}

	public SchAnn(String anUuid, String anTitle, String sender,
			String anContext, String anDate) {
		super();
		this.anUuid = anUuid;
		this.anTitle = anTitle;
		this.sender = sender;
		this.anContext = anContext;
		this.anDate = anDate;
	}

	public String getAnUuid() {
		return anUuid;
	}

	public void setAnUuid(String anUuid) {
		this.anUuid = anUuid;
	}

	public String getAnTitle() {
		return anTitle;
	}

	public void setAnTitle(String anTitle) {
		this.anTitle = anTitle;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getAnContext() {
		return anContext;
	}

	public void setAnContext(String anContext) {
		this.anContext = anContext;
	}

	public String getAnDate() {
		return anDate;
	}

	public void setAnDate(String anDate) {
		this.anDate = anDate;
	}

	
	

}
