package com.great.controller.school;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.great.entity.CenterAnnouncement;
import com.great.entity.CheckStuCardTime;
import com.great.entity.DriverSchool;
import com.great.entity.Exam;
import com.great.entity.ExamRegister;
import com.great.entity.MsgInfo;
import com.great.entity.Notice;
import com.great.entity.SchAnn;
import com.great.entity.SchAnnouncement;
import com.great.entity.SchoolComment;
import com.great.entity.SchoolMsg;
import com.great.entity.SchoolStu;
import com.great.entity.StuCardTime;
import com.great.entity.StuMsg;
import com.great.entity.Student;
import com.great.entity.Subject;
import com.great.entity.Trainer;
import com.great.entity.TrainerStu;
import com.great.entity.TrainerTable;
import com.great.service.schoolService.imp.GetAllAnnouncementImpl;
import com.great.service.schoolService.imp.GetAllStudentImpl;
import com.great.service.schoolService.imp.GetAllTrainerImpl;
import com.great.service.schoolService.imp.GetDiscussImpl;
import com.great.service.schoolService.imp.GetMsgsImpl;
import com.great.service.schoolService.imp.NewAnnounceImpl;
import com.great.service.schoolService.imp.SchMsgImpl;
import com.great.service.schoolService.imp.SchoolLoginImp;
import com.great.service.schoolService.imp.StuExamRegistImpl;
import com.great.service.schoolService.imp.StuMsgImpl;
import com.great.service.schoolService.imp.StudentRegistImpl;
import com.great.service.schoolService.imp.TrainerRegistImpl;
import com.great.util.AuthCode;

