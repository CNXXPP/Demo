package com.great.service.theoryImp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.CardTimeRecordMapper;
import com.great.dao.StuCardTimeMapper;
import com.great.entity.CardTimeRecord;
import com.great.entity.StuCardTime;
import com.great.service.theory.IGetCardTimeService;

@Service
public class GetCardTimeServiceImpl implements IGetCardTimeService{

	@Autowired
	StuCardTimeMapper stuCardTime;
	@Autowired
	CardTimeRecordMapper cardTimeRecord;
	
	
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	//查询一个学员已经学习的学时、未完成的学时、是否完成的状态
	public StuCardTime selectCardtime(String stuUuid) throws Exception {
		// TODO Auto-generated method stub
		StuCardTime cardtime = stuCardTime.selectBystuId(stuUuid);
		
		return cardtime;
	}
	
	
	
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	//查询一个学员的第一阶段详细网上学习学时
	public List<Map<String, String>> selectFirstSubTime(String stuUuid) 
			throws Exception {
		// TODO Auto-generated method stub
		//从DAO返回数据
		return cardTimeRecord.selectFirstSubTime(stuUuid);
	}




	@Override
	@Transactional(rollbackFor = Exception.class)
	//查询一个学员的第四阶段详细网上学习学时
	public List<Map<String, String>> selectForthSubTime(String stuUuid)
			throws Exception {
		// TODO Auto-generated method stub
		//从DAO返回数据
		return cardTimeRecord.selectForthSubTime(stuUuid);
	}




	@Override
	public int updateStuCartTime(String time, String stuUuid) throws Exception {
		// TODO Auto-generated method stub
		return stuCardTime.updateCartTime(time, stuUuid);
	}




	@Override
	public int insertStuCartTime(CardTimeRecord rec) throws Exception {
		// TODO Auto-generated method stub
		return cardTimeRecord.insertCartTime(rec);
	}




	@Override
	public int upStuCartTime(String time, String stuUuid) throws Exception {
		// TODO Auto-generated method stub
		return stuCardTime.upCartTime(time, stuUuid);
	}

}
