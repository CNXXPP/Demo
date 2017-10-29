package com.great.controller.theory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.entity.PracticeNoRec;
import com.great.entity.Question;
import com.great.entity.Student;
import com.great.service.theory.IQuestionTestService;

@Controller
@RequestMapping("/CZX")
public class QuestionTestControl {

	@Autowired
	IQuestionTestService questionTestImpl;
	
	
	
	@RequestMapping(value="/QuestionTest/getQuestion")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public Map<String, Question> questionTest(String subject, HttpSession session) throws Exception{
		Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		//获得该学生以前练习过的题号
		String qno = questionTestImpl.getQuestionNo(stuUuid, subject);
		//获取以前练习过的题目并显示
		Question question = questionTestImpl.getNowQuestion(qno, subject);

		Map<String, Question> map = new HashMap<String, Question>();
		
		map.put("question", question);
		
		return map;
	}
	
	
	
	
	@RequestMapping(value="/QuestionTest/nextQuestion")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public Map<String, Question> nextQuestion(String qno, String subject) throws Exception{
		Question question = questionTestImpl.getNowQuestion(qno, subject);
		
		Map<String, Question> map = new HashMap<String, Question>();
		
		map.put("question", question);
		
		return map;
	}
	
	
	
	@RequestMapping(value="/QuestionTest/recQNo")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void recQNo(String qno, String subject, HttpSession session) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		questionTestImpl.recQuestionNo(qno, stuUuid, subject);
		
	}
	
	
	
	@RequestMapping(value="/QuestionTest/checkQNo")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public String checkQNo(HttpSession session){
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		ArrayList<PracticeNoRec> list = new ArrayList<PracticeNoRec>();
		
		list = questionTestImpl.checkQuesNo(stuUuid);
		
		System.out.println(list);
		System.out.println(list.isEmpty());
		System.out.println(list.size());
		if(list.isEmpty() || list.size() == 0){
			
			int a = questionTestImpl.addSubFirst(stuUuid);
			
			int b = questionTestImpl.addSubForth(stuUuid);
			
			return "wawa";
		
		}else{
			
			return "kaka";
		
		}
		
		
	}
	
	
	
}
