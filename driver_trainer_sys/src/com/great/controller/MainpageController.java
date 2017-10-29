package com.great.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.service.mainpageService.ImainpageService;

@Controller
@RequestMapping("/cw")
public class MainpageController {

	@Autowired
	ImainpageService mainpageService;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyƒÍMM‘¬dd»’  HH:mm:ss");

	@RequestMapping("/allSchool")
	@ResponseBody
	public String allSchool() {

		List<Map<String, String>> maps = mainpageService.allSchool();

		JSONArray array = new JSONArray();

		for (Map<String, String> map : maps) {

			JSONObject object = new JSONObject();
               
			for (Entry<String, String> entry : map.entrySet()) {
         
				if (entry.getKey().equals("CREATE_DATE")) {
					
					object.put(entry.getKey(), dateFormat.format(entry.getValue()));
				} else {
					
					object.put(entry.getKey(), entry.getValue());
					
				}
			}

			array.add(object);
		}

		JSONObject object = new JSONObject();
		object.put("data", array);

		return object.toJSONString();
	}

}
