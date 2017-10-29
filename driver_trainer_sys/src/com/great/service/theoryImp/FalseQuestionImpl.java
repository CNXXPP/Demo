package com.great.service.theoryImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.FalseQuestionMapper;
import com.great.dao.QuestionMapper;
import com.great.entity.FalseQuestion;
import com.great.entity.Question;
import com.great.service.theory.IFalseQuestionService;
@Service
public class FalseQuestionImpl implements IFalseQuestionService{

	@Autowired
	FalseQuestionMapper falsequestion;
	@Autowired
	QuestionMapper question;
	
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addFalse(String uuid, String qno, String stuUuid) throws Exception{
		// TODO Auto-generated method stub
		return falsequestion.insertFalse(uuid, qno, stuUuid);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<FalseQuestion> getFalseQno(String stuUid) {
		// TODO Auto-generated method stub
		return falsequestion.getFalseQNo(stuUid);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Question getFalseQuestion(String qno) {
		// TODO Auto-generated method stub
		return question.getFalseQuestion(qno);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delFalseQueNo(String qno) {
		// TODO Auto-generated method stub
		return falsequestion.delFalseQNo(qno);
	}

	

}
