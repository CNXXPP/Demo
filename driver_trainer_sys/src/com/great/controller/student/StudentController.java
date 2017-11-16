package com.great.controller.student;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
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
 * 学员锟斤拷锟侥匡拷锟狡诧拷
 * 
 * */
@Controller
@RequestMapping("/grj")
public class StudentController {
	
	private String imgCode = "";//锟斤拷锟斤拷证锟斤拷锟斤拷锟斤拷
	
	@Autowired
	IStudentService studentServiceImp;
	//锟斤拷取锟剿癸拷锟斤拷锟斤拷一锟轿癸拷锟斤拷
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
	
	//锟斤拷取锟斤拷校锟斤拷锟斤拷一锟轿癸拷锟斤拷
	@RequestMapping("/announcement/getSchoolAnnouncement")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> getSchoolAnnouncement(HttpSession session)throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		SchAnnouncement  schAnnouncement = studentServiceImp.getSchAnnouncement(session);
		
		if(schAnnouncement != null){
			
			map.put("studentSchoolAnnouncement", schAnnouncement);//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟斤拷
			
			return map;
		}else{
			
			return null;
		}
		
	}
	
	
	//学锟斤拷锟铰绞憋拷锟饺★拷锟街わ拷锟绞癸拷锟�
	@RequestMapping("/student/studentAuthCode")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void studentImg(HttpServletResponse response)throws Exception{
		
		imgCode = AuthCode.getAuthCode();
		
		BufferedImage image = AuthCode.getAuthImg(imgCode);
	
		try {
			//写锟斤拷锟接mg锟斤拷签锟较ｏ拷锟斤拷示锟斤拷锟斤拷
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	//学锟斤拷锟铰斤拷卸锟绞癸拷锟�
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
	  
		if(msg.equals("锟斤拷锟斤拷锟节革拷锟矫伙拷")){
			backMap.put("message", "锟斤拷锟斤拷锟节革拷锟矫伙拷");
			return backMap;
		}else if(msg.equals("success")){
			
			if(imgCode.equalsIgnoreCase(code)){
				backMap.put("message" , "锟斤拷陆锟缴癸拷");
				
				return backMap;
			}else{
//				backMap.put("message", "锟斤拷证锟斤拷锟斤拷锟�);
				return backMap;
			}
		}else{
			backMap.put("message" , "锟斤拷录失锟斤拷");
			return backMap;
		}
		
	
	 
		
	}
	
	//锟斤拷取锟斤拷校锟斤拷锟剿管的癸拷锟斤拷
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
		//锟斤拷取锟斤拷校锟斤拷锟斤拷锟叫的斤拷锟斤拷
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
		//学员注锟斤拷
		
		studentServiceImp.StudentRegister(map, session);
		
		
		ModelAndView modelAndView= new ModelAndView("studentSystem/pay");
	
		//锟斤拷锟斤拷锟斤拷锟�
		 session.setAttribute("WIDout_trade_no", System.currentTimeMillis());
		//锟斤拷锟斤拷锟斤拷锟�
		 session.setAttribute("WIDtotal_amount", 6300);
		//锟斤拷锟斤拷锟斤拷锟�
//		 session.setAttribute("WIDsubject", "锟斤拷锟斤拷锟�);
		//锟斤拷锟斤拷锟斤拷锟斤拷 
		 session.setAttribute("WIDbody", "学锟斤拷锟斤拷支锟斤拷锟斤拷支锟斤拷");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/student/savaSchUuid")
	@ResponseBody
	@Transactional (rollbackFor = Exception.class )
	public void savaSchUuid(HttpSession session,String schUuid)throws Exception{
		//锟斤拷锟斤拷学校锟斤拷uuid
		//锟斤拷锟斤拷锟斤拷锟叫Ｕ故疽筹拷锟斤拷谋锟斤拷锟绞憋拷锟斤拷锟斤拷锟窖ｏ拷锟絬uid然锟斤拷锟斤拷转锟斤拷学员注锟斤拷锟斤拷妫拷锟絜l锟斤拷锟绞斤拷锟饺⊙ｏ拷锟絬uid锟斤拷锟节诧拷锟斤拷锟斤拷菘锟�
		session.setAttribute("schUuid", schUuid);
		
	}
}
