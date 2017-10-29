package com.great.service.center_mgr.imp;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.ExamMapper;
import com.great.dao.ExamRegisterMapper;
import com.great.dao.StudentMapper;
import com.great.entity.Exam;
import com.great.entity.ExamRegister;
import com.great.entity.Student;
import com.great.service.center_mgr.IExamRegisterService;
@Service
public class ExamRegisterServiceImp implements IExamRegisterService {

	@Autowired
	private ExamMapper examMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private ExamRegisterMapper examRegisterMapper;
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean delExamRegister(Map<String, Object> map, String stuIdentity) throws Exception{
		Exam exam = examMapper.selectBySubLocTime(map);
		Student student = studentMapper.selectByIdentity(stuIdentity);
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("stuUuid", student.getStuUuid());
		map2.put("examUuid", exam.getExamUuid());
		int res = examRegisterMapper.delByStuIdentityExamUuid(map2);
		if(res > 0){
			return true;
		}
		return false;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public String getPhotoPath(Map<String, Object> map, String stuIdentity,
			int index) throws Exception{
		Exam exam = examMapper.selectBySubLocTime(map);
		Student student = studentMapper.selectByIdentity(stuIdentity);
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("stuUuid", student.getStuUuid());
		map2.put("examUuid", exam.getExamUuid());
		ExamRegister examRegister = examRegisterMapper.selectExamRegisterByStuIdentityExamUuid(map2);
		String photoDirPath = examRegister.getExamPhotoPath();
		File dirFile = new File(photoDirPath);
		File[] photoFiles = dirFile.listFiles(); //获得所以照片
		String path = photoFiles[index].getAbsolutePath(); //获得所需照片路径
		System.out.println(path);
		return path;
	}
	
}
