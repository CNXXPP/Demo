package com.great.service.theory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.great.entity.Question;
import com.great.entity.StuStimulateExam;

public interface IMocExamScoreService {
    //查询当前学生的模拟考试成绩
	public List<Map<String, String>> getmocExamScore(String stuUuid) throws Exception;
	//随机抽取题目
	public ArrayList<Question> getRamQues(String subject) throws Exception;
	//插入模拟考试成绩
	public int insertSco(StuStimulateExam stumoc) throws Exception;
}
