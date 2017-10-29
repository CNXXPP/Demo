package com.great.service.studentService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.great.entity.SchoolComment;
import com.great.entity.StuMsg;
import com.great.entity.TrainerComment;

/**
 * 学生信箱操作，评价驾校教练等
 * 
 * */
public interface IStuCommService {
	
	//通过session存的学生uuid去查询该学生所对应的教练的评价
	public List<Map<String, String>> getAllTrainerAppraise(HttpSession session);
	//通过session存的学生uuid去查询该学生所对应的驾校的评价
	public List<Map<String, String>> getAllSchoolAppraise(HttpSession session);
	//评论教练
	public int addAppraiseTrainer(HttpSession session,TrainerComment trainerComment);
	//评论驾校
	public int addAppraiseSchool(HttpSession session,SchoolComment schoolComment);
    //写信服务
	public boolean writerMessage(HttpSession session,Map<String, String>map);
	//获取收信箱的
	public List<Map<String, String>> getReceiveMessage(HttpSession session);
	//获取发信箱
	public List<Map<String, String>> getsendMessage(HttpSession session);
	//获取未读的信件数量
	public int neverReadNum(HttpSession session);
	
	public boolean changeMsgState(String smsgUuid);
}
