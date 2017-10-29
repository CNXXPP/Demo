package com.great.service.theoryImp;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.StudentMapper;
import com.great.entity.Student;
import com.great.service.theory.ILoginService;
@Service
public class TheLoginServiceImpl implements ILoginService{
	@Autowired
	StudentMapper student;
	
	
	//��¼�ķ���
	@Override
	@Transactional(rollbackFor = Exception.class)
	public String login(String stuIdentity, String stuPwd, String inputcode, HttpSession session, String code) throws Exception{
		// TODO Auto-generated method stub
		
		Student stu = student.selectByIdentity(stuIdentity);
		
		//���֤�����롢��֤����ж�
		if(stu == null){
			//�������֤������Ϣ
			return "wrongIdentity";
		
		}else if(!stu.getStuPwd().equals(stuPwd)){
			//�������������Ϣ
			return "wrongPwd";
		
		}else if(!inputcode.equalsIgnoreCase(code)){
			//������֤�������Ϣ
			return "wrongcode";
		
		}else{
			
			System.out.println("ѧ��" + stu);
			//�����ա���������date��ʽת����String��ʽ
		    String Birthday = new SimpleDateFormat("yyyy-MM-dd ").format(stu.getStuBirthday());
			
		    String CreateDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(stu.getCreateDate());
			
		    Map<String, String> map = new HashMap<String, String>();
			
		    map.put("Birthday", Birthday);
		    
		    map.put("CreateDate", CreateDate);
			
		    session.setAttribute("map", map);
			
		    session.setAttribute("Student", stu);
			//���ص���ɹ���Ϣ
		    return "loginSec";
	}
	}
	
	
	
	
}

