package com.great.entity;

import java.math.BigDecimal;

public class StuCardTime {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column STU_CARD_TIME.CT_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String ctUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column STU_CARD_TIME.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String stuUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column STU_CARD_TIME.CT_SUB1
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private BigDecimal ctSub1;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column STU_CARD_TIME.CT_SUB2
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private BigDecimal ctSub2;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column STU_CARD_TIME.CT_SUB3
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private BigDecimal ctSub3;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column STU_CARD_TIME.CT_SUB4
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private BigDecimal ctSub4;
    
    
    
    
    
    

    public StuCardTime(String ctUuid, String stuUuid, BigDecimal ctSub1,
			BigDecimal ctSub2, BigDecimal ctSub3, BigDecimal ctSub4) {
		super();
		this.ctUuid = ctUuid;
		this.stuUuid = stuUuid;
		this.ctSub1 = ctSub1;
		this.ctSub2 = ctSub2;
		this.ctSub3 = ctSub3;
		this.ctSub4 = ctSub4;
	}

	public StuCardTime() {
		super();
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column STU_CARD_TIME.CT_UUID
     *
     * @return the value of STU_CARD_TIME.CT_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getCtUuid() {
        return ctUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column STU_CARD_TIME.CT_UUID
     *
     * @param ctUuid the value for STU_CARD_TIME.CT_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtUuid(String ctUuid) {
        this.ctUuid = ctUuid == null ? null : ctUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column STU_CARD_TIME.STU_UUID
     *
     * @return the value of STU_CARD_TIME.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getStuUuid() {
        return stuUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column STU_CARD_TIME.STU_UUID
     *
     * @param stuUuid the value for STU_CARD_TIME.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setStuUuid(String stuUuid) {
        this.stuUuid = stuUuid == null ? null : stuUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column STU_CARD_TIME.CT_SUB1
     *
     * @return the value of STU_CARD_TIME.CT_SUB1
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public BigDecimal getCtSub1() {
        return ctSub1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column STU_CARD_TIME.CT_SUB1
     *
     * @param ctSub1 the value for STU_CARD_TIME.CT_SUB1
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtSub1(BigDecimal ctSub1) {
        this.ctSub1 = ctSub1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column STU_CARD_TIME.CT_SUB2
     *
     * @return the value of STU_CARD_TIME.CT_SUB2
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public BigDecimal getCtSub2() {
        return ctSub2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column STU_CARD_TIME.CT_SUB2
     *
     * @param ctSub2 the value for STU_CARD_TIME.CT_SUB2
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtSub2(BigDecimal ctSub2) {
        this.ctSub2 = ctSub2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column STU_CARD_TIME.CT_SUB3
     *
     * @return the value of STU_CARD_TIME.CT_SUB3
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public BigDecimal getCtSub3() {
        return ctSub3;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column STU_CARD_TIME.CT_SUB3
     *
     * @param ctSub3 the value for STU_CARD_TIME.CT_SUB3
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtSub3(BigDecimal ctSub3) {
        this.ctSub3 = ctSub3;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column STU_CARD_TIME.CT_SUB4
     *
     * @return the value of STU_CARD_TIME.CT_SUB4
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public BigDecimal getCtSub4() {
        return ctSub4;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column STU_CARD_TIME.CT_SUB4
     *
     * @param ctSub4 the value for STU_CARD_TIME.CT_SUB4
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCtSub4(BigDecimal ctSub4) {
        this.ctSub4 = ctSub4;
    }

	@Override
	public String toString() {
		return "StuCardTime [ctUuid=" + ctUuid + ", stuUuid=" + stuUuid
				+ ", ctSub1=" + ctSub1 + ", ctSub2=" + ctSub2 + ", ctSub3="
				+ ctSub3 + ", ctSub4=" + ctSub4 + "]";
	}
    
    
    
}