package com.great.service.schoolService.imp;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchoolMsgMapper;
import com.great.entity.SchoolMsg;
import com.great.service.schoolService.inte.ISchMsg;
@Service
public class SchMsgImpl implements ISchMsg{
    
	@Autowired
	SchoolMsgMapper mapper;
	@Override
	public Map<String, Object> newMsg(SchoolMsg msg) {
		// TODO Auto-generated method stub
		int res = mapper.insert(msg);
		Map<String, Object> map = new HashMap<>();
		if(res>0){
			map.put("res", res);
			return map;
		}
		return null;
	}

}
