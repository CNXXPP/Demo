package com.great.service.schoolService.inte;

import java.util.ArrayList;

import com.great.entity.MsgInfo;
import com.great.entity.SchoolMsg;

public interface IGetMsgs {
	public ArrayList<MsgInfo> getSchoolMsgs(SchoolMsg msg);
	
	public int deleteByPrimaryKey(String scmsgUuid);
	
	public int changeMailState(SchoolMsg msg);


}
