package com.great.entity;

public class CheckStuCardTime {
	private String stuUuid;
	private String stuId;
	private String stuName;
	private int ctSub1;
	private int ctSub2;
	private int ctSub3;
	private int ctSub4;
	
	public CheckStuCardTime() {
		super();
	}

	public CheckStuCardTime(String stuUuid, String stuId, String stuName,
			int ctSub1, int ctSub2, int ctSub3, int ctSub4) {
		super();
		this.stuUuid = stuUuid;
		this.stuId = stuId;
		this.stuName = stuName;
		this.ctSub1 = ctSub1;
		this.ctSub2 = ctSub2;
		this.ctSub3 = ctSub3;
		this.ctSub4 = ctSub4;
	}

	public String getStuUuid() {
		return stuUuid;
	}

	public void setStuUuid(String stuUuid) {
		this.stuUuid = stuUuid;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getCtSub1() {
		return ctSub1;
	}

	public void setCtSub1(int ctSub1) {
		this.ctSub1 = ctSub1;
	}

	public int getCtSub2() {
		return ctSub2;
	}

	public void setCtSub2(int ctSub2) {
		this.ctSub2 = ctSub2;
	}

	public int getCtSub3() {
		return ctSub3;
	}

	public void setCtSub3(int ctSub3) {
		this.ctSub3 = ctSub3;
	}

	public int getCtSub4() {
		return ctSub4;
	}

	public void setCtSub4(int ctSub4) {
		this.ctSub4 = ctSub4;
	}

	

	
	

}
