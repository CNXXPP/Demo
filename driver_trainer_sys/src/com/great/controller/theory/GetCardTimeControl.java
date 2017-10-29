package com.great.controller.theory;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.jms.Session;
import javax.json.JsonArray;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.CardTimeRecord;
import com.great.entity.StuCardTime;
import com.great.entity.Student;
import com.great.service.theory.IGetCardTimeService;
import com.great.service.theoryImp.GetCardTimeServiceImpl;

@Controller
@RequestMapping("/CZX")
public class GetCardTimeControl {

	
	@Autowired
	IGetCardTimeService GetCarTimeServiceImpl;
	
    
	
	@RequestMapping(value="/CardTime/getCarTime")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	//获取学员的打卡时间
	public Map<String, StuCardTime> getStuCardTime(HttpSession session) throws Exception{
        
		Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		Map<String, StuCardTime> map = new HashMap<String, StuCardTime>();
		
		
			StuCardTime stucardtime = GetCarTimeServiceImpl.selectCardtime(stuUuid);
			
			System.out.println("打卡时间" + stucardtime);
			
			map.put("StuCardTime", stucardtime);
			
		
		return map;
	}
	
	
	
	@RequestMapping(value="/CardTime/getFirstSubTime")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public String getFirstSubTime(HttpSession session) throws Exception{
		
		Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		JSONArray arr = new JSONArray();
		
		List<Map<String, String>> firstSubTimeList = GetCarTimeServiceImpl.selectFirstSubTime(stuUuid);
		
		for (int i = 0; i < firstSubTimeList.size(); i++) {
			
			JSONObject object = new JSONObject();
			
			for(String key: firstSubTimeList.get(i).keySet()){
				
				object.put(key, firstSubTimeList.get(i).get(key));
			}
			
			arr.add(object);
		}
		
		JSONObject sendJsonObject = new JSONObject();
		
		sendJsonObject.put("data", arr);
		
		System.out.println(sendJsonObject);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", firstSubTimeList);
		
		return sendJsonObject.toJSONString();
		
	}
	
	
	
	
	
	@RequestMapping(value="/CardTime/getForthSubTime")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public String getForthSubTime(HttpSession session) throws Exception{
		
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		List<Map<String, String>> forthSubTimeList = GetCarTimeServiceImpl.selectForthSubTime(stuUuid);
		
		JSONArray arr = new JSONArray();
		
		for (int i = 0; i < forthSubTimeList.size(); i++) {
			
			JSONObject object = new JSONObject();
			
			for(String key: forthSubTimeList.get(i).keySet()){
				
				object.put(key, forthSubTimeList.get(i).get(key));
				
			}
			
			arr.add(object);
		}
		
		JSONObject sendJsonObject = new JSONObject();
		
		sendJsonObject.put("data", arr);
		
		System.out.println(sendJsonObject);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", forthSubTimeList);
		
		return sendJsonObject.toJSONString();
	}
	
	
	
	@RequestMapping(value="/CardTime/updateCardTime")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void updateCardTime(HttpSession session, int time) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		StuCardTime stucardtime = GetCarTimeServiceImpl.selectCardtime(stuUuid);
		
		int a = stucardtime.getCtSub1().intValue();
		
		int b = a+time;
		
		String c = Integer.toString(b);
		
		System.out.println(c);
		
		int d = GetCarTimeServiceImpl.updateStuCartTime(c, stuUuid);
		
		System.out.println(d);
	}
	
	
	
	@RequestMapping(value="/CardTime/upCardTime")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void upCardTime(HttpSession session, int time) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		StuCardTime stucardtime = GetCarTimeServiceImpl.selectCardtime(stuUuid);
		
		int a = stucardtime.getCtSub4().intValue();
		
		int b = a+time;
		
		String c = Integer.toString(b);
		
		int d = GetCarTimeServiceImpl.upStuCartTime(c, stuUuid);
		
		System.out.println(d);
	}
	
	
	
	
	
	
	@RequestMapping(value="/CardTime/CartTimeRec1")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void CartTimeRec(HttpSession session, int time) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String date = df.format(new Date());
		
		Date date1 =  df.parse(date);
		
		CardTimeRecord timerec = new CardTimeRecord();
		
		BigDecimal time1 = new BigDecimal(Integer.toString(time));
		
		timerec.setCtrUuid((UUID.randomUUID()).toString());
		
		timerec.setStuUuid(stuUuid);
		
		timerec.setSubNo(1);
		
		timerec.setCtrTime(time1);
		
		timerec.setCtrDate(date1);
		
		System.out.println("我的记录"+timerec);
		
		int x = GetCarTimeServiceImpl.insertStuCartTime(timerec);
	}
	
	
	
	@RequestMapping(value="/CardTime/CartTimeRec2")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void CartTimeRec2(HttpSession session, int time) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String date = df.format(new Date());
		
		Date date1 =  df.parse(date);
		
		CardTimeRecord timerec = new CardTimeRecord();
		
		BigDecimal time1 = new BigDecimal(Integer.toString(time));
		
		timerec.setCtrUuid((UUID.randomUUID()).toString());
		
		timerec.setStuUuid(stuUuid);
		
		timerec.setSubNo(4);
		
		timerec.setCtrTime(time1);
		
		timerec.setCtrDate(date1);
		
		System.out.println("我的记录"+timerec);
		
		int x = GetCarTimeServiceImpl.insertStuCartTime(timerec);
	}
}
