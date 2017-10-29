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
	
	
	//登录的方法
	@Override
	@Transactional(rollbackFor = Exception.class)
	public String login(String stuIdentity, String stuPwd, String inputcode, HttpSession session, String code) throws Exception{
		// TODO Auto-generated method stub
		
		Student stu = student.selectByIdentity(stuIdentity);
		
		//身份证、密码、验证码的判断
		if(stu == null){
			//返回身份证错误信息
			return "wrongIdentity";
		
		}else if(!stu.getStuPwd().equals(stuPwd)){
			//返回密码错误信息
			return "wrongPwd";
		
		}else if(!inputcode.equalsIgnoreCase(code)){
			//返回验证码错误信息
			return "wrongcode";
		
		}else{
			
			System.out.println("学生" + stu);
			//将生日、创建日期date格式转换成String格式
		    String Birthday = new SimpleDateFormat("yyyy-MM-dd ").format(stu.getStuBirthday());
			
		    String CreateDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(stu.getCreateDate());
			
		    Map<String, String> map = new HashMap<String, String>();
			
		    map.put("Birthday", Birthday);
		    
		    map.put("CreateDate", CreateDate);
			
		    session.setAttribute("map", map);
			
		    session.setAttribute("Student", stu);
			//返回登入成功信息
		    return "loginSec";
	}
	}
	
	
	
	
}

