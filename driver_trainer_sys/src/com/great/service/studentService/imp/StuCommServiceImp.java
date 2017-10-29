package com.great.service.studentService.imp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.DriverSchoolMapper;
import com.great.dao.SchoolCommentMapper;
import com.great.dao.SchoolMsgMapper;
import com.great.dao.SchoolStuMapper;
import com.great.dao.StuMsgMapper;
import com.great.dao.TrainerCommentMapper;
import com.great.dao.TrainerMapper;
import com.great.dao.TrainerMsgMapper;
import com.great.dao.TrainerStuMapper;
import com.great.entity.SchoolComment;
import com.great.entity.SchoolMsg;
import com.great.entity.StuMsg;
import com.great.entity.TrainerComment;
import com.great.entity.TrainerMsg;
import com.great.service.studentService.IStuCommService;
import com.great.util.MyHashMap;

/**
 * ѧ���������۵ȷ����ʵ����
 * 
 * */
@Service
public class StuCommServiceImp implements IStuCommService {

	@Autowired
	TrainerCommentMapper trainerCommentMapper;// �������۱�

	@Autowired
	SchoolCommentMapper schoolCommentMapper;// ѧУ���۱�

	@Autowired
	TrainerMapper trainerMapper;// ������

	@Autowired
	DriverSchoolMapper diverSchoolMapper;// ��У��

	@Autowired
	SchoolStuMapper schoolStuMapper;// ��Уѧ����

	@Autowired
	TrainerStuMapper trainerStuMapper;// ����ѧ����
	
	@Autowired
	StuMsgMapper stuMsgMapper;//ѧ����Ϣ��
	
	@Autowired
	SchoolMsgMapper schoolMsgMapper;//ѧ����Ϣ��
	
	@Autowired
	TrainerMsgMapper trainerMsgMapper;//ѧ����Ϣ��

