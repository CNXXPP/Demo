package com.great.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.great.entity.TrainerMsg;

@Repository
public interface TrainerMsgMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TRAINER_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int deleteByPrimaryKey(String tmsgUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TRAINER_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insert(TrainerMsg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TRAINER_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int insertSelective(TrainerMsg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TRAINER_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    List<TrainerMsg> selectByPrimaryKey(String tmsgUuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TRAINER_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKeySelective(TrainerMsg record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TRAINER_MSG
     *
     * @mbggenerated Tue Sep 26 17:46:16 CST 2017
     */
    int updateByPrimaryKey(TrainerMsg record);
    
    
    public List<Map<String, String>> selectMsg(String key);
    
    
    int updateState(String uuid);

}