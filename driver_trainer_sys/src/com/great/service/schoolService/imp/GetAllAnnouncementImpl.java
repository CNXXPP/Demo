package com.great.service.schoolService.imp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;




import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchAnnouncementMapper;
import com.great.entity.SchAnn;
import com.great.entity.SchAnnouncement;
import com.great.service.schoolService.inte.IGetAllAnnouncement;
import com.great.service.schoolService.inte.ISchoolLogin;
@Service
public class GetAllAnnouncementImpl implements IGetAllAnnouncement{
	@Autowired
	SchAnnouncementMapper announcementMapper;

	@Override
	public ArrayList<SchAnnouncement> getAllAnnouncement(SchAnnouncement announcement) {
		// TODO Auto-generated method stub
		ArrayList<SchAnnouncement> annList=announcementMapper.getAllAnnouncement(announcement);
		return annList;
	}
	
	
	@Override
	public ArrayList<SchAnnouncement> selectByPrimaryKeySelective(
			SchAnnouncement announcement) {
		// TODO Auto-generated method stub
		ArrayList<SchAnnouncement> searAnnList=announcementMapper.selectByPrimaryKeySelective(announcement);
		return searAnnList;
	}
	
	@Override
	public ArrayList<SchAnn> testAnn(SchAnnouncement announcement) {
		// TODO Auto-generated method stub
		ArrayList<SchAnnouncement> annList=announcementMapper.getAllAnnouncement(announcement);
		ArrayList<SchAnn> aList=new ArrayList<SchAnn>();
		for (int i = 0; i < annList.size(); i++) {
			System.out.println( annList.get(i).getAnDate()+"***********");
			String d=new SimpleDateFormat("yyyy-mm-dd hh:MM:ss").format( annList.get(i).getAnDate());
			System.out.println(d+"***********");
			SchAnn ann=new SchAnn(annList.get(i).getAnUuid(),annList.get(i).getAnTitle(),"±¾Ð£",annList.get(i).getAnContext(),d);
			System.out.println(ann.getAnDate()+"***********");
			aList.add(ann);
		}
		return aList;
	}


	@Override
	public Map<String, Object> delAnnounce(SchAnnouncement announcement) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		int res = announcementMapper.deleteByPrimaryKey(announcement.getAnUuid());
		boolean result = false;
		if (res > 0) {
			result = true;
			map.put("result", result);
		}
		
		return map;
	}

}
