package com.great.controller.center_mgr;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.DriverSchool;
import com.great.service.center_mgr.imp.CenterSchoolServiceImp;
@Controller
@RequestMapping("/xp")
public class CenterSchoolController {

	@Autowired
	CenterSchoolServiceImp schoolServiceImp;
	
	@RequestMapping(value="/centerSchoolMgr/addSchoolAccount")
	@ResponseBody
	public Map<String, Object> addSchoolAccount(DriverSchool school) throws Exception{
		
		boolean res = schoolServiceImp.addSchool(school);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		return map;	
	}
	//显示所有驾校
	@RequestMapping(value="/centerSchoolMgr/showAllSchool")
	@ResponseBody
	public String showAllSchool() throws Exception{
		
		List<DriverSchool> allscools = schoolServiceImp.getAllSchools();
		Map<String, Object> map = new HashMap<String, Object>();
		JSONArray array = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/mm/dd hh:MM:ss");
		for(DriverSchool school:allscools){
			JSONObject object = new JSONObject();
			object.put("schId", school.getSchId());
			object.put("schName", school.getSchName());
			object.put("createDate",sdf.format(school.getCreateDate()));
			object.put("schLocation", school.getSchLocation());
			object.put("schPhone", school.getSchPhone());
			object.put("lastLoginDate", school.getLastLoginDate());
			array.add(object);
		}
		JSONObject send = new JSONObject();
		send.put("data", array);
		map.put("result", send.toJSONString());
		
		return send.toJSONString();	
	}
	//更改驾校信息
	@RequestMapping(value="/centerSchoolMgr/updateSchoolInfo")
	@ResponseBody
	public Map<String, Object> updateSchoolInfo(DriverSchool school) throws Exception{
		if(school.getSchName().equals("")){
			school.setSchName(null);
		}
		if(school.getSchLocation().equals("")){
			school.setSchLocation(null);
		}
		if(school.getSchPhone().equals("")){
			school.setSchPhone(null);
		}
		
		boolean res = schoolServiceImp.updateSchoolInfo(school);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		return map;	
	}
	
	@RequestMapping(value="/centerSchoolMgr/delSchool")
	@ResponseBody
	public Map<String, Object> delSchool(int schId) throws Exception{
		boolean res = schoolServiceImp.delSchool(schId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		return map;	
	}
	//重置驾校密码123456
	@RequestMapping(value="/centerSchoolMgr/resetPwd")
	@ResponseBody
	public Map<String, Object> resetPwd(int schId) throws Exception{
		boolean res = schoolServiceImp.resetPwd(schId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		return map;	
	}
	
}
