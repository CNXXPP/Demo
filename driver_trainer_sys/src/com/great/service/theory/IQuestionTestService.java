package com.great.service.theory;

import java.util.ArrayList;
import java.util.List;

import com.great.entity.PracticeNoRec;
import com.great.entity.Question;

public interface IQuestionTestService {

	public String getQuestionNo(String stuUuid, String subject) throws Exception;
	
	public Question getNowQuestion(String Qno, String subject) throws Exception;
	
	public int recQuestionNo(String qno, String stuUuid, String subject) throws Exception;
	
	public ArrayList<PracticeNoRec> checkQuesNo(String stuUuid);
	
	public int addSubFirst(String stuUuid);

	public int addSubForth(String stuUuid);
}
