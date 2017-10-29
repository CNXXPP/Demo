package com.great.service.theoryImp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.PracticeNoRecMapper;
import com.great.dao.QuestionMapper;
import com.great.entity.PracticeNoRec;
import com.great.entity.Question;
import com.great.service.theory.IQuestionTestService;
@Service
public class QuestionTestImpl implements IQuestionTestService{

	@Autowired
	PracticeNoRecMapper practiceNoRec;
	
	@Autowired
	QuestionMapper question;
	
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public String getQuestionNo(String stuUuid, String subject) throws Exception {
		// TODO Auto-generated method stub
		
		return practiceNoRec.getQuestionNo(stuUuid, subject);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Question getNowQuestion(String Qno, String subject)
			throws Exception {
		// TODO Auto-generated method stub
		return question.getNowQuestion(Qno, subject);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int recQuestionNo(String qno, String stuUuid, String subject)
			throws Exception {
		// TODO Auto-generated method stub
		practiceNoRec.recNo(qno, stuUuid, subject);
		return practiceNoRec.recNo(qno, stuUuid, subject);
		
	}

	@Override
	public ArrayList<PracticeNoRec> checkQuesNo(String stuUuid) {
		// TODO Auto-generated method stub
		return practiceNoRec.checkQNo(stuUuid);
	}

	@Override
	public int addSubFirst(String stuUuid) {
		// TODO Auto-generated method stub
		return practiceNoRec.addSubFirst(stuUuid);
	}

	@Override
	public int addSubForth(String stuUuid) {
		// TODO Auto-generated method stub
		return practiceNoRec.addSubForth(stuUuid);
	}

	
}
