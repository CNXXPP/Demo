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
	//显示学生信息
	public Student showinformation(HttpSession session);
	//修改密码
	public int upDateStuPwd(HttpSession session,Map<String, String> map);
	//修改信息
	public Student upDateStuInfo(HttpSession session,Student student);
	//查询考试通过学生id
	public StuExamInfo selectExamByStuUuid(HttpSession session);
	//查询打卡时间
	public SignInShow selectCardTimesByStuUuid(HttpSession session);

}
