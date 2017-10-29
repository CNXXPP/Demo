package com.great.service.center_mgr;

import java.util.List;

import com.great.entity.DriverSchool;

public interface ICenterSchoolService {

	public boolean addSchool(DriverSchool school) throws Exception;
	
	public List<DriverSchool> getAllSchools() throws Exception;
	
	public boolean updateSchoolInfo(DriverSchool school) throws Exception;
	
	public boolean delSchool(int schId) throws Exception;
	
	public boolean resetPwd(int schId) throws Exception;
}
