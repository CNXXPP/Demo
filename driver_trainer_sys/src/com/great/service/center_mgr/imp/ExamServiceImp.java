package com.great.service.center_mgr.imp;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.CenterAdminMapper;
import com.great.dao.ExamMapper;
import com.great.entity.CenterAdmin;
import com.great.entity.Exam;
import com.great.service.center_mgr.IExamService;
@Service
public class ExamServiceImp implements IExamService {

	@Autowired
	private ExamMapper examMapper;
	@Autowired
	private CenterAdminMapper adminMapper;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean addExam(Exam exam,int admId) throws Exception { //安排一场考试 
		CenterAdmin admin = adminMapper.selectById(admId);
		exam.setExamUuid(UUID.randomUUID().toString());
		exam.setAdmUuid(admin.getAdmUuid());
		exam.setExamStatus("未开始");
		exam.setExamCurNum(0);
		int res = examMapper.insertSelective(exam);
		if(res > 0){
			return true;
		}
		return false;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public List<Map<String, Object>> getAllExamInfo() throws Exception {
		List<Map<String, Object>> examInfo = examMapper.getAllExamInfo();
		return examInfo;
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean updateExamInfo(Exam exam, Map<String, Object> map) {
		Exam fromSelect = examMapper.selectBySubLocTime(map);
		exam.setExamUuid(fromSelect.getExamUuid());
		int res = examMapper.updateByPrimaryKeySelective(exam);
		if(res > 0){
			return true;
		}
		return false;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public List<Map<String, String>> getExamStuInfo(Map<String,Object> map) throws Exception {
		Exam fromSelect = examMapper.selectBySubLocTime(map);	
		List<Map<String, String>> stuInfoList = examMapper.getExamStuInfo(fromSelect.getExamUuid());
		return stuInfoList;
	}
}
