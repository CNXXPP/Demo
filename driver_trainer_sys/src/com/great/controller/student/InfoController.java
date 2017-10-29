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
 * 学员信息操作
 * 
*/
@Controller
@RequestMapping("/grj")
public class InfoController {
	
	@Autowired
	IStuInfoService stuInfoService;
	
	
	//显示学生的信息
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
	
	
	   //查询学时
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
	
		
		//查询考试
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
				
				
				//修改信息
		@RequestMapping(value="/stuInfo/updateInfo",method=RequestMethod.POST)
		@ResponseBody
		@Transactional(rollbackFor = Exception.class)
		public Map<String, Object>studentExam(HttpSession session,Student student)throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
						
			Student student2 = stuInfoService.upDateStuInfo(session,student);
							
							if(student2 != null){
								map.put("studentupdate", student2);
								map.put("message", "修改成功");
								return map;
							}
							map.put("message", "修改失败");
							return map;
							
						}
		
		  //修改密码
		 @RequestMapping(value="/stuInfo/updatePwd",method=RequestMethod.POST)
		 @ResponseBody
		 @Transactional(rollbackFor = Exception.class)
		 public Map<String, Object>updateStudentPwd(@RequestParam Map<String, String>map,HttpSession session)throws Exception{
			Map<String, Object> newMap = new HashMap<String, Object>();
			System.out.println(map.get("oldPwd")+"旧密码"+map.get("newPwd")+"新密码");				
			int num = stuInfoService.upDateStuPwd(session, map);
						if(num == 0){
							newMap.put("result", "旧密码错误");
						}else if (num == 1) {
							newMap.put("result", "修改失败");
						}else{
							newMap.put("result", "修改成功");
						}
							
							return newMap;
							
						}
}
