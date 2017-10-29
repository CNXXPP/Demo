package com.great.entity;

import java.math.BigDecimal;
import java.util.Date;

public class SchoolComment {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCHOOL_COMMENT.SCT_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String sctUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCHOOL_COMMENT.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String stuUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCHOOL_COMMENT.SCH_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String schUuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCHOOL_COMMENT.SCT_COMMENT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private String sctComment;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCHOOL_COMMENT.COMMENT_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private Date commentDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCHOOL_COMMENT.SCT_SCORE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    private BigDecimal sctScore;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCHOOL_COMMENT.SCT_UUID
     *
     * @return the value of SCHOOL_COMMENT.SCT_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getSctUuid() {
        return sctUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCHOOL_COMMENT.SCT_UUID
     *
     * @param sctUuid the value for SCHOOL_COMMENT.SCT_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setSctUuid(String sctUuid) {
        this.sctUuid = sctUuid == null ? null : sctUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCHOOL_COMMENT.STU_UUID
     *
     * @return the value of SCHOOL_COMMENT.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getStuUuid() {
        return stuUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCHOOL_COMMENT.STU_UUID
     *
     * @param stuUuid the value for SCHOOL_COMMENT.STU_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setStuUuid(String stuUuid) {
        this.stuUuid = stuUuid == null ? null : stuUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCHOOL_COMMENT.SCH_UUID
     *
     * @return the value of SCHOOL_COMMENT.SCH_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getSchUuid() {
        return schUuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCHOOL_COMMENT.SCH_UUID
     *
     * @param schUuid the value for SCHOOL_COMMENT.SCH_UUID
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setSchUuid(String schUuid) {
        this.schUuid = schUuid == null ? null : schUuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCHOOL_COMMENT.SCT_COMMENT
     *
     * @return the value of SCHOOL_COMMENT.SCT_COMMENT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public String getSctComment() {
        return sctComment;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCHOOL_COMMENT.SCT_COMMENT
     *
     * @param sctComment the value for SCHOOL_COMMENT.SCT_COMMENT
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setSctComment(String sctComment) {
        this.sctComment = sctComment == null ? null : sctComment.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCHOOL_COMMENT.COMMENT_DATE
     *
     * @return the value of SCHOOL_COMMENT.COMMENT_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public Date getCommentDate() {
        return commentDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCHOOL_COMMENT.COMMENT_DATE
     *
     * @param commentDate the value for SCHOOL_COMMENT.COMMENT_DATE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCHOOL_COMMENT.SCT_SCORE
     *
     * @return the value of SCHOOL_COMMENT.SCT_SCORE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public BigDecimal getSctScore() {
        return sctScore;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCHOOL_COMMENT.SCT_SCORE
     *
     * @param sctScore the value for SCHOOL_COMMENT.SCT_SCORE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    public void setSctScore(BigDecimal sctScore) {
        this.sctScore = sctScore;
    }
}