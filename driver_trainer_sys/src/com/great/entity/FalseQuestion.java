package com.great.entity;

public class FalseQuestion {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FALSE_QUESTION.FALSE_QUES_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String falseQuesUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FALSE_QUESTION.Q_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Integer qNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FALSE_QUESTION.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String stuUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FALSE_QUESTION.FALSE_CNT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Integer falseCnt;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FALSE_QUESTION.FALSE_QUES_UUID
     *
     * @return the value of FALSE_QUESTION.FALSE_QUES_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getFalseQuesUuid() {
        return falseQuesUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FALSE_QUESTION.FALSE_QUES_UUID
     *
     * @param falseQuesUuid the value for FALSE_QUESTION.FALSE_QUES_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setFalseQuesUuid(String falseQuesUuid) {
        this.falseQuesUuid = falseQuesUuid == null ? null : falseQuesUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FALSE_QUESTION.Q_NO
     *
     * @return the value of FALSE_QUESTION.Q_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Integer getqNo() {
        return qNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FALSE_QUESTION.Q_NO
     *
     * @param qNo the value for FALSE_QUESTION.Q_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setqNo(Integer qNo) {
        this.qNo = qNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FALSE_QUESTION.STU_UUID
     *
     * @return the value of FALSE_QUESTION.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getStuUuid() {
        return stuUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FALSE_QUESTION.STU_UUID
     *
     * @param stuUuid the value for FALSE_QUESTION.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setStuUuid(String stuUuid) {
        this.stuUuid = stuUuid == null ? null : stuUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FALSE_QUESTION.FALSE_CNT
     *
     * @return the value of FALSE_QUESTION.FALSE_CNT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Integer getFalseCnt() {
        return falseCnt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FALSE_QUESTION.FALSE_CNT
     *
     * @param falseCnt the value for FALSE_QUESTION.FALSE_CNT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setFalseCnt(Integer falseCnt) {
        this.falseCnt = falseCnt;
    }

	@Override
	public String toString() {
		return "FalseQuestion [falseQuesUuid=" + falseQuesUuid + ", qNo=" + qNo
				+ ", stuUuid=" + stuUuid + ", falseCnt=" + falseCnt + "]";
	}
    
    
}