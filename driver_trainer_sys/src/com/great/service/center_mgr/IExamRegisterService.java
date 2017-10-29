package com.great.service.center_mgr;

import java.util.Map;

public interface IExamRegisterService {

	public boolean delExamRegister(Map<String, Object> map,String stuIdentity) throws Exception;
	
	public String getPhotoPath(Map<String, Object> map,String stuIdentity,int index) throws Exception; //三张照片，index指第几张图片
}
