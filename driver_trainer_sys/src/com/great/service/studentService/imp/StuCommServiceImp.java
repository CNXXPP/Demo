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
 * 学生信箱评价等服务层实现类
 * 
 * */
@Service
public class StuCommServiceImp implements IStuCommService {

	@Autowired
	TrainerCommentMapper trainerCommentMapper;// 教练评价表

	@Autowired
	SchoolCommentMapper schoolCommentMapper;// 学校评价表

	@Autowired
	TrainerMapper trainerMapper;// 教练表

	@Autowired
	DriverSchoolMapper diverSchoolMapper;// 驾校表

	@Autowired
	SchoolStuMapper schoolStuMapper;// 驾校学生表

	@Autowired
	TrainerStuMapper trainerStuMapper;// 教练学生表
	
	@Autowired
	StuMsgMapper stuMsgMapper;//学生消息表
	
	@Autowired
	SchoolMsgMapper schoolMsgMapper;//学生消息表
	
	@Autowired
	TrainerMsgMapper trainerMsgMapper;//学生消息表

	@Override
	public List<Map<String, String>> getAllTrainerAppraise(HttpSession session) {
		// TODO Auto-generated method stub
		// 获取所有的教练的评论
		String stuUuid = (String) session.getAttribute("stuUuid");

		int sum = trainerCommentMapper.selectSumScore(stuUuid);// 获取教练的总分

		int count = trainerCommentMapper.selectConut(stuUuid);// 获取教练评价个数

		int score = (sum / count);// 获取平局分

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("stuUuid", stuUuid);
		map.put("score", score);

		trainerMapper.updateTrainerScore(map);// 修改教练评分

		List<Map<String, String>> appraiseList = trainerCommentMapper
				.showAppraiseByStuUuid(stuUuid);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < appraiseList.size(); i++) {
			// sql时间戳转化为字符串
			String time = format.format(appraiseList.get(i).get("TC_DATE"));
			appraiseList.get(i).put("TC_DATE", time);
		}
		return appraiseList;
	}

	@Override
	public List<Map<String, String>> getAllSchoolAppraise(HttpSession session) {
		// TODO Auto-generated method stub
		// 获取所有的驾校的评论
		String stuUuid = (String) session.getAttribute("stuUuid");

		int sum = schoolCommentMapper.selectSumScore(stuUuid);// 获取驾校的总分

		int count = schoolCommentMapper.selectConut(stuUuid);// 获取驾校评价个数

		int score = (sum / count);// 获取平局分

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("stuUuid", stuUuid);
		map.put("score", score);

		diverSchoolMapper.updateSchoolScore(map);// 修改驾校评分

		List<Map<String, String>> appraiseList = schoolCommentMapper
				.showAppraiseByStuUuid(stuUuid);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < appraiseList.size(); i++) {
			// sql时间戳转化为字符串
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
		// 评价教练
		String stuUuid = (String) session.getAttribute("stuUuid");
		// 判断该学生是否评价过，评价过不让其评价
		TrainerComment trainerComment2 = trainerCommentMapper
				.selecTrainerCommentByStuUuid(stuUuid);
		if (trainerComment2 != null) {
			return 1;// 1代表有记录
		}
		trainerComment.setStuUuid(stuUuid);
		String traUuid = trainerStuMapper.getTrainerUuidByStuUuid(stuUuid);// 获取教练的uuid
		trainerComment.setTraUuid(traUuid);
		trainerComment.setTcDate(new Date());
		trainerComment.setTcUuid(UUID.randomUUID().toString());
		int row = trainerCommentMapper.insert(trainerComment);
		if (row > 0) {
			return 2;// 插入成功
		}
		return 0;// 插入失败
	}

	@Override
	public int addAppraiseSchool(HttpSession session,
			SchoolComment schoolComment) {
		// TODO Auto-generated method stub
		// 评价驾校

		String stuUuid = (String) session.getAttribute("stuUuid");
		// 判断该学生是否评价过，评价过不让其评价
		SchoolComment schoolComment2 = schoolCommentMapper
				.selectSchoolCommentByStuUuid(stuUuid);
		if (schoolComment2 != null) {
			return 1;// 1代表有记录
		}
		schoolComment.setStuUuid(stuUuid);
		String schUuid = schoolStuMapper.getSchoolUuidByStuUuid(stuUuid);// 获取教练的uuid
		schoolComment.setSchUuid(schUuid);
		schoolComment.setCommentDate(new Date());
		schoolComment.setSctUuid(UUID.randomUUID().toString());
		int row = schoolCommentMapper.insert(schoolComment);
		if (row > 0) {
			return 2;// 插入成功
		}
		return 0;// 插入失败
	}

	@Override
	public boolean writerMessage(HttpSession session, Map<String, String> map) {
		// TODO Auto-generated method stub
		//发信
		
		String stuUuid = (String) session.getAttribute("stuUuid");//获取学生id
		String title = map.get("title");//标题
		String user = map.get("user");//发送的对象
		String context = map.get("context");//内容
		String receiveId ="";
		
		if(user.equals("教练")){
			
			try {
				receiveId = trainerStuMapper.getTrainerUuidByStuUuid(stuUuid);//教练的uuid
				String msgUuid = UUID.randomUUID().toString();
				StuMsg stuMsg = new StuMsg(msgUuid,
						stuUuid,
						title,
						context,
						receiveId,
						new Date(),
						"已发送",
						"发",
						"教练");
				int stuRow = stuMsgMapper.insertStuMsg(stuMsg);//插入数据库
				TrainerMsg trainerMsg=new TrainerMsg(msgUuid,
						receiveId,
						title,
						context,
						stuUuid,
						new Date(),
						"未查看",
						"收",
						"学员");
				
				int traRow = trainerMsgMapper.insert(trainerMsg);//插入数据库
				
				if(stuRow > 0 &&traRow > 0){//当两个都插入成功时候
					synchronized (MyHashMap.class) {
						
						Session session2 = MyHashMap.hashMap.get(receiveId);//根据对应的uuid获取session推送消息
					
					
					if(session2 != null){//如果对方在线就推送消息通知他查看
						
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
						"已发送",
						"发",
						"驾校");
				int stuRow = stuMsgMapper.insertStuMsg(stuMsg);//插入数据库
				
				SchoolMsg schoolMsg = new SchoolMsg(
						msgUuid,
						receiveId,
						title,
						context,
						stuUuid,
						new Date(),
						"未查看",
						"收",
						"学员");
				int schRow = schoolMsgMapper.insert(schoolMsg);//插入数据库
				
				if(stuRow > 0 && schRow > 0){
					//当两个都插入成功时候
					synchronized (MyHashMap.class) {
						
						Session session2 = MyHashMap.hashMap.get(receiveId);//根据对应的uuid获取session推送消息
					
					
					if(session2 != null){//如果对方在线就推送消息通知他查看
						
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
		//收信箱
		
		String stuUuid = (String) session.getAttribute("stuUuid");
		
		StuMsg stuMsg = new StuMsg();
		
		stuMsg.setStuUuid(stuUuid);
		
		stuMsg.setSmsgType("收");
		
		List<Map<String, String>> msgs = stuMsgMapper.getStuMsgByStuUuidState(stuMsg);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < msgs.size(); i++) {
			// sql时间戳转化为字符串
			String time = format
					.format(msgs.get(i).get("SMSG_DATE"));
			msgs.get(i).put("SMSG_DATE", time);
		}
		
		return msgs;
	}

	@Override
	public List<Map<String, String>> getsendMessage(HttpSession session) {
		// TODO Auto-generated method stub
		//发信箱
        String stuUuid = (String) session.getAttribute("stuUuid");
		
		StuMsg stuMsg = new StuMsg();
		
		stuMsg.setStuUuid(stuUuid);
		
		stuMsg.setSmsgType("发");
		
		List<Map<String, String>> msgs = stuMsgMapper.getStuMsgByStuUuidState(stuMsg);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < msgs.size(); i++) {
			// sql时间戳转化为字符串
			String time = format
					.format(msgs.get(i).get("SMSG_DATE"));
			msgs.get(i).put("SMSG_DATE", time);
		}
		
		return msgs;
	}

	@Override
	public int neverReadNum(HttpSession session) {
		// TODO Auto-generated method stub
		//获取未读取的文件数量
		
		String stuUuid = (String) session.getAttribute("stuUuid");
		
		Map<String, String>map = new HashMap<String, String>();
		
		map.put("smsgStatus", "未查看");
		
		map.put("stuUuid", stuUuid);
		
		int num = stuMsgMapper.getNeverReadNum(map);
		
		return num;
	}

	@Override
	public boolean changeMsgState(String smsgUuid) {
		// TODO Auto-generated method stub
		//改变信件的状态
		Map<String, String>map = new HashMap<String, String>();
		
		map.put("smsgUuid", smsgUuid);
		
		map.put("smsgStatus", "已查看");
		
		int row = stuMsgMapper.changeMessageState(map);
		
		if(row > 0){
			return true;
		}
		return false;
	}

}
