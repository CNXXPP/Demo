package com.great.entity;

public class AdmCharacter {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ADM_CHARACTER.CHAR_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Integer charNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ADM_CHARACTER.CHAR_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String charType;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ADM_CHARACTER.CHAR_NO
     *
     * @return the value of ADM_CHARACTER.CHAR_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Integer getCharNo() {
        return charNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ADM_CHARACTER.CHAR_NO
     *
     * @param charNo the value for ADM_CHARACTER.CHAR_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCharNo(Integer charNo) {
        this.charNo = charNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ADM_CHARACTER.CHAR_TYPE
     *
     * @return the value of ADM_CHARACTER.CHAR_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getCharType() {
        return charType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ADM_CHARACTER.CHAR_TYPE
     *
     * @param charType the value for ADM_CHARACTER.CHAR_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCharType(String charType) {
        this.charType = charType == null ? null : charType.trim();
    }
}