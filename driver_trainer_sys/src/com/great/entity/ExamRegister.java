package com.great.entity;

public class ExamRegister {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column EXAM_REGISTER.REG_EXAM_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String regExamUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column EXAM_REGISTER.EXAM_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String examUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column EXAM_REGISTER.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String stuUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column EXAM_REGISTER.EXAM_PHOTO_PATH
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String examPhotoPath;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column EXAM_REGISTER.REG_EXAM_UUID
     *
     * @return the value of EXAM_REGISTER.REG_EXAM_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getRegExamUuid() {
        return regExamUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column EXAM_REGISTER.REG_EXAM_UUID
     *
     * @param regExamUuid the value for EXAM_REGISTER.REG_EXAM_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setRegExamUuid(String regExamUuid) {
        this.regExamUuid = regExamUuid == null ? null : regExamUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column EXAM_REGISTER.EXAM_UUID
     *
     * @return the value of EXAM_REGISTER.EXAM_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getExamUuid() {
        return examUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column EXAM_REGISTER.EXAM_UUID
     *
     * @param examUuid the value for EXAM_REGISTER.EXAM_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setExamUuid(String examUuid) {
        this.examUuid = examUuid == null ? null : examUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column EXAM_REGISTER.STU_UUID
     *
     * @return the value of EXAM_REGISTER.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getStuUuid() {
        return stuUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column EXAM_REGISTER.STU_UUID
     *
     * @param stuUuid the value for EXAM_REGISTER.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setStuUuid(String stuUuid) {
        this.stuUuid = stuUuid == null ? null : stuUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column EXAM_REGISTER.EXAM_PHOTO_PATH
     *
     * @return the value of EXAM_REGISTER.EXAM_PHOTO_PATH
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getExamPhotoPath() {
        return examPhotoPath;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column EXAM_REGISTER.EXAM_PHOTO_PATH
     *
     * @param examPhotoPath the value for EXAM_REGISTER.EXAM_PHOTO_PATH
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setExamPhotoPath(String examPhotoPath) {
        this.examPhotoPath = examPhotoPath == null ? null : examPhotoPath.trim();
    }
}