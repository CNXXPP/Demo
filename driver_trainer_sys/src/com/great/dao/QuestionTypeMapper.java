package com.great.dao;

import com.great.entity.QuestionType;

public interface QuestionTypeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table QUESTION_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(Integer tNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table QUESTION_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(QuestionType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table QUESTION_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(QuestionType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table QUESTION_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    QuestionType selectByPrimaryKey(Integer tNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table QUESTION_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(QuestionType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table QUESTION_TYPE
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(QuestionType record);
}