package com.great.service.studentService;

import java.util.ArrayList;




import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.great.entity.CenterAnnouncement;
import com.great.entity.Notice;
import com.great.entity.SchAnnouncement;
import com.great.entity.Student;
import com.great.entity.Trainer;

public interface IStudentService {

	public CenterAnnouncement getCenterAnnouncement();//获取运管最近的一次公告
	
	public String studentLogin(Student student,HttpSession session);//学生登陆
	
	public SchAnnouncement getSchAnnouncement(HttpSession session);//获取驾校最近的一次公告
	

	public ArrayList<Notice> getNotices(String stuUuid);//获取全部公告
	
	public void  StudentRegister(Map<String, String>map,HttpSession session);//学员注册
	
	public List<Trainer>getTrainersBySchUuid(String schUuid);//通过驾校获取全部教练

	
}
