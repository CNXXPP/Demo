package com.great.entity;

public class FormalExamAnswer {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FORMAL_EXAM_ANSWER.F_ANS_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String fAnsUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FORMAL_EXAM_ANSWER.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String stuUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FORMAL_EXAM_ANSWER.Q_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Integer qNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column FORMAL_EXAM_ANSWER.F_ANS_CHOICE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String fAnsChoice;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FORMAL_EXAM_ANSWER.F_ANS_UUID
     *
     * @return the value of FORMAL_EXAM_ANSWER.F_ANS_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getfAnsUuid() {
        return fAnsUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FORMAL_EXAM_ANSWER.F_ANS_UUID
     *
     * @param fAnsUuid the value for FORMAL_EXAM_ANSWER.F_ANS_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setfAnsUuid(String fAnsUuid) {
        this.fAnsUuid = fAnsUuid == null ? null : fAnsUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FORMAL_EXAM_ANSWER.STU_UUID
     *
     * @return the value of FORMAL_EXAM_ANSWER.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getStuUuid() {
        return stuUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FORMAL_EXAM_ANSWER.STU_UUID
     *
     * @param stuUuid the value for FORMAL_EXAM_ANSWER.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setStuUuid(String stuUuid) {
        this.stuUuid = stuUuid == null ? null : stuUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FORMAL_EXAM_ANSWER.Q_NO
     *
     * @return the value of FORMAL_EXAM_ANSWER.Q_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Integer getqNo() {
        return qNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FORMAL_EXAM_ANSWER.Q_NO
     *
     * @param qNo the value for FORMAL_EXAM_ANSWER.Q_NO
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setqNo(Integer qNo) {
        this.qNo = qNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column FORMAL_EXAM_ANSWER.F_ANS_CHOICE
     *
     * @return the value of FORMAL_EXAM_ANSWER.F_ANS_CHOICE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getfAnsChoice() {
        return fAnsChoice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column FORMAL_EXAM_ANSWER.F_ANS_CHOICE
     *
     * @param fAnsChoice the value for FORMAL_EXAM_ANSWER.F_ANS_CHOICE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setfAnsChoice(String fAnsChoice) {
        this.fAnsChoice = fAnsChoice == null ? null : fAnsChoice.trim();
    }
}