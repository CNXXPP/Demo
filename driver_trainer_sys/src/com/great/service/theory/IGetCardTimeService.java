package com.great.service.theory;

import java.util.List;
import java.util.Map;

import com.great.entity.CardTimeRecord;
import com.great.entity.StuCardTime;

public interface IGetCardTimeService {
    //查询一个学员已经学习的学时、未完成的学时、是否完成的状态
	public StuCardTime selectCardtime(String stuUuid) throws Exception;
	//查询一个学员的第一阶段详细网上学习学时
	public List<Map<String, String>> selectFirstSubTime(String stuUuid) throws Exception;
	//查询一个学员的第四阶段详细网上学习学时
	public List<Map<String, String>> selectForthSubTime(String stuUuid) throws Exception;
	//更新打卡时间
	public int updateStuCartTime(String time, String stuUuid) throws Exception;
	
	public int upStuCartTime(String time, String stuUuid) throws Exception;
	
	public int insertStuCartTime(CardTimeRecord rec) throws Exception;
}
