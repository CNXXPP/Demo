package com.great.controller.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.entity.SchoolComment;
import com.great.entity.StuMsg;
import com.great.entity.TrainerComment;
import com.great.service.studentService.IStuCommService;

/**
 * ѧ���������۵ȿ��Ʋ�
 * 
 * */

@Controller
@RequestMapping("/grj")
public class CommController {

	@Autowired
	IStuCommService stuCommService;

	@RequestMapping("/appraise/trainerAppraise")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public String getAllTrainerAppraise(HttpSession session) throws Exception {
        //չʾ���еĽ�������
		List<Map<String, String>> list = stuCommService
				.getAllTrainerAppraise(session);

		JSONArray array = JSONArray.fromObject(list);

		JSONObject obj = new JSONObject();

		obj.put("data", array.toString());

		return obj.toString();
	}

	@RequestMapping("/appraise/schoolAppraise")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public String getAllSchoolAppraise(HttpSession session) throws Exception {
        //չʾ���еļ�У����
		List<Map<String, String>> list = stuCommService
				.getAllSchoolAppraise(session);

		JSONArray array = JSONArray.fromObject(list);

		JSONObject obj = new JSONObject();

		obj.put("data", array.toString());

		return obj.toString();

	}

	@RequestMapping("/appraise/addTrainerAppraise")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> addTrainerAppraise(HttpSession session,
			TrainerComment trainerComment) throws Exception {
        //������۽���
		Map<String, Object> map = new HashMap<String, Object>();

		int num = stuCommService.addAppraiseTrainer(session, trainerComment);

		switch (num) {
		case 0:
			map.put("message", "����ʧ�ܣ�������");
			break;

		case 1:
			map.put("message", "��Ǹ���Ѿ����۹����������");
			break;
		case 2:
			map.put("message", "���۳ɹ�,��л��ķ���");
			break;
		}
		
		return map;

	}

	@RequestMapping("/appraise/addSchoolAppraise")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> addSchoolAppraise(HttpSession session,
			SchoolComment schoolComment) throws Exception {
         //������ۼ�У
		Map<String, Object> map = new HashMap<String, Object>();

		int num = stuCommService.addAppraiseSchool(session, schoolComment);

		switch (num) {
		case 0:
			map.put("message", "����ʧ�ܣ�������");
			break;

		case 1:
			map.put("message", "��Ǹ���Ѿ����۹���");
			break;
		case 2:
			map.put("message", "���۳ɹ�,��л��ķ���");
			break;
		}
		
		return map;
	}
	
	
	@RequestMapping("/message/writerMessage")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, String> writerMessage(HttpSession session,@RequestParam Map<String, String>map)throws Exception{
		//д�Ÿ���У���߽���
		
		Map<String, String> map2 = new HashMap<String, String>();
		
		boolean bSuc = stuCommService.writerMessage(session, map);
		
		if(bSuc){
			map2.put("result", "�ѷ���");
		}else{
			map2.put("result", "����ʧ��");
		}
		
		return map2;
	}
	
	@RequestMapping("/message/receiveMessage")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public String receiveMessage(HttpSession session)throws Exception{
		//������
		
		List<Map<String, String>> msgList = stuCommService.getReceiveMessage(session);
		
		JSONArray array = JSONArray.fromObject(msgList);

		JSONObject obj = new JSONObject();

		obj.put("data", array.toString());

		return obj.toString();
		
	}
	
	@RequestMapping("/message/sendMessage")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public  String sendMessage(HttpSession session)throws Exception{
		//������
        List<Map<String, String>> msgList = stuCommService.getsendMessage(session);
		
		JSONArray array = JSONArray.fromObject(msgList);

		JSONObject obj = new JSONObject();

		obj.put("data", array.toString());

		return obj.toString();
	}
	
	@RequestMapping("/message/changeState")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public  Map<String, String> changeState(String smsgUuid)throws Exception{
		//�ı��ż�״̬
		
		Map<String, String> map = new HashMap<String, String>();
		
		boolean bSuc = stuCommService.changeMsgState(smsgUuid);
		if(bSuc){
			map.put("result", "success");
		}else{
			map.put("result", "failed");
		}
		
     return map;
	}
	
	@RequestMapping("/message/getNeverReadNum")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public  Map<String, Object> getNeverReadNum(HttpSession session)throws Exception{
		//��ȡδ��ȡ�ż�������
        Map<String, Object> map = new HashMap<String, Object>();
		
		int  num = stuCommService.neverReadNum(session);
		
		map.put("result", num);
		
		return map;
	}
}
