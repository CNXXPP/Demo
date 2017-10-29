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
 * 学生信箱评价等控制层
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
        //展示所有的教练评价
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
        //展示所有的驾校评价
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
        //添加评价教练
		Map<String, Object> map = new HashMap<String, Object>();

		int num = stuCommService.addAppraiseTrainer(session, trainerComment);

		switch (num) {
		case 0:
			map.put("message", "评价失败，请重试");
			break;

		case 1:
			map.put("message", "抱歉你已经评价过这个教练了");
			break;
		case 2:
			map.put("message", "评价成功,感谢你的反馈");
			break;
		}
		
		return map;

	}

	@RequestMapping("/appraise/addSchoolAppraise")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> addSchoolAppraise(HttpSession session,
			SchoolComment schoolComment) throws Exception {
         //添加评价驾校
		Map<String, Object> map = new HashMap<String, Object>();

		int num = stuCommService.addAppraiseSchool(session, schoolComment);

		switch (num) {
		case 0:
			map.put("message", "评价失败，请重试");
			break;

		case 1:
			map.put("message", "抱歉你已经评价过了");
			break;
		case 2:
			map.put("message", "评价成功,感谢你的反馈");
			break;
		}
		
		return map;
	}
	
	
	@RequestMapping("/message/writerMessage")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, String> writerMessage(HttpSession session,@RequestParam Map<String, String>map)throws Exception{
		//写信给驾校或者教练
		
		Map<String, String> map2 = new HashMap<String, String>();
		
		boolean bSuc = stuCommService.writerMessage(session, map);
		
		if(bSuc){
			map2.put("result", "已发送");
		}else{
			map2.put("result", "发送失败");
		}
		
		return map2;
	}
	
	@RequestMapping("/message/receiveMessage")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public String receiveMessage(HttpSession session)throws Exception{
		//收信箱
		
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
		//发信箱
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
		//改变信件状态
		
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
		//获取未读取信件的数量
        Map<String, Object> map = new HashMap<String, Object>();
		
		int  num = stuCommService.neverReadNum(session);
		
		map.put("result", num);
		
		return map;
	}
}
