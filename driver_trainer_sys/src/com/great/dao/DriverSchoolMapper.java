package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.entity.DriverSchool;
@Repository
public interface DriverSchoolMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DRIVER_SCHOOL
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(String schUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DRIVER_SCHOOL
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(DriverSchool record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DRIVER_SCHOOL
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(DriverSchool record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DRIVER_SCHOOL
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    /**
     * ��¼�ж�
     * @param school
     * @return
     */
    DriverSchool checkId(DriverSchool school);
    DriverSchool checkPwd(DriverSchool school);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DRIVER_SCHOOL
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(DriverSchool record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DRIVER_SCHOOL
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(DriverSchool record);
    
    List<DriverSchool> getAllDriverSchools();
    
    int updateByIdSelective(DriverSchool record);
    
    int deleteById(int schId);
    //���¼�У�ķ���
    public int updateSchoolScore(Map<String, Object> map );
    
    
    public List<Map<String, String>> allSchool();
}