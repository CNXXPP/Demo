package com.great.service.studentService;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.great.entity.Exam;
import com.great.entity.SignInShow;
import com.great.entity.StuCardTime;
import com.great.entity.StuExamInfo;
import com.great.entity.Student;

public interface IStuInfoService {
	//��ʾѧ����Ϣ
	public Student showinformation(HttpSession session);
	//�޸�����
	public int upDateStuPwd(HttpSession session,Map<String, String> map);
	//�޸���Ϣ
	public Student upDateStuInfo(HttpSession session,Student student);
	//��ѯ����ͨ��ѧ��id
	public StuExamInfo selectExamByStuUuid(HttpSession session);
	//��ѯ��ʱ��
	public SignInShow selectCardTimesByStuUuid(HttpSession session);

}
