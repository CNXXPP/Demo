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
	//��ѯһ��ѧԱ�Ѿ�ѧϰ��ѧʱ��δ��ɵ�ѧʱ���Ƿ���ɵ�״̬
	public StuCardTime selectCardtime(String stuUuid) throws Exception {
		// TODO Auto-generated method stub
		StuCardTime cardtime = stuCardTime.selectBystuId(stuUuid);
		
		return cardtime;
	}
	
	
	
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	//��ѯһ��ѧԱ�ĵ�һ�׶���ϸ����ѧϰѧʱ
	public List<Map<String, String>> selectFirstSubTime(String stuUuid) 
			throws Exception {
		// TODO Auto-generated method stub
		//��DAO��������
		return cardTimeRecord.selectFirstSubTime(stuUuid);
	}




	@Override
	@Transactional(rollbackFor = Exception.class)
	//��ѯһ��ѧԱ�ĵ��Ľ׶���ϸ����ѧϰѧʱ
	public List<Map<String, String>> selectForthSubTime(String stuUuid)
			throws Exception {
		// TODO Auto-generated method stub
		//��DAO��������
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
