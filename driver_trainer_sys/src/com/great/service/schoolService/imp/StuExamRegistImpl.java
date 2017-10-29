package com.great.service.schoolService.imp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.ExamMapper;
import com.great.dao.ExamRegisterMapper;
import com.great.dao.SubjectMapper;
import com.great.entity.Exam;
import com.great.entity.ExamRegister;
import com.great.entity.Subject;
import com.great.service.schoolService.inte.IStuExamRegist;
@Service
public class StuExamRegistImpl implements IStuExamRegist{
	
	@Autowired
	ExamMapper examMapper;
	@Autowired
	ExamRegisterMapper examRegisterMapper;
	@Autowired
	SubjectMapper subjectMapper;
	

	@Override
	public ArrayList<Exam> checkFirstExam(Exam exam) {
		// TODO Auto-generated method stub
		ArrayList<Exam> examList=examMapper.checkFirstExam(exam);
		return examList;
	}


	@Override
	public int stuExamRegist(ExamRegister examRegister) {
		// TODO Auto-generated method stub
		int res=examRegisterMapper.insert(examRegister);
		
		return res;
	}


	@Override
	public int updateExamCurNum(ExamRegister examRegister) {
		// TODO Auto-generated method stub
		int res = examMapper.updateExamCurNum(examRegister); 
		return res;
	}


	@Override
	public Subject getSubTime(Subject subject) {
		// TODO Auto-generated method stub
		Subject sub = subjectMapper.getSubTime(subject);
		return sub;
	}

}
