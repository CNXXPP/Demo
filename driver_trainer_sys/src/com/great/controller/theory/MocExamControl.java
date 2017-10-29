package com.great.controller.theory;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.Question;
import com.great.entity.StuStimulateExam;
import com.great.entity.Student;
import com.great.service.theory.IMocExamScoreService;

@Controller
@RequestMapping("/CZX")
public class MocExamControl {

	@Autowired
	IMocExamScoreService mocExamScoreImpl;
	
	
	
	@RequestMapping(value="/mocExam/getMocExamScore")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public String getMocExamScore(HttpSession session) throws Exception{
		//从session中查出登入学生的uuid
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		List<Map<String, String>> mocExamScore = mocExamScoreImpl.getmocExamScore(stuUuid);
		
		JSONArray arr = new JSONArray();
		
		for (int i = 0; i < mocExamScore.size(); i++) {
			
			JSONObject object = new JSONObject();
			
			for(String key: mocExamScore.get(i).keySet()){
				
				object.put(key, mocExamScore.get(i).get(key));
			}
			
			arr.add(object);
		}
		
		JSONObject sendjsonboject = new JSONObject();
		
		sendjsonboject.put("data", arr);
		
		System.out.println(sendjsonboject);
		
        Map<String, Object> map = new HashMap<>();
		
		map.put("result", mocExamScore);
		
		return sendjsonboject.toJSONString();

	}
	
	
	
	@RequestMapping(value="/mocExam/getRamQues")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public ArrayList<Question> getRamQues(String subject) throws Exception{
		ArrayList<Question> list = mocExamScoreImpl.getRamQues(subject);
		
		return list;
	}
	
	
	
	@RequestMapping(value="/mocExam/intsertScore")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void intsertScore(String subject, int score,HttpSession session) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		StuStimulateExam stumoc = new StuStimulateExam();
		
		stumoc.setSsExamUuid((UUID.randomUUID()).toString());
		
		stumoc.setStuUuid(stuUuid);
		
		stumoc.setSsExamScore(score);
		
		stumoc.setSsExamSubject(subject);
		
		stumoc.setSsExamDate(df.format(new Date()));
		
		int a = mocExamScoreImpl.insertSco(stumoc);
		
		System.out.println(stumoc);
	
	}
}
