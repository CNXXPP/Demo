package com.great.service.schoolService.imp;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.DriverSchoolMapper;
import com.great.entity.DriverSchool;
import com.great.service.schoolService.inte.ISchoolLogin;

@Service
public class SchoolLoginImp implements ISchoolLogin {

	@Autowired
	DriverSchoolMapper driverSchool;

	@Override
	public Map<String, Object> login(DriverSchool sch,String rightCode,String code) {
		// TODO Auto-generated method stub
		String res;
		Map<String, Object> map = new HashMap<>();
		DriverSchool school = driverSchool.checkId(sch);
		if (school == null) {
			res="id";
			map.put("res", res);
		}
		else if(driverSchool.checkPwd(sch) == null){
			res="pwd";
			map.put("res", res);
		}
		else if(!rightCode.equalsIgnoreCase(code)){
			res="code";
			map.put("res", res);
		}
		else{
			res="check";
			map.put("school", school);
			map.put("res", res);
		}
		
		return map;
	
	}

}
