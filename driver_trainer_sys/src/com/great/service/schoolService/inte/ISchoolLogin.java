package com.great.service.schoolService.inte;

import java.util.Map;

import com.great.entity.DriverSchool;


public interface ISchoolLogin {
	 //判断该身份证的对象是否存在
		public Map<String,Object> login(DriverSchool school,String rightCode,String code);
}
