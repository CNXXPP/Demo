package com.great.controller.center_mgr;


import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.aso.n;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.CenterAdmin;
import com.great.entity.Exam;
import com.great.service.center_mgr.imp.ExamRegisterServiceImp;
import com.great.service.center_mgr.imp.ExamServiceImp;
import com.great.util.AuthCode;

@Controller
@RequestMapping("/xp")
public class ExamMgrController {

	@Autowired
	private ExamServiceImp examServiceImp;
	@Autowired
	private ExamRegisterServiceImp examRegisterService;
	
	// 添加
	@RequestMapping(value = "/examMgr/addExam")
	@ResponseBody
	public Map<String, Object> addExam(Exam exam, HttpSession session)
			throws Exception {
		System.out.println(exam);
		CenterAdmin admin = (CenterAdmin) session.getAttribute("admin");
		System.out.println(admin);
		boolean res = examServiceImp.addExam(exam, admin.getAdmId());
		Map<String, Object> map = new HashMap<>();
		map.put("result", res);
		return map;
	}
	//显示考试信息
	@RequestMapping(value = "/examMgr/showAllExamInfo")
	@ResponseBody
	public Map<String, Object> showAllExamInfo()
			throws Exception {
		JSONArray array = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		List<Map<String, Object>> list = examServiceImp.getAllExamInfo();
		for(Map<String, Object> map:list){
			JSONObject exam = new JSONObject();
			for(String key:map.keySet()){
				if(key.equals("EXAM_DATE")){
					exam.put(key, sdf.format(map.get(key)));
				}else{
					exam.put(key, map.get(key));
				}
				
				
			}
			array.add(exam);
		}
		JSONObject send = new JSONObject();
		send.put("data", array);
		Map<String, Object> map = new HashMap<>();
		map.put("result", send);
		return map;
	}
	
	@RequestMapping(value = "/examMgr/updateExaminationInfo")
	@ResponseBody
	public Map<String, Object> updateExaminationInfo(Exam exam,String date,String sub,String loc)
			throws Exception {
		System.out.println(123);
		if(exam.getExamLocation().equals("")){
			exam.setExamLocation(null);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		
		java.util.Date exam_date = sdf.parse(date);System.out.println(exam_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loc", loc);
		map.put("sub", sub);
		map.put("date", exam_date);
		boolean res = examServiceImp.updateExamInfo(exam, map);
		
		System.out.println(exam);
		System.out.println(date+"  " +sub+"  "+loc);
		Map<String, Object> map1 = new HashMap<>();
		map1.put("result", res);
		return map1;
	}
	
	@RequestMapping(value = "/examMgr/examStuInfoPre")
	@ResponseBody
	public Map<String, Object> examStuInfoPre(String date,String sub,String loc,HttpSession session)
			throws Exception {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		
		java.util.Date exam_date = sdf.parse(date);System.out.println(exam_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loc", loc);
		map.put("sub", sub);
		map.put("date", exam_date);
		session.setAttribute("stuInfo", map);
		

		System.out.println(date+"  " +sub+"  "+loc);
		Map<String, Object> map1 = new HashMap<>();
		
		return map1;
	}
	//考试报名考生信息
	@RequestMapping(value = "/examMgr/examStuInfo")
	@ResponseBody
	public Map<String, Object> examStuInfo(HttpSession session)
			throws Exception {
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("stuInfo");
		List<Map<String, String>> stuList = examServiceImp.getExamStuInfo(map);
		Map<String, Object> map1 = new HashMap<>();
		
		System.out.println(map1);
		Map<String, Object> send = new HashMap<>();
      	send.put("data", stuList);
		map1.put("result", send);
		return map1;
	}
	//删除考试报名考生信息
	@RequestMapping(value = "/examMgr/delExamRegister")
	@ResponseBody
	public Map<String, Object> delExamRegister(String date,String sub,String loc,String stuIdentity)
			throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		java.util.Date exam_date = sdf.parse(date);System.out.println(exam_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loc", loc);
		map.put("sub", sub);
		map.put("date", exam_date);
		boolean res = examRegisterService.delExamRegister(map, stuIdentity);
		System.out.println(date+"  " +sub+"  "+loc);
		Map<String, Object> map1 = new HashMap<>();
		map1.put("result", res);
		return map1;
	}
	
	@RequestMapping(value = "/examMgr/getStuPhoInfo")
	@ResponseBody
	public Map<String, Object> getStuPhoInfo(String stuIdentity,HttpSession session)
			throws Exception {
		session.setAttribute("stuIdentity", stuIdentity);
		Map<String, Object> map1 = new HashMap<>();
		map1.put("result", true);
		return map1;
	}	
	
	@RequestMapping(value = "/examMgr/getStuPho")
	@ResponseBody
	public void getStuPho(int index,HttpSession session,HttpServletResponse response)
			throws Exception {
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("stuInfo");
		String stuIdentity = (String) session.getAttribute("stuIdentity");
		String photoPath = examRegisterService.getPhotoPath(map, stuIdentity, index);
		System.out.println(photoPath);
		BufferedImage image = ImageIO.read(new FileInputStream(photoPath));
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
}
