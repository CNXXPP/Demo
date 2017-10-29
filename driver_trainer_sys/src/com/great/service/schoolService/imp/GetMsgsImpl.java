package com.great.service.schoolService.imp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchoolMsgMapper;
import com.great.entity.MsgInfo;
import com.great.entity.SchoolMsg;
import com.great.service.schoolService.inte.IGetMsgs;

@Service
public class GetMsgsImpl implements IGetMsgs{
	@Autowired
	SchoolMsgMapper schoolMsgMapper;

	@Override
	public ArrayList<MsgInfo> getSchoolMsgs(SchoolMsg msg) {
		// TODO Auto-generated method stub
		ArrayList<MsgInfo> msgList = schoolMsgMapper.getSchoolMsgs(msg);
		return msgList;
	}

	@Override
	public int deleteByPrimaryKey(String scmsgUuid) {
		// TODO Auto-generated method stub
		int res = schoolMsgMapper.deleteByPrimaryKey(scmsgUuid);
		return res;
	}

	@Override
	public int changeMailState(SchoolMsg msg) {
		// TODO Auto-generated method stub
		
		int res = schoolMsgMapper.updateByPrimaryKeySelective(msg);
		return res;
	}
	
	


}
