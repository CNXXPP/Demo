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
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	//获取验证码
    public void trainerAuthCode(HttpServletResponse response, HttpSession session){
		code = AuthCode.getAuthCode();	
		
		BufferedImage image = AuthCode.getAuthImg(code);	
		
		try {
			//写入对应img标签上，显示出来
			ImageIO.write(image, "JPEG", response.getOutputStream());
		
		} catch (IOException e) {	
			
			e.printStackTrace();		
			
		}
	}
	
	
	
	
	@RequestMapping("/Login/theoryLogin")
	@ResponseBody//这个方法是数据（图片、json、其他数据)不是用来做跳转的
	//登录
	public Map<String, String> theoryLogin(String stuIdentity, String stuPwd, String inputcode, HttpSession session){
		//调用登录ServiceImp方法,结果存入map中
		Map<String, String> map = new HashMap<String, String>();
		try {
			String result = LoginserviceImpl.login(stuIdentity, stuPwd, inputcode, session, code);
			map.put("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回得到的结果
		return map;
	}
	
}
