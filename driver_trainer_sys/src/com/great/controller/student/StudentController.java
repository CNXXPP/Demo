package com.great.controller.student;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.great.entity.CenterAnnouncement;
import com.great.entity.Notice;
import com.great.entity.SchAnnouncement;
import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.service.studentService.IStudentService;

import com.great.util.AuthCode;
/**
 * 学员中心控制层
 * 
 * */
@Controller
@RequestMapping("/grj")
public class StudentController {
	
	private String imgCode = "";//存验证码内容
	
	@Autowired
	IStudentService studentServiceImp;
	//获取运管最近的一次公告
	@RequestMapping("/announcement/getCenterAnnouncement")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> getCenterAnnouncement()throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		CenterAnnouncement center=studentServiceImp.getCenterAnnouncement();
	
		if(center != null){
			
			map.put("studentCenterAnnouncement", center);
			
			return map;
		}else{
			
			return null;
		}
		
	}
	
	//获取驾校最近的一次公告
	@RequestMapping("/announcement/getSchoolAnnouncement")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> getSchoolAnnouncement(HttpSession session)throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		SchAnnouncement  schAnnouncement = studentServiceImp.getSchAnnouncement(session);
		
		if(schAnnouncement != null){
			
			map.put("studentSchoolAnnouncement", schAnnouncement);//返回最近最近公告的一个对象
			
			return map;
		}else{
			
			return null;
		}
		
	}
	
	
	//学生登陆时获取验证码使用
	@RequestMapping("/student/studentAuthCode")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void studentImg(HttpServletResponse response)throws Exception{
		
		imgCode = AuthCode.getAuthCode();
		
		BufferedImage image = AuthCode.getAuthImg(imgCode);
	
		try {
			//写入对应img标签上，显示出来
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	//学生登陆判断使用
	@RequestMapping(value="/login/studentLogin",method=RequestMethod.POST)
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, String> studenntLogin(@RequestParam Map<String, String>map,HttpSession session)throws Exception{
		Student student=new Student();
	   
		Map <String,String> backMap = new HashMap<String,String>();
		
		student.setStuId(new Integer(map.get("stuId")).intValue() );
		
		student.setStuPwd(map.get("stuPwd"));
		
		String msg=studentServiceImp.studentLogin(student,session);
	    
		String code=map.get("code");
	  
		if(msg.equals("不存在该用户")){
			backMap.put("message", "不存在该用户");
			return backMap;
		}else if(msg.equals("success")){
			
			if(imgCode.equalsIgnoreCase(code)){
				backMap.put("message" , "登陆成功");
				
				return backMap;
			}else{
				backMap.put("message", "验证码错误");
				return backMap;
			}
		}else{
			backMap.put("message" , "登录失败");
			return backMap;
		}
		
	
	 
		
	}
	
	//获取驾校和运管的公告
	@RequestMapping(value="/announcement/studentannouncement",method=RequestMethod.POST)
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public String getStuAnnouncement(HttpSession session)throws Exception{
		
		Map<String, Object>map = new HashMap<String, Object>();
		
		String stuUuid=(String) session.getAttribute("stuUuid");
		System.out.println("stuUuid");
		ArrayList<Notice>showNotices=studentServiceImp.getNotices(stuUuid);
		JSONArray array=JSONArray.fromObject(showNotices);
		map.put("stuAnnouncement", array.toString());
		JSONObject send = new JSONObject();
		send.put("data", array);
		return send.toJSONString();
	}
	
	
	@RequestMapping("/student/getTrainers")
	@ResponseBody
	@Transactional (rollbackFor = Exception.class )
	public Map<String, Object>getTrainers(String schUuid)throws Exception{
		//获取驾校的所有的教练
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Trainer> trainers = studentServiceImp.getTrainersBySchUuid(schUuid);
		
		if(trainers != null){
			map.put("trainers", trainers);
			return map;
		}
		
		return null;
		
	}
	
	@RequestMapping(value="/student/studengRigester",method=RequestMethod.POST)
	@Transactional (rollbackFor = Exception.class )
	public ModelAndView studengRigester(@RequestParam Map<String, String>map,HttpSession session)throws Exception{
		//学员注册
		
		studentServiceImp.StudentRegister(map, session);
		
		
		ModelAndView modelAndView= new ModelAndView("studentSystem/pay");
	
		//订单编号
		 session.setAttribute("WIDout_trade_no", System.currentTimeMillis());
		//订单金额
		 session.setAttribute("WIDtotal_amount", 6300);
		//订单名称
		 session.setAttribute("WIDsubject", "报名费");
		//订单描述 
		 session.setAttribute("WIDbody", "学生报名支付宝支付");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/student/savaSchUuid")
	@ResponseBody
	@Transactional (rollbackFor = Exception.class )
	public void savaSchUuid(HttpSession session,String schUuid)throws Exception{
		//保存学校的uuid
		//当点击驾校展示页面后的报名时，保存学校的uuid然后跳转到学员注册界面，通过el表达式获取学校的uuid后期插入数据库
		session.setAttribute("schUuid", schUuid);
		
	}
}
