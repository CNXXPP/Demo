package com.great.entity;

public class MsgInfo {
	private String scmsgUuid;
	private String stuName;
	private String scmsgStatus;
	private String scmsgType;
	private String scmsgTitle;
	private String scmsgDate;
	private String scmsgContext;
	
	public MsgInfo() {
		super();
	}

	public MsgInfo(String scmsgUuid, String stuName, String scmsgStatus,
			String scmsgType, String scmsgTitle, String scmsgDate,
			String scmsgContext) {
		super();
		this.scmsgUuid = scmsgUuid;
		this.stuName = stuName;
		this.scmsgStatus = scmsgStatus;
		this.scmsgType = scmsgType;
		this.scmsgTitle = scmsgTitle;
		this.scmsgDate = scmsgDate;
		this.scmsgContext = scmsgContext;
	}

	public String getScmsgUuid() {
		return scmsgUuid;
	}

	public void setScmsgUuid(String scmsgUuid) {
		this.scmsgUuid = scmsgUuid;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getScmsgStatus() {
		return scmsgStatus;
	}

	public void setScmsgStatus(String scmsgStatus) {
		this.scmsgStatus = scmsgStatus;
	}

	public String getScmsgType() {
		return scmsgType;
	}

	public void setScmsgType(String scmsgType) {
		this.scmsgType = scmsgType;
	}

	public String getScmsgTitle() {
		return scmsgTitle;
	}

	public void setScmsgTitle(String scmsgTitle) {
		this.scmsgTitle = scmsgTitle;
	}

	public String getScmsgDate() {
		return scmsgDate;
	}

	public void setScmsgDate(String scmsgDate) {
		this.scmsgDate = scmsgDate;
	}

	public String getScmsgContext() {
		return scmsgContext;
	}

	public void setScmsgContext(String scmsgContext) {
		this.scmsgContext = scmsgContext;
	}

	

}
