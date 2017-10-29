package com.great.service.center_mgr;

import java.util.List;
import java.util.Map;

import com.great.entity.CenterAnnouncement;

public interface ICenterAnnoService {

	public boolean addAnnouncement(CenterAnnouncement announcement);
	
	public List<Map<String, String>> getAllAnnoInfo();
	
	public boolean delAnno(String title);
	
}
