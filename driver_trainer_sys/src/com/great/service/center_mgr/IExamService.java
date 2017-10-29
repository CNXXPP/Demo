package com.great.service.center_mgr;

import java.util.List;
import java.util.Map;

import com.great.entity.Exam;

public interface IExamService {

	public boolean addExam(Exam exam,int admId) throws Exception;
	
	public List<Map<String, Object>> getAllExamInfo() throws Exception;
	
	public boolean updateExamInfo(Exam exam,Map<String,Object> map) throws Exception;
	
	public List<Map<String, String>> getExamStuInfo(Map<String,Object> map) throws Exception;
}
