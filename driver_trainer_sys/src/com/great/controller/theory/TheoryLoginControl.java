package com.great.controller.theory;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.entity.StuCardTime;
import com.great.entity.Student;
import com.great.service.theory.ILoginService;
import com.great.service.theoryImp.GetCardTimeServiceImpl;
import com.great.service.theoryImp.TheLoginServiceImpl;
import com.great.util.AuthCode;



@Controller
@RequestMapping("/CZX")
public class TheoryLoginControl {
	public String code;
	@Autowired
	ILoginService LoginserviceImpl;
	
	
	@RequestMapping("/Login/theoryAuthCode")
	@ResponseBody//������������ݣ�ͼƬ��json����������)������������ת��
	//��ȡ��֤��
    public void trainerAuthCode(HttpServletResponse response, HttpSession session){
		code = AuthCode.getAuthCode();	
		
		BufferedImage image = AuthCode.getAuthImg(code);	
		
		try {
			//д���Ӧimg��ǩ�ϣ���ʾ����
			ImageIO.write(image, "JPEG", response.getOutputStream());
		
		} catch (IOException e) {	
			
			e.printStackTrace();		
			
		}
	}
	
	
	
	
	@RequestMapping("/Login/theoryLogin")
	@ResponseBody//������������ݣ�ͼƬ��json����������)������������ת��
	//��¼
	public Map<String, String> theoryLogin(String stuIdentity, String stuPwd, String inputcode, HttpSession session){
		//���õ�¼ServiceImp����,�������map��
		Map<String, String> map = new HashMap<String, String>();
		try {
			String result = LoginserviceImpl.login(stuIdentity, stuPwd, inputcode, session, code);
			map.put("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//���صõ��Ľ��
		return map;
	}
	
}
