package com.great.service.examination;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.great.dao.QuestionMapper;
import com.great.entity.Question;
import com.great.entity.Student;

public interface IExaminationService {

	public List<Question> getAllQuestion(String sub) throws Exception;
	
	public String login(Student student,HttpSession session) throws Exception;
	

	public boolean calcScore(String scScore, String curSub, String startTime,
			String endTime,HttpSession session) throws Exception;
	
	
}
