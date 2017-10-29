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

	public CenterAnnouncement getCenterAnnouncement();//��ȡ�˹������һ�ι���
	
	public String studentLogin(Student student,HttpSession session);//ѧ����½
	
	public SchAnnouncement getSchAnnouncement(HttpSession session);//��ȡ��У�����һ�ι���
	

	public ArrayList<Notice> getNotices(String stuUuid);//��ȡȫ������
	
	public void  StudentRegister(Map<String, String>map,HttpSession session);//ѧԱע��
	
	public List<Trainer>getTrainersBySchUuid(String schUuid);//ͨ����У��ȡȫ������

	
}