	@Override
	public List<Map<String, String>> getAllTrainerAppraise(HttpSession session) {
		// TODO Auto-generated method stub
		// ��ȡ���еĽ���������
		String stuUuid = (String) session.getAttribute("stuUuid");

		int sum = trainerCommentMapper.selectSumScore(stuUuid);// ��ȡ�������ܷ�

		int count = trainerCommentMapper.selectConut(stuUuid);// ��ȡ�������۸���

		int score = (sum / count);// ��ȡƽ�ַ�

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("stuUuid", stuUuid);
		map.put("score", score);

		trainerMapper.updateTrainerScore(map);// �޸Ľ�������

		List<Map<String, String>> appraiseList = trainerCommentMapper
				.showAppraiseByStuUuid(stuUuid);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < appraiseList.size(); i++) {
			// sqlʱ���ת��Ϊ�ַ���
			String time = format.format(appraiseList.get(i).get("TC_DATE"));
			appraiseList.get(i).put("TC_DATE", time);
		}
		return appraiseList;
	}

	@Override
	public List<Map<String, String>> getAllSchoolAppraise(HttpSession session) {
		// TODO Auto-generated method stub
		// ��ȡ���еļ�У������
		String stuUuid = (String) session.getAttribute("stuUuid");

		int sum = schoolCommentMapper.selectSumScore(stuUuid);// ��ȡ��У���ܷ�

		int count = schoolCommentMapper.selectConut(stuUuid);// ��ȡ��У���۸���

		int score = (sum / count);// ��ȡƽ�ַ�

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("stuUuid", stuUuid);
		map.put("score", score);

		diverSchoolMapper.updateSchoolScore(map);// �޸ļ�У����

		List<Map<String, String>> appraiseList = schoolCommentMapper
				.showAppraiseByStuUuid(stuUuid);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < appraiseList.size(); i++) {
			// sqlʱ���ת��Ϊ�ַ���
			String time = format
					.format(appraiseList.get(i).get("COMMENT_DATE"));
			appraiseList.get(i).put("COMMENT_DATE", time);
		}

		return appraiseList;
	}

	@Override
	public int addAppraiseTrainer(HttpSession session,
			TrainerComment trainerComment) {
		// TODO Auto-generated method stub
		// ���۽���
		String stuUuid = (String) session.getAttribute("stuUuid");
		// �жϸ�ѧ���Ƿ����۹������۹�����������
		TrainerComment trainerComment2 = trainerCommentMapper
				.selecTrainerCommentByStuUuid(stuUuid);
		if (trainerComment2 != null) {
			return 1;// 1�����м�¼
		}
		trainerComment.setStuUuid(stuUuid);
		String traUuid = trainerStuMapper.getTrainerUuidByStuUuid(stuUuid);// ��ȡ������uuid
		trainerComment.setTraUuid(traUuid);
		trainerComment.setTcDate(new Date());
		trainerComment.setTcUuid(UUID.randomUUID().toString());
		int row = trainerCommentMapper.insert(trainerComment);
		if (row > 0) {
			return 2;// ����ɹ�
		}
		return 0;// ����ʧ��
	}

	@Override
	public int addAppraiseSchool(HttpSession session,
			SchoolComment schoolComment) {
		// TODO Auto-generated method stub
		// ���ۼ�У

		String stuUuid = (String) session.getAttribute("stuUuid");
		// �жϸ�ѧ���Ƿ����۹������۹�����������
		SchoolComment schoolComment2 = schoolCommentMapper
				.selectSchoolCommentByStuUuid(stuUuid);
		if (schoolComment2 != null) {
			return 1;// 1�����м�¼
		}
		schoolComment.setStuUuid(stuUuid);
		String schUuid = schoolStuMapper.getSchoolUuidByStuUuid(stuUuid);// ��ȡ������uuid
		schoolComment.setSchUuid(schUuid);
		schoolComment.setCommentDate(new Date());
		schoolComment.setSctUuid(UUID.randomUUID().toString());
		int row = schoolCommentMapper.insert(schoolComment);
		if (row > 0) {
			return 2;// ����ɹ�
		}
		return 0;// ����ʧ��
	}

	@Override
	public boolean writerMessage(HttpSession session, Map<String, String> map) {
		// TODO Auto-generated method stub
		//����
		
		String stuUuid = (String) session.getAttribute("stuUuid");//��ȡѧ��id
		String title = map.get("title");//����
		String user = map.get("user");//���͵Ķ���
		String context = map.get("context");//����
		String receiveId ="";
		
		if(user.equals("����")){
			
			try {
				receiveId = trainerStuMapper.getTrainerUuidByStuUuid(stuUuid);//������uuid
				String msgUuid = UUID.randomUUID().toString();
				StuMsg stuMsg = new StuMsg(msgUuid,
						stuUuid,
						title,
						context,
						receiveId,
						new Date(),
						"�ѷ���",
						"��",
						"����");
				int stuRow = stuMsgMapper.insertStuMsg(stuMsg);//�������ݿ�
				TrainerMsg trainerMsg=new TrainerMsg(msgUuid,
						receiveId,
						title,
						context,
						stuUuid,
						new Date(),
						"δ�鿴",
						"��",
						"ѧԱ");
				
				int traRow = trainerMsgMapper.insert(trainerMsg);//�������ݿ�
				
				if(stuRow > 0 &&traRow > 0){//������������ɹ�ʱ��
					synchronized (MyHashMap.class) {
						
						Session session2 = MyHashMap.hashMap.get(receiveId);//���ݶ�Ӧ��uuid��ȡsession������Ϣ
					
					
					if(session2 != null){//����Է����߾�������Ϣ֪ͨ���鿴
						
						String msg = JSONObject.fromObject("{msg:'sendMsg'}").toString();
						
						session2.getAsyncRemote().sendText(msg);
					}
					
					}
					return true;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			
			try {
				receiveId = schoolStuMapper.getSchoolUuidByStuUuid(stuUuid);
				
				String msgUuid = UUID.randomUUID().toString();
				
				StuMsg stuMsg = new StuMsg(
						msgUuid,
						stuUuid, 
						title,
						context,
						receiveId,
						new Date(),
						"�ѷ���",
						"��",
						"��У");
				int stuRow = stuMsgMapper.insertStuMsg(stuMsg);//�������ݿ�
				
				SchoolMsg schoolMsg = new SchoolMsg(
						msgUuid,
						receiveId,
						title,
						context,
						stuUuid,
						new Date(),
						"δ�鿴",
						"��",
						"ѧԱ");
				int schRow = schoolMsgMapper.insert(schoolMsg);//�������ݿ�
				
				if(stuRow > 0 && schRow > 0){
					//������������ɹ�ʱ��
					synchronized (MyHashMap.class) {
						
						Session session2 = MyHashMap.hashMap.get(receiveId);//���ݶ�Ӧ��uuid��ȡsession������Ϣ
					
					
					if(session2 != null){//����Է����߾�������Ϣ֪ͨ���鿴
						
						String msg = JSONObject.fromObject("{msg:'sendMsg'}").toString();
						
						session2.getAsyncRemote().sendText(msg);
					}
					
					}
				return true;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return false;
	}

	@Override
	public List<Map<String, String>> getReceiveMessage(HttpSession session) {
		// TODO Auto-generated method stub
		//������
		
		String stuUuid = (String) session.getAttribute("stuUuid");
		
		StuMsg stuMsg = new StuMsg();
		
		stuMsg.setStuUuid(stuUuid);
		
		stuMsg.setSmsgType("��");
		
		List<Map<String, String>> msgs = stuMsgMapper.getStuMsgByStuUuidState(stuMsg);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < msgs.size(); i++) {
			// sqlʱ���ת��Ϊ�ַ���
			String time = format
					.format(msgs.get(i).get("SMSG_DATE"));
			msgs.get(i).put("SMSG_DATE", time);
		}
		
		return msgs;
	}

	@Override
	public List<Map<String, String>> getsendMessage(HttpSession session) {
		// TODO Auto-generated method stub
		//������
        String stuUuid = (String) session.getAttribute("stuUuid");
		
		StuMsg stuMsg = new StuMsg();
		
		stuMsg.setStuUuid(stuUuid);
		
		stuMsg.setSmsgType("��");
		
		List<Map<String, String>> msgs = stuMsgMapper.getStuMsgByStuUuidState(stuMsg);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < msgs.size(); i++) {
			// sqlʱ���ת��Ϊ�ַ���
			String time = format
					.format(msgs.get(i).get("SMSG_DATE"));
			msgs.get(i).put("SMSG_DATE", time);
		}
		
		return msgs;
	}

	@Override
	public int neverReadNum(HttpSession session) {
		// TODO Auto-generated method stub
		//��ȡδ��ȡ���ļ�����
		
		String stuUuid = (String) session.getAttribute("stuUuid");
		
		Map<String, String>map = new HashMap<String, String>();
		
		map.put("smsgStatus", "δ�鿴");
		
		map.put("stuUuid", stuUuid);
		
		int num = stuMsgMapper.getNeverReadNum(map);
		
		return num;
	}

	@Override
	public boolean changeMsgState(String smsgUuid) {
		// TODO Auto-generated method stub
		//�ı��ż���״̬
		Map<String, String>map = new HashMap<String, String>();
		
		map.put("smsgUuid", smsgUuid);
		
		map.put("smsgStatus", "�Ѳ鿴");
		
		int row = stuMsgMapper.changeMessageState(map);
		
		if(row > 0){
			return true;
		}
		return false;
	}

}
