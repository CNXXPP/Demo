package com.great.service.center_mgr.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.CenterAdminMapper;
import com.great.dao.CenterAnnouncementMapper;
import com.great.entity.CenterAnnouncement;
import com.great.service.center_mgr.ICenterAnnoService;
@Service
public class CenterAnnoServiceImp implements ICenterAnnoService{

	@Autowired
	private CenterAnnouncementMapper announcementMapper;
	
	@Override
	public boolean addAnnouncement(CenterAnnouncement announcement) {
	
		int res = announcementMapper.insert(announcement);
		if(res > 0){
			return true;
		}
		return false;
	}
	
	@Override
	public List<Map<String, String>> getAllAnnoInfo() { //获取所有公告及公告人
		List<Map<String, String>> annoList = announcementMapper.getAnnoInfo();
		return annoList;
	}
	@Override
	public boolean delAnno(String title) {
		int res = announcementMapper.delAnnoByTitle(title);
		if(res > 0){
			return true;
		}
		return false;
	}
}
