package com.great.entity;

import java.util.Date;

public class Notice {

	/**
	 * 公告类
	 * */
	
	private String uuid;//标示
	
	private String title;//标题
	
	private String conText;//内容
	
	private String promulgator;//发布者
	
	private String releaseTime;//发布时间

	public Notice() {
		super();
	}

	public Notice(String uuid, String title, String conText,
			String promulgator, String releaseTime) {
		super();
		this.uuid = uuid;
		this.title = title;
		this.conText = conText;
		this.promulgator = promulgator;
		this.releaseTime = releaseTime;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getConText() {
		return conText;
	}

	public void setConText(String conText) {
		this.conText = conText;
	}

	public String getPromulgator() {
		return promulgator;
	}

	public void setPromulgator(String promulgator) {
		this.promulgator = promulgator;
	}

	public String getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}

	@Override
	public String toString() {
		return "Notice [uuid=" + uuid + ", title=" + title + ", conText="
				+ conText + ", promulgator=" + promulgator + ", releaseTime="
				+ releaseTime + "]";
	}

	
}
