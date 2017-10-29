package com.great.controller.student;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.entity.SignInShow;
import com.great.entity.StuExamInfo;
import com.great.entity.Student;
import com.great.service.studentService.IStuInfoService;
/**
 * ѧԱ��Ϣ����
 * 
*/
@Controller
@RequestMapping("/grj")
public class InfoController {
	
	@Autowired
	IStuInfoService stuInfoService;
	
	
	//��ʾѧ������Ϣ
	@RequestMapping(value="/stuInfo/showInfo",method=RequestMethod.POST)
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Object>studentInfo(HttpSession session)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		Student student = stuInfoService.showinformation(session);
		
		if(student != null){
			map.put("student", student);
		}
		
		return map;
		
	}
	
	
	   //��ѯѧʱ
		@RequestMapping("/stuInfo/selectTime")
		@ResponseBody
		@Transactional(rollbackFor = Exception.class)
		public Map<String, Object>studentCardTime(HttpSession session)throws Exception{
			Map<String, Object> map1 = new HashMap<String, Object>();
			
			SignInShow show = stuInfoService.selectCardTimesByStuUuid(session);
			
			if(show != null){
				map1.put("signInShow", show);
			}
			
			return map1;
			
		}
	
		
		//��ѯ����
		@RequestMapping(value="/stuInfo/selectExam",method=RequestMethod.POST)
		@ResponseBody
		@Transactional(rollbackFor = Exception.class)
		public Map<String, Object>studentExam(HttpSession session)throws Exception{
					Map<String, Object> map = new HashMap<String, Object>();
					
					StuExamInfo examInfo = stuInfoService.selectExamByStuUuid(session);
					
					if(examInfo != null){
						map.put("examInfo", examInfo);
					}
					
					return map;
					
				}
				
				
				//�޸���Ϣ
		@RequestMapping(value="/stuInfo/updateInfo",method=RequestMethod.POST)
		@ResponseBody
		@Transactional(rollbackFor = Exception.class)
		public Map<String, Object>studentExam(HttpSession session,Student student)throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
						
			Student student2 = stuInfoService.upDateStuInfo(session,student);
							
							if(student2 != null){
								map.put("studentupdate", student2);
								map.put("message", "�޸ĳɹ�");
								return map;
							}
							map.put("message", "�޸�ʧ��");
							return map;
							
						}
		
		  //�޸�����
		 @RequestMapping(value="/stuInfo/updatePwd",method=RequestMethod.POST)
		 @ResponseBody
		 @Transactional(rollbackFor = Exception.class)
		 public Map<String, Object>updateStudentPwd(@RequestParam Map<String, String>map,HttpSession session)throws Exception{
			Map<String, Object> newMap = new HashMap<String, Object>();
			System.out.println(map.get("oldPwd")+"������"+map.get("newPwd")+"������");				
			int num = stuInfoService.upDateStuPwd(session, map);
						if(num == 0){
							newMap.put("result", "���������");
						}else if (num == 1) {
							newMap.put("result", "�޸�ʧ��");
						}else{
							newMap.put("result", "�޸ĳɹ�");
						}
							
							return newMap;
							
						}
}
