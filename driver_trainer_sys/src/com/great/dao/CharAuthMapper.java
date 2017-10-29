package com.great.dao;

import com.great.entity.CharAuth;
import org.apache.ibatis.annotations.Param;

public interface CharAuthMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHAR_AUTH
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(@Param("charNo") Integer charNo, @Param("authNo") Integer authNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHAR_AUTH
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(CharAuth record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHAR_AUTH
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(CharAuth record);
}