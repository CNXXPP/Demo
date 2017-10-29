package com.great.controller.center_mgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.CenterAdmin;
import com.great.entity.CenterAnnouncement;
import com.great.service.center_mgr.imp.CenterAnnoServiceImp;

@Controller
@RequestMapping("/xp")
public class AnnoMgrController {

	@Autowired
	private CenterAnnoServiceImp annoServiceImp;
	
	@RequestMapping(value="/annoMgr/addAnno")
	@ResponseBody
	public Map<String, Object> addAnnouncement(CenterAnnouncement announcement,HttpSession session){
		CenterAdmin admin = (CenterAdmin)session.getAttribute("admin");
		announcement.setAdmUuid(admin.getAdmUuid());
		boolean res = annoServiceImp.addAnnouncement(announcement);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", res);
		return map;
	}
	
	@RequestMapping(value="/annoMgr/getAllAnno")
	@ResponseBody
	public Map<String, Object> getAllAnno(CenterAnnouncement announcement,HttpSession session){
		List<Map<String, String>> annoList = annoServiceImp.getAllAnnoInfo();
		System.out.println(annoList);
		JSONArray array = new JSONArray();
		for(Map<String, String> m:annoList){
			JSONObject object = new JSONObject();
			for(String key:m.keySet()){
				object.put(key, m.get(key));
			}
			array.add(object);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		JSONObject send = new JSONObject();
		send.put("data", array);
		map.put("result", send);
		return map;
	}
	
	@RequestMapping(value="/annoMgr/delAnno")
	@ResponseBody
	public Map<String, Object> delAnno(String title){
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = annoServiceImp.delAnno(title);
		map.put("result", res);
		return map;
	}
}
