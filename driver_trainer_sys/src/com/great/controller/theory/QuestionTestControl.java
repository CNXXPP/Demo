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
	@ResponseBody//������������ݣ�ͼƬ��json����������)������������ת��
	public Map<String, Question> questionTest(String subject, HttpSession session) throws Exception{
		Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		//��ø�ѧ����ǰ��ϰ�������
		String qno = questionTestImpl.getQuestionNo(stuUuid, subject);
		//��ȡ��ǰ��ϰ������Ŀ����ʾ
		Question question = questionTestImpl.getNowQuestion(qno, subject);

		Map<String, Question> map = new HashMap<String, Question>();
		
		map.put("question", question);
		
		return map;
	}
	
	
	
	
	@RequestMapping(value="/QuestionTest/nextQuestion")
	@ResponseBody//������������ݣ�ͼƬ��json����������)������������ת��
	public Map<String, Question> nextQuestion(String qno, String subject) throws Exception{
		Question question = questionTestImpl.getNowQuestion(qno, subject);
		
		Map<String, Question> map = new HashMap<String, Question>();
		
		map.put("question", question);
		
		return map;
	}
	
	
	
	@RequestMapping(value="/QuestionTest/recQNo")
	@ResponseBody//������������ݣ�ͼƬ��json����������)������������ת��
	public void recQNo(String qno, String subject, HttpSession session) throws Exception{
        Student stu = (Student) session.getAttribute("Student");
		
		String stuUuid = stu.getStuUuid();
		
		questionTestImpl.recQuestionNo(qno, stuUuid, subject);
		
	}
	
	
	
	@RequestMapping(value="/QuestionTest/checkQNo")
	@ResponseBody//������������ݣ�ͼƬ��json����������)������������ת��
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
