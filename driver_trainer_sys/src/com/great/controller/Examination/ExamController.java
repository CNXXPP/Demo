package com.great.controller.Examination;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;

import org.bytedeco.javacv.CanvasFrame;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.entity.CenterAdmin;
import com.great.entity.CenterAnnouncement;
import com.great.entity.StuScore;
import com.great.entity.Student;
import com.great.service.examination.IExaminationService;
import com.great.util.AuthCode;
import com.great.util.CameraJavaCV;
import com.great.util.GetExamPhoto;

@Controller
@RequestMapping("/xp")
public class ExamController {

	Thread thread = new Thread(CameraJavaCV.cameraJavaCV);
	@Autowired
	private IExaminationService examinationService;

	@RequestMapping(value = "/examination/authCode")
	@ResponseBody
	public void centerAuthCode(HttpServletResponse response, HttpSession session)
			throws Exception {
		String code = AuthCode.getAuthCode();

		BufferedImage image = AuthCode.getAuthImg(code);
		session.setAttribute("examValideCode", code);
		try {
			// д���Ӧimg��ǩ�ϣ���ʾ����
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/examination/login")
	@ResponseBody
	public Map<String, Object> login(Student student, String inputCode,
			HttpSession session) throws Exception {
		String res = null;
		if (inputCode.equalsIgnoreCase((String) session
				.getAttribute("examValideCode"))) {
			res = examinationService.login(student, session);
		} else {
			res = "wrongValideCode";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", res);
		return map;
	}

	@RequestMapping(value = "/examination/calcScore")
	@ResponseBody
	public Map<String, Object> getRamdonQuestion(String scScore, String curSub,
			String startTime, String endTime, HttpSession session) throws Exception{

		boolean res = examinationService.calcScore(scScore, curSub, startTime, endTime,
				session);
		if(!res){  //ĳ����Ƭ��֤ʧ�ܣ����سɼ�Ϊ-1
			scScore = "-1";
		}
		CameraJavaCV.flag = false;  //�����߳�ֹͣ
		
		CameraJavaCV.grabber.stop();
		
//		CameraJavaCV.canvas.setVisible(false);
		CameraJavaCV.canvas.dispose();
		
//		thread.interrupt();
		Map<String, Object> map = new HashMap<>();
		map.put("result", scScore);
		return map;
	}
	
	@RequestMapping(value = "/examination/callCamera")
	@ResponseBody
	public Map<String, Object> callCamera(HttpServletRequest request,HttpSession session) throws Exception{
		Student student = (Student) session.getAttribute("examStudent");
		
		CameraJavaCV.savePath = (String) session.getAttribute("phoPath");
		
		if(CameraJavaCV.flag){
			thread.start();
		}else{
			thread = new Thread(CameraJavaCV.cameraJavaCV);
			CameraJavaCV.flag = true;
			thread.start();
		}
		
//		CameraJavaCV.cameraJavaCV.takePho();
		
		
		
		Map<String, Object> map = new HashMap<>();
		
		return map;
	}

}
