package com.great.service.schoolService.inte;

import java.util.Map;

import com.great.entity.DriverSchool;


public interface ISchoolLogin {
	 //�жϸ����֤�Ķ����Ƿ����
		public Map<String,Object> login(DriverSchool school,String rightCode,String code);
}
