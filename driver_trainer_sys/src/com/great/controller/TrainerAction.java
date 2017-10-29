package com.great.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.SwingUtilities;

import oracle.net.aso.k;
import oracle.net.aso.l;
import oracle.net.aso.r;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.entity.TrainerMsg;
import com.great.entity.TrainerStu;
import com.great.entity.UpdateTrainerMsg;
import com.great.entity.VerifyPwd;
import com.great.service.trainerService.ILoginService;
import com.great.service.trainerService.ItrainerService;
import com.great.util.AuthCode;
import com.megvii.cloud.mylibrary.R.string;
import com.mysql.jdbc.UpdatableResultSet;

@Controller
@RequestMapping("/cw")
public class TrainerAction {

     @Autowired
	 ILoginService login;
     
     @Autowired
     ItrainerService trainerService;
	
     private Trainer tra;
     private SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss");
	
	@RequestMapping("/trainerAuthCode")
	@ResponseBody
	public void trainerAuthCode(HttpServletResponse response,HttpSession session){
		
		String code = AuthCode.getAuthCode();
		session.setAttribute("trainerAuth", code);
		BufferedImage image = AuthCode.getAuthImg(code);
		System.out.println("session存的 AuthCode="+code);
		try {
			//写入对应img标签上，显示出来
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	/**
	 *教练登录
	 *
	 * */
	@RequestMapping("/trainerLogin")
	@ResponseBody
	public Trainer login(Trainer trainer,String code,HttpSession session){
		
	   System.out.println("-------code ="+code);	
	   
      String secode=(String) session.getAttribute("trainerAuth");
		
      if (!secode.equalsIgnoreCase(code)){
	  
    	return null;
    	  
	  }else {
		
			Trainer trainer2 = login.loginVerify(trainer);

			String HireDate = new SimpleDateFormat("yyyy-MM-dd")
					.format(trainer2.getTraHireDate());
			String LastLoginDate = format.format(trainer2.getLastLoginDate());

			Map<String, String> map = new HashMap<String, String>();
			map.put("HireDate", HireDate);
			map.put("LastLoginDate", LastLoginDate);

			session.setAttribute("map", map);
			session.setAttribute("Trainer", trainer2);
			tra = trainer2;
			return trainer2;
	 }

      
	}
	/**
	 * 所有学员
	 * 
	 * */
	@RequestMapping("/showAllstu")
	@ResponseBody
	public String showAllstu(){

		List<Student> list=login.showAllstu(tra.getTraUuid());
				
		JSONArray jsonArray = new JSONArray();	
		JSONObject object=new JSONObject();
		List<Map<String, String>> maps = new ArrayList<Map<String, String>>();
		
		for (Student student : list) {         

			Map<String, String> map = new HashMap<String, String>();
			map.put("stuId", student.getStuId()+"");
			map.put("stuName", student.getStuName());
			map.put("stuIdentity", student.getStuIdentity());
			map.put("stuGender", student.getStuGender());
			map.put("createDate", format.format(student.getCreateDate()));
			map.put("stuCurSub", student.getStuCurSub());
			map.put("stuPhone", student.getStuPhone());
			map.put("ethnicGroup", student.getEthnicGroup());
			map.put("drivingType", student.getDrivingType());
			map.put("curLocation", student.getCurLocation());
			map.put("identityLocation", student.getIdentityLocation());
			
		    maps.add(map);
						
		}	
		
		for (Map<String, String> map : maps) {
			
			JSONObject o = new JSONObject();
            
			 for (Entry<String, String> key : map.entrySet()) {

				 o.put(key.getKey(), key.getValue());
			}
			 
			jsonArray.add(o);
		}
		

		object.put("data", jsonArray);

		return object.toJSONString();
	}
	/**
	 * 学员学时
	 * */
	@RequestMapping("/selectStudyHours")
	@ResponseBody
	public String selectStudyHours(){
		
		List<Student> allstulist=login.showAllstu(tra.getTraUuid());
		
		System.out.println("allstulist ="+allstulist);
		
		List<Map<String, String>> lMaps=login.showStuTime(allstulist);
		
		JSONArray array = new JSONArray();
		for (int i = 0; i < lMaps.size(); i++) {
			JSONObject object=new JSONObject();
			
			for (String key : lMaps.get(i).keySet()) {
				
				object.put(key, lMaps.get(i).get(key));
			}
			
			array.add(object);
		}
		
		JSONObject object = new JSONObject();		
		object.put("data", array);

		return object.toJSONString();
	}
	/**
	 * 查看教练评价
	 * */
	@ResponseBody
	@RequestMapping("/showAppraise")
	public String showAppraise() {

		List<Map<String, String>> lMaps = trainerService.showAppraise(tra.getTraUuid());
		JSONArray array = new JSONArray();
		
		for (Map<String, String> map : lMaps) {
            
			JSONObject object = new JSONObject();
			for (String key : map.keySet()) {
                if (key.equals("TC_DATE")) {
					
                	object.put(key, format.format(map.get(key)));
				}else {
					
					object.put(key, map.get(key));
				}
			}

			array.add(object);
		}

		JSONObject object = new JSONObject();
		object.put("data", array);

		return object.toJSONString();
	}
	
	/**
	 *  修改教练个人信息
	 * */
	
	@RequestMapping("/updateTrainer")
	@ResponseBody
	public String updateTrainer(HttpServletRequest request){
		
		UpdateTrainerMsg msg = new UpdateTrainerMsg(
				tra.getTraUuid(), 
				request.getParameter("traPhone"),
				request.getParameter("traIntro"));
		
		  int a= trainerService.updateTrainerMsg(msg);
		  
		 if (a>0) {
			
			 return "1";
			 
		}else {
			
			return "";
		} 

	}
	
	/**
	 * 
	 * 修改密码
	 * */
	@RequestMapping("/updateTrainerPwd")
	@ResponseBody
	public String updatePassword(String pw1 ,String pw2){

		String id = String.valueOf(tra.getTraId());
		
		VerifyPwd pwd = new VerifyPwd(id, pw1);
 
		int c = trainerService.selectTrainer(pwd,pw2);
		
		if (c==0){
			
			return "";
			
		}else {
			
			return "success";
			
		}

	}
	
	@RequestMapping("/writerMsg")
	@ResponseBody
	public String writerMsg(TrainerMsg trainerMsg){
		
	    UUID uuid = UUID.randomUUID();
		trainerMsg.setTmsgUuid(uuid.toString());
		
		int a = trainerService.insertTrainerMsg(trainerMsg,tra);
		 
		if (a>0){
			
			return "1";
		}else {
			
			return "";
		}

	}
	
	
	@RequestMapping("/selectSendMsg")
	@ResponseBody
	public String selectSendMsg(){		

		List<Map<String, String>> trainerMsg = trainerService.selectMsg("发");		
		JSONArray array = new JSONArray();
		 
         for (Map<String, String> tMsg : trainerMsg) {    	 
        	 JSONObject object = new JSONObject();	
        	 
        	 for (String key : tMsg.keySet()) {
        		 if (key.equals("TMSG_DATE")) {

        			 object.put(key, format.format(tMsg.get(key)));
				}else {
					
					object.put(key, tMsg.get(key));					
				}
			}
        	   array.add(object); 
		 } 
		
         JSONObject obj = new JSONObject();
	     obj.put("data", array);

		return obj.toJSONString();
	}
	
	
	@RequestMapping("/selectReceiveMsg")
	@ResponseBody
	public String selectReceiveMsg(){
		
		List<Map<String,String>> lMaps = trainerService.selectMsg("收");
	    JSONArray array = new JSONArray();
		
        for (Map<String, String> map : lMaps) {
			JSONObject object = new JSONObject();
        	for (String key : map.keySet()) {
				
        		if (key.equals("TMSG_DATE")) {
					
        			object.put(key, format.format(map.get(key)));
				}else {
					object.put(key, map.get(key));
				}
        		 
			}
        	array.add(object);
		}
		
        JSONObject object = new JSONObject();
        object.put("data", array);
		
		return object.toJSONString();
	}
	
	
	@RequestMapping("/selectAllstu")
	@ResponseBody
	public List<Student> showAllstudent(){
		
		List<Student> list=login.showAllstu(tra.getTraUuid());
	
		return list;
	}

	
	@RequestMapping("/updateState")
	@ResponseBody
	public String updateState(String TMSG_UUID ,String TMSG_STATUS){

		if (TMSG_STATUS.equals("未查看")) {
			
			int  a = trainerService.updateState(TMSG_UUID);
			 
			if (a>0) {
				
				return "1";
			}
		}

		return "";
	}
	
	
	@RequestMapping("/updateCourse")
	@ResponseBody
	public String updateCourse(Integer xh,String set){
		
		Student student = new Student();
		student.setStuId(xh);
		student.setStuCurSub(set);
		
		int a = trainerService.updateByPrimaryKeySelective(student);
		
		if (a>0){
			
			return "1";
		}else {
			
			return "";
		}

	}
	
	
	
 }
