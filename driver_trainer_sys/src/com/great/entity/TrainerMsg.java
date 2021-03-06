package com.great.entity;

import java.util.Date;

public class TrainerMsg {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TRA_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String traUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_TITLE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgTitle;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_CONTEXT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgContext;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_IDENTITY
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgIdentity;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Date tmsgDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_STATUS
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgStatus;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TRAINER_MSG.TMSG_GROUP
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String tmsgGroup;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_UUID
     *
     * @return the value of TRAINER_MSG.TMSG_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    
    
    
    public String getTmsgUuid() {
        return tmsgUuid;
    }

    public TrainerMsg(String tmsgUuid, String traUuid, String tmsgTitle,
			String tmsgContext, String tmsgIdentity, Date tmsgDate,
			String tmsgStatus, String tmsgType, String tmsgGroup) {
		super();
		this.tmsgUuid = tmsgUuid;
		this.traUuid = traUuid;
		this.tmsgTitle = tmsgTitle;
		this.tmsgContext = tmsgContext;
		this.tmsgIdentity = tmsgIdentity;
		this.tmsgDate = tmsgDate;
		this.tmsgStatus = tmsgStatus;
		this.tmsgType = tmsgType;
		this.tmsgGroup = tmsgGroup;
	}

	public TrainerMsg() {
		super();
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_UUID
     *
     * @param tmsgUuid the value for TRAINER_MSG.TMSG_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgUuid(String tmsgUuid) {
        this.tmsgUuid = tmsgUuid == null ? null : tmsgUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TRA_UUID
     *
     * @return the value of TRAINER_MSG.TRA_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTraUuid() {
        return traUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TRA_UUID
     *
     * @param traUuid the value for TRAINER_MSG.TRA_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTraUuid(String traUuid) {
        this.traUuid = traUuid == null ? null : traUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_TITLE
     *
     * @return the value of TRAINER_MSG.TMSG_TITLE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTmsgTitle() {
        return tmsgTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_TITLE
     *
     * @param tmsgTitle the value for TRAINER_MSG.TMSG_TITLE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgTitle(String tmsgTitle) {
        this.tmsgTitle = tmsgTitle == null ? null : tmsgTitle.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_CONTEXT
     *
     * @return the value of TRAINER_MSG.TMSG_CONTEXT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTmsgContext() {
        return tmsgContext;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_CONTEXT
     *
     * @param tmsgContext the value for TRAINER_MSG.TMSG_CONTEXT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgContext(String tmsgContext) {
        this.tmsgContext = tmsgContext == null ? null : tmsgContext.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_IDENTITY
     *
     * @return the value of TRAINER_MSG.TMSG_IDENTITY
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTmsgIdentity() {
        return tmsgIdentity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_IDENTITY
     *
     * @param tmsgIdentity the value for TRAINER_MSG.TMSG_IDENTITY
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgIdentity(String tmsgIdentity) {
        this.tmsgIdentity = tmsgIdentity == null ? null : tmsgIdentity.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_DATE
     *
     * @return the value of TRAINER_MSG.TMSG_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Date getTmsgDate() {
        return tmsgDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_DATE
     *
     * @param tmsgDate the value for TRAINER_MSG.TMSG_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgDate(Date tmsgDate) {
        this.tmsgDate = tmsgDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_STATUS
     *
     * @return the value of TRAINER_MSG.TMSG_STATUS
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTmsgStatus() {
        return tmsgStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_STATUS
     *
     * @param tmsgStatus the value for TRAINER_MSG.TMSG_STATUS
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgStatus(String tmsgStatus) {
        this.tmsgStatus = tmsgStatus == null ? null : tmsgStatus.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_TYPE
     *
     * @return the value of TRAINER_MSG.TMSG_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTmsgType() {
        return tmsgType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_TYPE
     *
     * @param tmsgType the value for TRAINER_MSG.TMSG_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgType(String tmsgType) {
        this.tmsgType = tmsgType == null ? null : tmsgType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TRAINER_MSG.TMSG_GROUP
     *
     * @return the value of TRAINER_MSG.TMSG_GROUP
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getTmsgGroup() {
        return tmsgGroup;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TRAINER_MSG.TMSG_GROUP
     *
     * @param tmsgGroup the value for TRAINER_MSG.TMSG_GROUP
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setTmsgGroup(String tmsgGroup) {
        this.tmsgGroup = tmsgGroup == null ? null : tmsgGroup.trim();
    }

	@Override
	public String toString() {
		return "TrainerMsg [tmsgUuid=" + tmsgUuid + ", traUuid=" + traUuid
				+ ", tmsgTitle=" + tmsgTitle + ", tmsgContext=" + tmsgContext
				+ ", tmsgIdentity=" + tmsgIdentity + ", tmsgDate=" + tmsgDate
				+ ", tmsgStatus=" + tmsgStatus + ", tmsgType=" + tmsgType
				+ ", tmsgGroup=" + tmsgGroup + "]";
	}
    
    
    
    
}