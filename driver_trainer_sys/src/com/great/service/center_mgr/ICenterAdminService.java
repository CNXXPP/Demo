package com.great.service.center_mgr;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.great.entity.CenterAdmin;
@Component
public interface ICenterAdminService {

	public  CenterAdmin login(int admId);
	
	public CenterAdmin addCenterAdmin(CenterAdmin admin,int charNo) throws Exception;
	
	public ArrayList<CenterAdmin> selectAll() throws Exception;
	
	public int delAdminById(int adminId) throws Exception;
	
	public int resetPwd(int admId) throws Exception;
	
	public List<Map<String, String>> selectAllAdminChar() throws Exception;
	
	public boolean updateAdminInfo(Map<String, String> map) throws Exception;  //���¹���Ա��Ϣ �����Լ���ɫ
	
	public boolean updatePwd(int admId,String pwd) throws Exception;  //�����û�����
	
	public boolean updateLastLoginDate(String admUUid) throws Exception;
	
	public Map<String, String> getLastLoginDateAndChar(String admUuid) throws Exception;
}
