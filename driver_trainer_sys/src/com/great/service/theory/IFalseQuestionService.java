package com.great.service.theory;

import java.util.List;

import com.great.entity.FalseQuestion;
import com.great.entity.Question;

public interface IFalseQuestionService {

	public int addFalse(String uuid, String qno, String stuUuid) throws Exception;
	
	public List<FalseQuestion> getFalseQno(String stuUid);
	
	public Question getFalseQuestion(String qno);
	
	public int delFalseQueNo(String qno);
}
