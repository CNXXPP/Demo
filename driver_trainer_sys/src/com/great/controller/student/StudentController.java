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
 * ѧԱ���Ŀ��Ʋ�
 * 
 * */
@Controller
@RequestMapping("/grj")
public class StudentController {
	
	private String imgCode = "";//����֤������
	
	@Autowired
	IStudentService studentServiceImp;
	//��ȡ�˹������һ�ι���
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
	
	//��ȡ��У�����һ�ι���
	@RequestMapping("/announcement/getSchoolAnnouncement")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object> getSchoolAnnouncement(HttpSession session)throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		SchAnnouncement  schAnnouncement = studentServiceImp.getSchAnnouncement(session);
		
		if(schAnnouncement != null){
			
			map.put("studentSchoolAnnouncement", schAnnouncement);//���������������һ������
			
			return map;
		}else{
			
			return null;
		}
		
	}
	
	
	//ѧ����½ʱ��ȡ��֤��ʹ��
	@RequestMapping("/student/studentAuthCode")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void studentImg(HttpServletResponse response)throws Exception{
		
		imgCode = AuthCode.getAuthCode();
		
		BufferedImage image = AuthCode.getAuthImg(imgCode);
	
		try {
			//д���Ӧimg��ǩ�ϣ���ʾ����
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	//ѧ����½�ж�ʹ��
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
	  
		if(msg.equals("�����ڸ��û�")){
			backMap.put("message", "�����ڸ��û�");
			return backMap;
		}else if(msg.equals("success")){
			
			if(imgCode.equalsIgnoreCase(code)){
				backMap.put("message" , "��½�ɹ�");
				
				return backMap;
			}else{
				backMap.put("message", "��֤�����");
				return backMap;
			}
		}else{
			backMap.put("message" , "��¼ʧ��");
			return backMap;
		}
		
	
	 
		
	}
	
	//��ȡ��У���˹ܵĹ���
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
		//��ȡ��У�����еĽ���
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
		//ѧԱע��
		
		studentServiceImp.StudentRegister(map, session);
		
		
		ModelAndView modelAndView= new ModelAndView("studentSystem/pay");
	
		//�������
		 session.setAttribute("WIDout_trade_no", System.currentTimeMillis());
		//�������
		 session.setAttribute("WIDtotal_amount", 6300);
		//��������
		 session.setAttribute("WIDsubject", "������");
		//�������� 
		 session.setAttribute("WIDbody", "ѧ������֧����֧��");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/student/savaSchUuid")
	@ResponseBody
	@Transactional (rollbackFor = Exception.class )
	public void savaSchUuid(HttpSession session,String schUuid)throws Exception{
		//����ѧУ��uuid
		//�������Уչʾҳ���ı���ʱ������ѧУ��uuidȻ����ת��ѧԱע����棬ͨ��el���ʽ��ȡѧУ��uuid���ڲ������ݿ�
		session.setAttribute("schUuid", schUuid);
		
	}
}
