package com.great.service.schoolService.inte;

import java.util.ArrayList;
import java.util.Map;

import com.great.entity.SchAnn;
import com.great.entity.SchAnnouncement;

public interface IGetAllAnnouncement {
	
	public ArrayList<SchAnnouncement> getAllAnnouncement(SchAnnouncement announcement);
	
	public ArrayList<SchAnnouncement> selectByPrimaryKeySelective(SchAnnouncement announcement);

	public ArrayList<SchAnn> testAnn(SchAnnouncement announcement);
	
	public Map<String, Object> delAnnounce(SchAnnouncement announcement);

}
