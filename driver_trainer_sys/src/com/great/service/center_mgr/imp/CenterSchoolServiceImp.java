package com.great.service.center_mgr.imp;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.DriverSchoolMapper;
import com.great.entity.DriverSchool;
import com.great.service.center_mgr.ICenterSchoolService;
@Service
public class CenterSchoolServiceImp implements ICenterSchoolService {

	@Autowired
	private DriverSchoolMapper driverSchoolMapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean addSchool(DriverSchool school) throws Exception {
		school.setSchUuid(UUID.randomUUID().toString());
		int res = driverSchoolMapper.insert(school);
		if(res>0){
			return true;
		}
		return false;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<DriverSchool> getAllSchools() throws Exception {
		List<DriverSchool> allSchools = driverSchoolMapper.getAllDriverSchools();
		return allSchools;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updateSchoolInfo(DriverSchool school) throws Exception{
		int res = driverSchoolMapper.updateByIdSelective(school);
		if(res > 0){
			return true;
		}
		return false;
	}
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean delSchool(int schId) throws Exception {
		int res = driverSchoolMapper.deleteById(schId);
		if(res > 0){
			return true;
		}
		return false;
	}
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean resetPwd(int schId) throws Exception {
		DriverSchool school = new DriverSchool();
		school.setSchId(schId);
		school.setSchPwd("123456");
		int res = driverSchoolMapper.updateByIdSelective(school);
		if(res > 0){
			return true;
		}
		return false;
	}
}
