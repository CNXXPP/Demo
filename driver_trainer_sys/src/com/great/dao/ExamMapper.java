package com.great.dao;

import java.lang.reflect.Array;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.entity.Exam;
import com.great.entity.ExamRegister;
@Repository
public interface ExamMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table EXAM
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(String examUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table EXAM
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(Exam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table EXAM
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(Exam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table EXAM
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    Exam selectByPrimaryKey(String examUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table EXAM
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(Exam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table EXAM
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(Exam record);
    
    List<Map<String, Object>> getAllExamInfo();
    
    Exam selectBySubLocTime(Map<String, Object> map);
    
    List<Map<String, String>> getExamStuInfo(String examUuid);
    
    ArrayList<Exam> checkFirstExam(Exam exam);
    
    int updateExamCurNum(ExamRegister examRegister);
}