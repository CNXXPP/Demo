package com.great.service.schoolService.imp;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.StuMsgMapper;
import com.great.entity.StuMsg;
import com.great.service.schoolService.inte.IStuMsg;
@Service
public class StuMsgImpl implements IStuMsg{
	@Autowired
	StuMsgMapper stuMsgMapper;

	@Override
	public Map<String, Object> newStuMsg(StuMsg msg) {
		// TODO Auto-generated method stub
		int res = stuMsgMapper.insert(msg);
		Map<String, Object> map = new HashMap<>();
		if(res>0){
			map.put("res", res);
			return map;
		}
		return null;
	}




}
