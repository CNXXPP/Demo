package com.great.service.studentService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.great.entity.SchoolComment;
import com.great.entity.StuMsg;
import com.great.entity.TrainerComment;

/**
 * ѧ��������������ۼ�У������
 * 
 * */
public interface IStuCommService {
	
	//ͨ��session���ѧ��uuidȥ��ѯ��ѧ������Ӧ�Ľ���������
	public List<Map<String, String>> getAllTrainerAppraise(HttpSession session);
	//ͨ��session���ѧ��uuidȥ��ѯ��ѧ������Ӧ�ļ�У������
	public List<Map<String, String>> getAllSchoolAppraise(HttpSession session);
	//���۽���
	public int addAppraiseTrainer(HttpSession session,TrainerComment trainerComment);
	//���ۼ�У
	public int addAppraiseSchool(HttpSession session,SchoolComment schoolComment);
    //д�ŷ���
	public boolean writerMessage(HttpSession session,Map<String, String>map);
	//��ȡ�������
	public List<Map<String, String>> getReceiveMessage(HttpSession session);
	//��ȡ������
	public List<Map<String, String>> getsendMessage(HttpSession session);
	//��ȡδ�����ż�����
	public int neverReadNum(HttpSession session);
	
	public boolean changeMsgState(String smsgUuid);
}
