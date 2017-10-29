package com.great.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.megvii.cloud.http.CommonOperate;
import com.megvii.cloud.mylibrary.R.bool;

public class FacePP {

	private String phoDir;
	
	
	public boolean faceValidate() throws Exception{
		
		File dirFile = new File(phoDir);
		File[] photoFiles = dirFile.listFiles(); //获得所以照片
		for(int i = 0; i < photoFiles.length; i++){
			String path = photoFiles[i].getAbsolutePath(); //获得所需照片路径
			boolean rs = faceCheck(path);
			if(!rs){
				return false;
			}
		}
		return true;
	}
	
	private boolean faceCheck(String path) throws Exception{
		File file = new File(path); //获得照片路径
		InputStream is = new FileInputStream(file); 
		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();  //转化字节流
		byte[] by = new byte[(int) file.length()]; 
		byte[] bb = new byte[2048];
		int ch = 0;
		try {
			ch = is.read(bb);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		while (ch != -1) {
			bytestream.write(bb, 0, ch);
			ch = is.read(bb);
		}
		by = bytestream.toByteArray();   
		//face++ api 
		CommonOperate commonOperate = new CommonOperate(
				"pw8saZCyo_i41WsR00hUB7IuxOelMlY1",
				"jonTUme3Ucd3zMpgYuUv2ezDA16IfQgJ", false);
		//调用验证
		byte[] bacd = commonOperate.detectByte(by, 1, "gender,age,beauty")
				.getContent();
		String str = new String(bacd);
		System.out.println(str);
		//将结果转化为json获取信息
		JSONObject object=JSONObject.parseObject(str);
		System.out.println(object.get("error_message"));
		JSONArray faces = object.getJSONArray("faces");
		if(faces == null){
			return true; //若出现CONCURRENCY_LIMIT_EXCEEDED等错误信息，直接返回认证成功
		}
		for(Object i:faces){
			JSONObject faceObject = (JSONObject)i;
			
			System.out.println(faceObject.getJSONObject("attributes"));
			System.out.println(faceObject.getJSONObject("attributes").getJSONObject("age").get("value"));
		}
//		System.out.println(faces);
//		System.out.println(faces.size());
		if(faces.size()>0){  //人脸信息 存在则验证成功
			return true;
		}
		return false;
	}

	public String getPhoDir() {
		return phoDir;
	}

	public void setPhoDir(String phoDir) {
		this.phoDir = phoDir;
	}
	
}
