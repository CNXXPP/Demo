package com.great.service.theoryImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.QuestionMapper;
import com.great.dao.StuStimulateExamMapper;
import com.great.entity.Question;
import com.great.entity.StuStimulateExam;
import com.great.service.theory.IMocExamScoreService;
@Service
public class MocExamScoreImpl implements IMocExamScoreService{
	
	
	@Autowired
	StuStimulateExamMapper stuStimulateExam;
	@Autowired
	QuestionMapper question;
	
	@Override
	@Transactional(rollbackFor = Exception.class) 
	public List<Map<String, String>> getmocExamScore(String stuUuid) throws Exception {
		// TODO Auto-generated method stub
		//返回查询出的数据
		return stuStimulateExam.getMocExamScore(stuUuid);
	}



	@Override
	@Transactional(rollbackFor = Exception.class)
	public ArrayList<Question> getRamQues(String subject) throws Exception {
		// TODO Auto-generated method stub
		return question.getRamQuestion(subject);
	}



	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertSco(StuStimulateExam stumoc) throws Exception {
		// TODO Auto-generated method stub
		
		return stuStimulateExam.insertScore(stumoc);
	}

}
