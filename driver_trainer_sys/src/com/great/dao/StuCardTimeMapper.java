package com.great.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.great.entity.CheckStuCardTime;
import com.great.entity.DriverSchool;
import com.great.entity.SignInShow;
import com.great.entity.StuCardTime;
import com.great.entity.Student;
@Repository
public interface StuCardTimeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_CARD_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(String ctUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_CARD_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(StuCardTime record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_CARD_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(StuCardTime record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_CARD_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    StuCardTime selectByPrimaryKey(String ctUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_CARD_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(StuCardTime record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_CARD_TIME
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(StuCardTime record);
    public StuCardTime selectBystuId(String stuUuid);
    
    public SignInShow showSignInShows(Student student);//展示学生的打卡信息
    
    public ArrayList<CheckStuCardTime> getStuTime(DriverSchool driverSchool);
    
    public int updateCartTime(String time, String stuUuid);
    
    public int upCartTime(String time, String stuUuid);
}