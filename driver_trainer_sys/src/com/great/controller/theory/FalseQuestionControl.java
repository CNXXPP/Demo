package com.great.controller.theory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.entity.FalseQuestion;
import com.great.entity.Question;
import com.great.entity.Student;
import com.great.service.theory.IFalseQuestionService;

@Controller
@RequestMapping("/CZX")
public class FalseQuestionControl {

	
	@Autowired
	IFalseQuestionService falseQuestionImpl;
	
	@RequestMapping(value="/falseQustion/insertFalse")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void insertFalse(String qno, HttpSession session) throws Exception{
		FalseQuestion falseque = new FalseQuestion();
		
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		String uuid = UUID.randomUUID().toString();
		
		System.out.println("题号"+qno);
		
		int a = falseQuestionImpl.addFalse(uuid, qno, stuUuid);
		
		System.out.println(a);
	}
	
	
	
	@RequestMapping(value="/falseQustion/getFlaseQuesNo")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public Map<String, Question> getFlaseQuesNo(HttpSession session, int dex){
		List<FalseQuestion> falQno = new ArrayList<FalseQuestion>();
		
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		Map<String, Question> map = new HashMap<String, Question>();
		
		falQno = falseQuestionImpl.getFalseQno(stuUuid);
		
		String Qno = falQno.get(dex).getqNo().toString();
		
		Question que = falseQuestionImpl.getFalseQuestion(Qno);
		
		map.put("question", que);

		return map;
	}
	
	
	
	@RequestMapping(value="/falseQustion/delFlaseQuesNo")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	public void delFlaseQuesNo(String qno){
		int a = falseQuestionImpl.delFalseQueNo(qno);
		System.out.println(a);
	}
}