@Controller
@RequestMapping("/jjn")
public class SchoolController {
	/*
	 * ����� ��У����
	 */
	private String code;
	@Autowired
	SchoolLoginImp schoolLoginImp;
	@Autowired
	StudentRegistImpl regist;
	@Autowired
	StuExamRegistImpl StuExamRegistImpl;
	@Autowired
	GetAllStudentImpl allStudentImpl;
	@Autowired
	TrainerRegistImpl trainerRegistImpl;
	@Autowired
	GetAllTrainerImpl allTrainerImpl;
	@Autowired
	NewAnnounceImpl newAnnouncement;
	@Autowired
	GetAllAnnouncementImpl announcementImpl;
	// ��֤��
	@RequestMapping("/schoolAuthCode")
	@ResponseBody
	public void schoolAuthCode(HttpServletResponse response, HttpSession session) {
		System.out.println(1111);
		code = AuthCode.getAuthCode();	
		System.out.println(code);
		BufferedImage image = AuthCode.getAuthImg(code);
		try {
			// д���Ӧimg��ǩ�ϣ���ʾ����
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	@RequestMapping("/schoolLogin")
	@ResponseBody
	public Map<String, Object> schoolLogin(DriverSchool school,
			HttpSession session, String authCode) {// ��ȡ�˹������һ�ι���

		Map<String, Object> map = new HashMap<>();
		map = schoolLoginImp.login(school, code, authCode);
		if (map.get("res").equals("check")) {
			session.setAttribute("school", map.get("school"));
		}

		return map;

	}

	// ********ѧԱ����*******************

	@RequestMapping("/studentRegist")
	@ResponseBody
	public ModelAndView studentRegist(Student student, SchoolStu schoolStu,StuCardTime cardTime ,
			HttpSession session) {
		System.out.println(student);
		Date date = new Date();
		student.setCreateDate(date);
		UUID uuid = UUID.randomUUID();
		student.setStuId(1);
		student.setStuCurSub("��Ŀһ");
		student.setSubNo(1);
		student.setStuUuid(uuid.toString());
		cardTime.setStuUuid(uuid.toString());
		int res = regist.regist(student, schoolStu);
		if (res > 0) {
			regist.setStuCardTIme(cardTime);
			return new ModelAndView("schoolSystem/CheckStudent");
		} else {
			System.out.println("2222");
			return null;
		}

	}

	// *********��ȡ����ѧԱ��Ϣ(�鿴ѧԱ��Ϣ)*******************
	

	@RequestMapping("/getStudent")
	@ResponseBody
	public String getStudent(HttpSession session,
			DriverSchool driverSchool) {

		ArrayList<Student> stuList = allStudentImpl.getAllStudent(driverSchool);
		JSONArray array = JSONArray.fromObject(stuList);
		JSONObject json = new JSONObject();
		json.put("data", array);
		return json.toJSONString();

	}

	// **********����ע��**********
	

	@RequestMapping("/trainerRegist")
	@ResponseBody
	public Map<String, Object> trainerRegist(Trainer trainer) {
		UUID uuid = UUID.randomUUID();
		trainer.setTraUuid(uuid.toString());
		System.out.println(159);
		Map<String, Object> map = new HashMap<>();
		map = trainerRegistImpl.trainerRegist(trainer);
		if (!map.isEmpty()) {
			return map;
		}

		return null;

	}

	// **********��ȡ������Ϣ**********


	@RequestMapping("/getTrainers")
	@ResponseBody
	public Map<String, Object> trainerRegistd(Trainer trainer) {

		ArrayList<Trainer> traList = allTrainerImpl.getAllTrainer(trainer);
		Map<String, Object> map = new HashMap<>();
		map.put("traList", traList);
		return map;

	}

	// **********�����¹���**********
	

	@RequestMapping("/newAnnounce")
	@ResponseBody
	public Map<String, Object> newAnnounce(SchAnnouncement schAnnouncement) {
		System.out.println(11);
		UUID uuid = UUID.randomUUID();
		schAnnouncement.setAnUuid(uuid.toString());
		Date date = new Date();
		schAnnouncement.setAnDate(date);
		Map<String, Object> map = new HashMap<>();
		map = newAnnouncement.newAnnounce(schAnnouncement);
		return map;

	}

	// **********�鿴���棨ҳ��ajax����**********
	

	@RequestMapping("/getAnnounce")
	@ResponseBody
	public Map<String, Object> getAllAnnouncement(SchAnnouncement announcement) {
		System.out.println(11);
		ArrayList<SchAnnouncement> annList = announcementImpl
				.getAllAnnouncement(announcement);
		Map<String, Object> map = new HashMap<>();
		map.put("annList", annList);
		return map;

	}

	// **********�������ţ���ȡѧ�����������ϣ�**********
	@RequestMapping("/setTrainers")
	@ResponseBody
	public String setTrainers(Trainer trainer, DriverSchool driverSchool) {
		System.out.println(11);
		ArrayList<Trainer> traList = allTrainerImpl.getAllTrainer(trainer);
		ArrayList<Student> stuList = allStudentImpl
				.getAllUnsetTrainerStudent(driverSchool);
		// Map<String, Object> map = new HashMap<>();
		// map.put("traList", traList);
		// map.put("stuList", stuList);
		JSONArray array = JSONArray.fromObject(stuList);
		JSONObject json = new JSONObject();
		json.put("data", array);
		return json.toJSONString();

	}

	// **********��ȡѧ����Ϣ��ѡ���ռ��ˣ�**********
	@RequestMapping("/getList")
	@ResponseBody
	public Map<String, Object> getList(DriverSchool driverSchool) {
		System.out.println(11);
		ArrayList<Student> stuList = allStudentImpl.getAllStudent(driverSchool);
		Map<String, Object> map = new HashMap<>();
		map.put("stuList", stuList);
		return map;

	}

	// **********�����ż�����У���ţ�**********
	@Autowired
	SchMsgImpl impl;
	@Autowired
	StuMsgImpl stuMsgImpl;

	@RequestMapping("/sendMail")
	@ResponseBody
	public Map<String, Object> sendMail(SchoolMsg msg) {
		// �����У��Ϣ������
		UUID uuid = UUID.randomUUID();
		msg.setScmsgUuid(uuid.toString());
		Date date = new Date();
		msg.setScmsgDate(date);
		msg.setScmsgStatus("�ѷ���");
		msg.setScmsgType("����");
		msg.setScmsgGroup("ѧ��");
		// ����ѧ����Ϣ������
		StuMsg stuMsg = new StuMsg();
		stuMsg.setSmsgContext(msg.getScmsgContext());
		stuMsg.setSmsgDate(date);
		stuMsg.setSmsgGroup("ѧ��");
		stuMsg.setSmsgIdentity("��У");
		stuMsg.setSmsgStatus("δ��");
		stuMsg.setSmsgTitle(msg.getScmsgTitle());
		stuMsg.setSmsgUuid(uuid.toString());
		stuMsg.setSmsgType("����");
		stuMsg.setStuUuid(msg.getScmsgIdentity());

		stuMsgImpl.newStuMsg(stuMsg);
		Map<String, Object> map = new HashMap<>();
		map = impl.newMsg(msg);
		return map;

	}

	// **********��ȡ�ż���Ϣ���鿴�ż�ҳ��ajax��**********
	@Autowired
	GetMsgsImpl msgsImpl;

	@RequestMapping("/getMails")
	@ResponseBody
	public String getMails(SchoolMsg msg) {
		System.out.println("��ȡ�ż�");
		ArrayList<MsgInfo> msgList = msgsImpl.getSchoolMsgs(msg);
		JSONArray array = JSONArray.fromObject(msgList);
		JSONObject send = new JSONObject();
		send.put("data", array);
		return send.toJSONString();

	}

	// **********��ȡ���ۣ��鿴�ż�ҳ��ajax��**********
	@Autowired
	GetDiscussImpl discussImpl;

	@RequestMapping("/getDiscuss")
	@ResponseBody
	public Map<String, Object> getDiscuss(DriverSchool driverSchool) {
		System.out.println("��ȡ����");
		ArrayList<SchoolComment> disList = discussImpl.getDiscuss();
		Map<String, Object> map = new HashMap<>();
		map.put("disList", disList);
		return map;

	}

	/*
	 * dataTable
	 * 
	 * *
	 */
	// **********dataTable��������**********

	@RequestMapping("/test")
	@ResponseBody
	public String getStuAnnouncement(HttpSession session,
			SchAnnouncement announcement) throws Exception {

		ArrayList<SchAnn> showNotices = announcementImpl.testAnn(announcement);
		JSONArray array = JSONArray.fromObject(showNotices);
		JSONObject send = new JSONObject();
		send.put("data", array);
		return send.toJSONString();
	}

	// **********dataTable�鿴����**********

	@RequestMapping("/getTrainerTable")
	@ResponseBody
	public String getTrainerTable(HttpSession session, Trainer trainer)
			throws Exception {
		System.out.println(trainer.getSchUuid());

		ArrayList<TrainerTable> traList = allTrainerImpl.getAllTrainerT(trainer);
		JSONArray array = JSONArray.fromObject(traList);
		JSONObject json = new JSONObject();
		json.put("data", array);
		return json.toJSONString();
	}

	// **********��ѧԱ���Ž���**********
	@RequestMapping("/giveTrainer")
	@ResponseBody
	public Map<String, Object> trainerAnPai(TrainerStu trainerStu)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		int res = regist.setTrainer(trainerStu);
		boolean result = false;
		if (res > 0) {
			result = true;
			map.put("result", result);
		}
		return map;
	}

	// **********�õ�����ѧԱ��ѧʱ**********
	@RequestMapping("/getStuTime")
	@ResponseBody
	public String getStuTime(DriverSchool school) throws Exception {

		ArrayList<CheckStuCardTime> timeList = allStudentImpl.getStuTime(school);
		JSONArray array = JSONArray.fromObject(timeList);
		JSONObject json = new JSONObject();
		json.put("data", array);
		return json.toJSONString();
	}

	// **********�õ�ѧʱ������ѧԱѧʱ**********
	@RequestMapping("/getS1FullTimeStudent")
	@ResponseBody
	public String getS1FullTimeStudent(DriverSchool school , Subject subject) throws Exception {
	
		ArrayList<CheckStuCardTime> timeList = allStudentImpl.getStuTime(school);
		ArrayList<ExamRegister> registedStuList = allStudentImpl.getRegistedStudent();
		Subject nowSubject = StuExamRegistImpl.getSubTime(subject);
		System.out.println("//////////"+nowSubject.getSubNeedTime());
		System.out.println(timeList.size()+"///////////////");
 	
			for (int i = 0; i < timeList.size(); i++) {
				System.out.println(timeList.get(i).getStuUuid()+"*****"+timeList.get(i).getCtSub1()+"**"+nowSubject.getSubNeedTime()); 	
				
				try {
					if (timeList.get(i).getCtSub1() < nowSubject.getSubNeedTime() || timeList.get(i).getCtSub2() != 0) {
						
						System.out.println("****************"+timeList.get(i).getCtSub1());
						System.out.println();
						timeList.remove(i);	
						System.out.println(i+"///***");
						--i;
			
					}
					else {
						if(i>=0){
						for (int j = 0; j < registedStuList.size(); j++) {
							if(registedStuList.get(j).getStuUuid().equals(timeList.get(i).getStuUuid())){
							
								timeList.remove(i);	
								System.out.println(i+"///********");
								--i;
							}
					
					}
						}					
}
				} catch (Exception e) {
					// TODO Auto-generated catch block			
				}		
		}

			
     	

		JSONArray array = JSONArray.fromObject(timeList);
		JSONObject json = new JSONObject();
		json.put("data", array);
		return json.toJSONString();
	}
	
	// **********�õ�ѧʱ������ѧԱѧʱ**********
		@RequestMapping("/getS2FullTimeStudent")
		@ResponseBody
		public String getS2FullTimeStudent(DriverSchool school , Subject subject) throws Exception {
			System.out.println(11111);
			ArrayList<CheckStuCardTime> timeList = allStudentImpl.getStuTime(school);
			ArrayList<ExamRegister> registedStuList = allStudentImpl.getRegistedStudent();
			Subject nowSubject = StuExamRegistImpl.getSubTime(subject);
			for (int i = 0; i < timeList.size(); i++) {
				System.out.println(timeList.get(i).getStuUuid()+"*****"+timeList.get(i).getCtSub1()+"**"+nowSubject.getSubNeedTime()); 	
				
				try {
					if (timeList.get(i).getCtSub2() < nowSubject.getSubNeedTime() || timeList.get(i).getCtSub3() != 0) {
						
						System.out.println("****************"+timeList.get(i).getCtSub1());
						System.out.println();
						timeList.remove(i);	
						System.out.println(i+"///***");
						--i;
			
					}
					else {
						if(i>=0){
						for (int j = 0; j < registedStuList.size(); j++) {
							if(registedStuList.get(j).getStuUuid().equals(timeList.get(i).getStuUuid())){
							
								timeList.remove(i);	
								System.out.println(i+"///********");
								--i;
							}
					
					}
						}					
}
				} catch (Exception e) {
					// TODO Auto-generated catch block			
				}		
		}


			JSONArray array = JSONArray.fromObject(timeList);
			JSONObject json = new JSONObject();
			json.put("data", array);
			return json.toJSONString();
		}
		// **********�õ�ѧʱ������ѧԱѧʱ**********
		@RequestMapping("/getS3FullTimeStudent")
		@ResponseBody
		public String getS3FullTimeStudent(DriverSchool school , Subject subject) throws Exception {
			System.out.println(11111);
			ArrayList<CheckStuCardTime> timeList = allStudentImpl.getStuTime(school);
			ArrayList<ExamRegister> registedStuList = allStudentImpl.getRegistedStudent();
			Subject nowSubject = StuExamRegistImpl.getSubTime(subject);
			for (int i = 0; i < timeList.size(); i++) {
				System.out.println(timeList.get(i).getStuUuid()+"*****"+timeList.get(i).getCtSub1()+"**"+nowSubject.getSubNeedTime()); 	
				
				try {
					if (timeList.get(i).getCtSub3() < nowSubject.getSubNeedTime() || timeList.get(i).getCtSub4() != 0) {
						
						System.out.println("****************"+timeList.get(i).getCtSub1());
						System.out.println();
						timeList.remove(i);	
						System.out.println(i+"///***");
						--i;
			
					}
					else {
						if(i>=0){
						for (int j = 0; j < registedStuList.size(); j++) {
							if(registedStuList.get(j).getStuUuid().equals(timeList.get(i).getStuUuid())){
							
								timeList.remove(i);	
								System.out.println(i+"///********");
								--i;
							}
					
					}
						}					
}
				} catch (Exception e) {
					// TODO Auto-generated catch block			
				}		
		}

	     	

			JSONArray array = JSONArray.fromObject(timeList);
			JSONObject json = new JSONObject();
			json.put("data", array);
			return json.toJSONString();
		}
		// **********�õ�ѧʱ������ѧԱѧʱ**********
		@RequestMapping("/getS4FullTimeStudent")
		@ResponseBody
		public String getS4FullTimeStudent(DriverSchool school , Subject subject) throws Exception {
			System.out.println(11111);
			ArrayList<CheckStuCardTime> timeList = allStudentImpl.getStuTime(school);
			ArrayList<ExamRegister> registedStuList = allStudentImpl.getRegistedStudent();
			Subject nowSubject = StuExamRegistImpl.getSubTime(subject);
			for (int i = 0; i < timeList.size(); i++) {
				System.out.println(timeList.get(i).getStuUuid()+"*****"+timeList.get(i).getCtSub1()+"**"+nowSubject.getSubNeedTime()); 	
				
				try {
					if (timeList.get(i).getCtSub4() < nowSubject.getSubNeedTime()) {
						
						System.out.println("****************"+timeList.get(i).getCtSub1());
						System.out.println();
						timeList.remove(i);	
						System.out.println(i+"///***");
						--i;
			
					}
					else {
						if(i>=0){
						for (int j = 0; j < registedStuList.size(); j++) {
							if(registedStuList.get(j).getStuUuid().equals(timeList.get(i).getStuUuid())){
							
								timeList.remove(i);	
								System.out.println(i+"///********");
								--i;
							}
					
					}
						}					
}
				} catch (Exception e) {
					// TODO Auto-generated catch block			
				}		
		}

	     	

			JSONArray array = JSONArray.fromObject(timeList);
			JSONObject json = new JSONObject();
			json.put("data", array);
			return json.toJSONString();
		}


	

	// **********ѧԱ���Ա���**********
	@RequestMapping("/examRegist")
	@ResponseBody
	public Map<String, Object> examRegist(ExamRegister register, Exam exam,HttpServletRequest request)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		boolean result = false;
		ArrayList<Exam> examList = StuExamRegistImpl.checkFirstExam(exam);

		if (examList.isEmpty()) {
			result = false;
		} else {
			register.setExamUuid(examList.get(0).getExamUuid());
			UUID uuid = UUID.randomUUID();
			register.setRegExamUuid(uuid.toString());
			String pathString = request.getServletContext().getRealPath("jsp/examination/examPho");
			pathString = pathString + uuid;
			register.setExamPhotoPath(pathString);
			int res = StuExamRegistImpl.stuExamRegist(register);
			if(res>0){
				result = true;
				StuExamRegistImpl.updateExamCurNum(register);
			}else{
				result = false;
			}
		}

		map.put("result", result);

		return map;
	}
	
	// **********ɾ���ʼ�**********
	@RequestMapping("/delMail")
	@ResponseBody
	public Map<String, Object> delMail(SchoolMsg schoolMsg)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		int res = msgsImpl.deleteByPrimaryKey(schoolMsg.getScmsgUuid());
		boolean result = false;
		if (res > 0) {
			result = true;
			map.put("result", result);
		}
		return map;
	}
	
	// **********ɾ������**********
		@RequestMapping("/delAnnounce")
		@ResponseBody
		public Map<String, Object> delAnnounce(SchAnnouncement announcement)
				throws Exception {
			Map<String, Object> map = new HashMap<>();
			map = announcementImpl.delAnnounce(announcement);
			return map;
		}
	
	
	// **********�ı��ʼ�״̬**********
	@RequestMapping("/changeMailState")
	@ResponseBody
	public Map<String, Object> changeMailState(SchoolMsg schoolMsg)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		if(schoolMsg.getScmsgStatus().equals("δ�鿴")){
			schoolMsg.setScmsgStatus("�Ѳ鿴");
		}
		int res = msgsImpl.changeMailState(schoolMsg);
		boolean result = false;
		if (res > 0) {
			result = true;
			map.put("result", result);
		}
		return map;
	}
	
}
