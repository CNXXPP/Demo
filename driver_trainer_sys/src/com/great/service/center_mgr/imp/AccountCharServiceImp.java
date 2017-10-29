package com.great.service.center_mgr.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.AccountCharMapper;
import com.great.entity.AccountChar;
import com.great.service.center_mgr.IAccountCharService;


@Service
public class AccountCharServiceImp implements IAccountCharService {

	@Autowired
	private AccountCharMapper accountCharMapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int authChar(AccountChar accountChar) throws Exception{
		int result = accountCharMapper.insert(accountChar);
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delAuthChar(String admUuid) throws Exception{
		
		return accountCharMapper.delByAdmUuId(admUuid);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateCharInfo(AccountChar accountChar) throws Exception {  //更改用户的角色
		accountCharMapper.delByAdmUuId(accountChar.getAdmUuid()); //先删除在插入
		
		return accountCharMapper.insert(accountChar);
	}
}
