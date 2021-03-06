package com.great.entity;

import java.math.BigDecimal;
import java.util.Date;

public class CardTimeRecord {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CARD_TIME_RECORD.CTR_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String ctrUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CARD_TIME_RECORD.SUB_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Integer subNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CARD_TIME_RECORD.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String stuUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CARD_TIME_RECORD.CTR_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Date ctrDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CARD_TIME_RECORD.CTR_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private BigDecimal ctrTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CARD_TIME_RECORD.CTR_UUID
     *
     * @return the value of CARD_TIME_RECORD.CTR_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getCtrUuid() {
        return ctrUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CARD_TIME_RECORD.CTR_UUID
     *
     * @param ctrUuid the value for CARD_TIME_RECORD.CTR_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtrUuid(String ctrUuid) {
        this.ctrUuid = ctrUuid == null ? null : ctrUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CARD_TIME_RECORD.SUB_NO
     *
     * @return the value of CARD_TIME_RECORD.SUB_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Integer getSubNo() {
        return subNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CARD_TIME_RECORD.SUB_NO
     *
     * @param subNo the value for CARD_TIME_RECORD.SUB_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setSubNo(Integer subNo) {
        this.subNo = subNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CARD_TIME_RECORD.STU_UUID
     *
     * @return the value of CARD_TIME_RECORD.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getStuUuid() {
        return stuUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CARD_TIME_RECORD.STU_UUID
     *
     * @param stuUuid the value for CARD_TIME_RECORD.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setStuUuid(String stuUuid) {
        this.stuUuid = stuUuid == null ? null : stuUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CARD_TIME_RECORD.CTR_DATE
     *
     * @return the value of CARD_TIME_RECORD.CTR_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Date getCtrDate() {
        return ctrDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CARD_TIME_RECORD.CTR_DATE
     *
     * @param ctrDate the value for CARD_TIME_RECORD.CTR_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtrDate(Date ctrDate) {
        this.ctrDate = ctrDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CARD_TIME_RECORD.CTR_TIME
     *
     * @return the value of CARD_TIME_RECORD.CTR_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public BigDecimal getCtrTime() {
        return ctrTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CARD_TIME_RECORD.CTR_TIME
     *
     * @param ctrTime the value for CARD_TIME_RECORD.CTR_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtrTime(BigDecimal ctrTime) {
        this.ctrTime = ctrTime;
    }

	@Override
	public String toString() {
		return "CardTimeRecord [ctrUuid=" + ctrUuid + ", subNo=" + subNo
				+ ", stuUuid=" + stuUuid + ", ctrDate=" + ctrDate
				+ ", ctrTime=" + ctrTime + "]";
	}
    
    
}