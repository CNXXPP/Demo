package com.great.dao;

import com.great.entity.FormalExamAnswer;

public interface FormalExamAnswerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FORMAL_EXAM_ANSWER
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(String fAnsUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FORMAL_EXAM_ANSWER
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(FormalExamAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FORMAL_EXAM_ANSWER
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(FormalExamAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FORMAL_EXAM_ANSWER
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    FormalExamAnswer selectByPrimaryKey(String fAnsUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FORMAL_EXAM_ANSWER
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(FormalExamAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FORMAL_EXAM_ANSWER
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(FormalExamAnswer record);
}