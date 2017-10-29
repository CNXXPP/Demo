package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;import com.great.entity.StuMsg;
@Repository
public interface StuMsgMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(String smsgUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(StuMsg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(StuMsg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    StuMsg selectByPrimaryKey(String smsgUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(StuMsg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table STU_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(StuMsg record);
    int insertStuMsg(StuMsg record);
    
    public List<Map<String, String>> getStuMsgByStuUuidState(StuMsg stuMsg); //收发信箱
    
    public int getNeverReadNum(Map<String, String>map);//获取未读取的信件数量
    
    public int changeMessageState(Map<String, String>map);//读取后改变信件状态
}