package com.great.entity;

import java.util.Date;

public class Notice {

	/**
	 * ������
	 * */
	
	private String uuid;//��ʾ
	
	private String title;//����
	
	private String conText;//����
	
	private String promulgator;//������
	
	private String releaseTime;//����ʱ��

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
