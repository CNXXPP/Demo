package com.great.service.center_mgr.imp;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.AccountCharMapper;
import com.great.dao.CenterAdminMapper;
import com.great.entity.AccountChar;
import com.great.entity.CenterAdmin;
import com.great.service.center_mgr.ICenterAdminService;

@Service
public class CenterAdminServiceImp implements ICenterAdminService {

	@Autowired
	private CenterAdminMapper centerAdminMapper;
	@Autowired
	private AccountCharServiceImp accountCharServiceImp;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public CenterAdmin login(int admId) { // 运营登录

		return centerAdminMapper.selectById(admId);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public CenterAdmin addCenterAdmin(CenterAdmin admin, int charNo) throws Exception { // 增加管理员
		admin.setAdmUuid(UUID.randomUUID().toString());
		int result = centerAdminMapper.insert(admin);
		admin = centerAdminMapper.selectByPrimaryKey(admin.getAdmUuid());
		AccountChar accountChar = new AccountChar();
		accountChar.setAdmUuid(admin.getAdmUuid());
		accountChar.setCharNo(charNo);
		int result2 = accountCharServiceImp.authChar(accountChar);
		return admin;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public ArrayList<CenterAdmin> selectAll() throws Exception{

		return centerAdminMapper.selectAllAdmin();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delAdminById(int admId) throws Exception{
		CenterAdmin centerAdmin = centerAdminMapper.selectById(admId);//查找admin
		accountCharServiceImp.delAuthChar(centerAdmin.getAdmUuid());//通过adminUuid删除其角色关系
		int res = centerAdminMapper.deleteByPrimaryKey(centerAdmin.getAdmUuid());
		return res;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int resetPwd(int admId) throws Exception{  //重置密码123456
		CenterAdmin admin  = centerAdminMapper.selectById(admId);
		CenterAdmin newAdmin = new CenterAdmin();
		newAdmin.setAdmUuid(admin.getAdmUuid());
		newAdmin.setAdmPwd("123456");
		int res = centerAdminMapper.updateByPrimaryKeySelective(newAdmin);
		return res;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Map<String, String>> selectAllAdminChar() throws Exception{
		centerAdminMapper.selectAllAdmChar();
		
		return centerAdminMapper.selectAllAdmChar();
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updateAdminInfo(Map<String, String> map) throws Exception{  //map中获取需修改的值
		int admId = Integer.parseInt(map.get("admId"));
		String admName = map.get("admName");
		int charNo = Integer.parseInt(map.get("charNo"));
		CenterAdmin centerAdmin = centerAdminMapper.selectById(admId);
		CenterAdmin newAdmin = new CenterAdmin(); //修改后对象
		newAdmin.setAdmUuid(centerAdmin.getAdmUuid());
		newAdmin.setAdmName(admName);
		int res1 = centerAdminMapper.updateByPrimaryKeySelective(newAdmin);  //更改admin值
		if(charNo!=0){
			AccountChar newChar = new AccountChar();
			newChar.setAdmUuid(centerAdmin.getAdmUuid());
			newChar.setCharNo(charNo);
			int res2 = accountCharServiceImp.updateCharInfo(newChar);
			if(res1 > 0 && res2 > 0){
				return true;
			}
		}
		if(res1 > 0){
			return true;
		}
		
		return false;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) //更改密码
	public boolean updatePwd(int admId, String pwd) throws Exception {
		CenterAdmin admin = centerAdminMapper.selectById(admId);
		CenterAdmin updateAdmin = new CenterAdmin();
		updateAdmin.setAdmUuid(admin.getAdmUuid());
		updateAdmin.setAdmPwd(pwd);
		System.out.println(updateAdmin);
		int res = centerAdminMapper.updateByPrimaryKeySelective(updateAdmin);
		
		if(res > 0){
			return true;
		}
		return false;
	}
	@Override
	@Transactional(rollbackFor = Exception.class) 
	public boolean updateLastLoginDate(String admUuid) {
		CenterAdmin admin = new CenterAdmin();
		admin.setLastLoginDate(new Timestamp(new Date().getTime()));
		System.out.println(new Timestamp(new Date().getTime()));
		admin.setAdmUuid(admUuid);
		int res = centerAdminMapper.updateByPrimaryKeySelective(admin);
		if(res > 0){
			return true;
		}
		return false;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) 
	public Map<String, String> getLastLoginDateAndChar(String admUuid)
			throws Exception {
		System.out.println(centerAdminMapper.selectAdminInfo(admUuid));
		return centerAdminMapper.selectAdminInfo(admUuid);
	}
}
