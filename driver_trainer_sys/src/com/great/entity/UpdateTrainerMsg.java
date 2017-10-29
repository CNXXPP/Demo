package com.great.entity;

public class UpdateTrainerMsg {

	private String uuid;
	private String Phone;
	private String traIntro;
	
	
	
	
	
	public UpdateTrainerMsg() {
		super();
	}





	public UpdateTrainerMsg(String uuid, String phone, String traIntro) {
		super();
		this.uuid = uuid;
		Phone = phone;
		this.traIntro = traIntro;
	}





	public String getUuid() {
		return uuid;
	}





	public void setUuid(String uuid) {
		this.uuid = uuid;
	}





	public String getPhone() {
		return Phone;
	}





	public void setPhone(String phone) {
		Phone = phone;
	}





	public String getTraIntro() {
		return traIntro;
	}





	public void setTraIntro(String traIntro) {
		this.traIntro = traIntro;
	}





	@Override
	public String toString() {
		return "UpdateTrainerMsg [uuid=" + uuid + ", Phone=" + Phone
				+ ", traIntro=" + traIntro + "]";
	}
	
	
	
	
	

 }
