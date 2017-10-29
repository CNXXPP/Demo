package com.great.service.schoolService.inte;

import java.util.ArrayList;
import com.great.entity.Exam;
import com.great.entity.ExamRegister;
import com.great.entity.Subject;

public interface IStuExamRegist {
	public ArrayList<Exam> checkFirstExam(Exam exam);
	
	public int stuExamRegist(ExamRegister examRegister);
	
	public int updateExamCurNum(ExamRegister examRegister);
	
	public Subject getSubTime(Subject subject);

}
