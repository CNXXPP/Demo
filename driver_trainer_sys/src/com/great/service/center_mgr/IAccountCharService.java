package com.great.service.center_mgr;

import com.great.entity.AccountChar;

public interface IAccountCharService {

	public int authChar(AccountChar accountChar) throws Exception; //�û���ɫ��Ȩ
	
	public int delAuthChar(String admUuid) throws Exception;
	
	public int updateCharInfo(AccountChar accountChar) throws Exception;
}
