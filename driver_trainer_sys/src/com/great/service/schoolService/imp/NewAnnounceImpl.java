package com.great.service.schoolService.imp;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchAnnouncementMapper;
import com.great.entity.SchAnnouncement;
import com.great.service.schoolService.inte.INewAnnounce;
@Service
public class NewAnnounceImpl implements INewAnnounce{
	@Autowired
	SchAnnouncementMapper announcementMapper;

	@Override
	public Map<String, Object> newAnnounce(SchAnnouncement announcement) {
		// TODO Auto-generated method stub
		int res=announcementMapper.insert(announcement);
		Map<String, Object> map = new HashMap<>();
		if(res>0){
			map.put("res", res);
		}
		return null;
	}

}
