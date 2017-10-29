package com.great.service.studentService.imp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.StuCardTimeMapper;
import com.great.dao.StuScoreMapper;
import com.great.dao.StudentMapper;
import com.great.entity.Exam;
import com.great.entity.SignInShow;
import com.great.entity.StuCardTime;
import com.great.entity.StuExamInfo;
import com.great.entity.Student;
import com.great.service.studentService.IStuInfoService;

/**
 * ѧ����Ϣ�Ĳ��������
 * */

@Service
public class StuInfoServiceImp implements IStuInfoService{

	@Autowired
	StudentMapper studentMapper;
	@Autowired
	StuCardTimeMapper stuCardTimeMapper;
	@Autowired
	StuScoreMapper stuScoreMapper;
	
	@Override
	public Student showinformation(HttpSession session) {
		// TODO Auto-generated method stub
		//ѧ����Ϣ
		String stuUuid=(String) session.getAttribute("stuUuid");
		
		Student student=studentMapper.selectByPrimaryKey(stuUuid);
		
		return student;
	}

	

	@Override
	public Student upDateStuInfo(HttpSession session,Student student) {
		// TODO Auto-generated method stub
		//�޸�ѧ����Ϣ
		String stuUuid=(String) session.getAttribute("stuUuid");
		
		student.setStuUuid(stuUuid);
		
		int row=studentMapper.updateByPrimaryKeySelective(student);
		if(row > 0){
			Student newStudent=studentMapper.selectByPrimaryKey(stuUuid);
			return newStudent;
			
		}
		return null;
	}

	@Override
	public StuExamInfo selectExamByStuUuid(HttpSession session) {
		// TODO Auto-generated method stub
		//��ѯѧ���Ŀ�����Ϣ
		String stuUuid=(String) session.getAttribute("stuUuid");
		
		StuExamInfo examInfo=stuScoreMapper.selectByStuUuid(stuUuid);
		
		return examInfo;
	}

	@Override
	public SignInShow selectCardTimesByStuUuid(HttpSession session) {
		// TODO Auto-generated method stub
		//��ѯ��ʱ��
		String stuUuid=(String) session.getAttribute("stuUuid");
		
		Student student = studentMapper.selectByPrimaryKey(stuUuid);
		//ͨ��uuid��ѯ��ѧ������ͨ��ѧ�������ѯ�Զ���򿨶���
		SignInShow show = stuCardTimeMapper.showSignInShows(student);
		
		
		return show;
	}



	@Override
	public int upDateStuPwd(HttpSession session, Map<String, String> map) {
		// TODO Auto-generated method stub
		//�޸�����
		String stuUuid = (String) session.getAttribute("stuUuid");
		
        String oldPwd = map.get("oldPwd");
		
		String newPwd = map.get("newPwd");
		
	     Map<String, String>map2 = new HashMap<String, String>();
	     map2.put("stuUuid", stuUuid);
	     map2.put("oldPwd", oldPwd);
	     map2.put("newPwd", newPwd);
	     
	     Student student = studentMapper.checkPwd(map2);//��������
	     
	     if(student == null){
	    	 return 0;//���������
	     }
		
		 int row = studentMapper.updateStudentPwd(map2);//�޸Ĳ���
		 
		 if(row > 0){
			 return 2;//�޸ĳɹ�
		 }else{
			 return 1;//�޸�ʧ��
		 }
		
	}

}
