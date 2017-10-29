package com.great.service.studentService.imp;



import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import oracle.sql.DATE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.CenterAnnouncementMapper;
import com.great.dao.SchAnnouncementMapper;
import com.great.dao.SchoolStuMapper;
import com.great.dao.StuCardTimeMapper;
import com.great.dao.StudentMapper;
import com.great.dao.TrainerMapper;
import com.great.dao.TrainerStuMapper;
import com.great.entity.CenterAnnouncement;
import com.great.entity.Notice;
import com.great.entity.SchAnnouncement;
import com.great.entity.SchoolStu;
import com.great.entity.StuCardTime;
import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.entity.TrainerStu;
import com.great.service.studentService.IStudentService;


/**
 * 学生操作服务层具体实现类
 * 
 * */


@Service
public class StudentServiceImp implements IStudentService{
   

	@Autowired
	CenterAnnouncementMapper centerAnnouncementMapper;
	
	@Autowired
	StudentMapper studentMapper;
	
	@Autowired
	SchAnnouncementMapper schAnnouncementMapper;
	
	@Autowired
	TrainerMapper trainerMapper;
	
	@Autowired
	TrainerStuMapper trainerStuMapper;
	
	@Autowired
	SchoolStuMapper schoolStuMapper;
	
	@Autowired
	StuCardTimeMapper stuCardTimeMapper;
	
	@Override
	public CenterAnnouncement getCenterAnnouncement() {
		//获取运管最近一次公告
		// TODO Auto-generated method stub
		CenterAnnouncement centerAnnouncement=centerAnnouncementMapper.getAnnouncement();
		return centerAnnouncement;
	}

	@Override
	public String studentLogin(Student student , HttpSession session) {
		// TODO Auto-generated method stub
		//学生登陆判断
		Student student1=studentMapper.checkStuId(student);//通过学生编号查询是否有这个学生
		if(student1==null){
			return "不存在该用户";
		}
		Student student2=studentMapper.studentLogin(student);
		if(student2!=null){
			
			session.setAttribute("stuUuid", student2.getStuUuid());//登陆成功将学生的id存到session中去
			
		    return "success";
		}
	      return "faild";
	}

	@Override
	public SchAnnouncement getSchAnnouncement(HttpSession session) {
		// TODO Auto-generated method stub
		//驾校最近一次公告
		String stuId =(String) session.getAttribute("stuUuid");
		
		if(stuId != null){
		SchAnnouncement schAnnouncement = schAnnouncementMapper.getAnnouncementByStuId(stuId);
		
		return schAnnouncement;
		}
		return null;
	}

	@Override
	public ArrayList<Notice> getNotices(String stuUuid) {
		// TODO Auto-generated method stub
		
		ArrayList<Notice> showNotices=new ArrayList<Notice>();
		
		ArrayList<String>changeList=new ArrayList<String>();
		
		ArrayList<CenterAnnouncement> centerAnnouncements = centerAnnouncementMapper.getAllAnnouncement();
	    if(centerAnnouncements != null){
	    	for (int i = 0; i < centerAnnouncements.size(); i++) {
				Notice notice=new Notice(centerAnnouncements.get(i).getAdmUuid(),
						centerAnnouncements.get(i).getCaTitle(),
						centerAnnouncements.get(i).getCaContext(),
						"运管",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( centerAnnouncements.get(i).getCaDate()));
				changeList.add( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( centerAnnouncements.get(i).getCaDate()));
				showNotices.add(notice);
			}
	    }
		
		ArrayList<SchAnnouncement> schAnnouncements = schAnnouncementMapper.getAllAnnouncements(stuUuid);
 		
		if(schAnnouncements != null){
			for (int i = 0; i < schAnnouncements.size(); i++) {
				Notice notice=new Notice(schAnnouncements.get(i).getAnUuid(),
						schAnnouncements.get(i).getAnTitle(),
						schAnnouncements.get(i).getAnContext(),
						"驾校", 
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( schAnnouncements.get(i).getAnDate())
						);
				changeList.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( schAnnouncements.get(i).getAnDate()));
				showNotices.add(notice);
			}
		}
		
		
		Collections.sort(changeList);
		Collections.reverse(changeList);
//		for (int i = 0; i < changeList.size(); i++) {
//			System.err.println(changeList.get(i)+"**********************************");
//		}
		ArrayList<Notice>finalList=new ArrayList<Notice>();
		for (int i = 0; i < changeList.size(); i++) {
			for (int j = 0; j < showNotices.size(); j++) {
				if(changeList.get(i).equals((showNotices.get(j).getReleaseTime()))){
					finalList.add(showNotices.get(j));
					showNotices.remove(j);
				}
			}
		}

		return finalList;
	}

	@Override
	public void StudentRegister(Map<String, String> map,HttpSession session) {
		// TODO Auto-generated method stub
		//学员注册
		String schUuid = (String) session.getAttribute("schUuid");
		
		String traUuid =  map.get("trainer");
		
		String stuUuid = UUID.randomUUID().toString();
 		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        Date date = null; 
      
        try {  
            // Fri Feb 24 00:00:00 CST 2012  
            date = format.parse(map.get("stuBirthday"));   
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        
		Student student = new Student(stuUuid,
				new Integer(1),
				new Integer(1),
				date,
				map.get("sex"),
				map.get("password2"),
				map.get("identity"),
				map.get("phone"),
				new Date(),
				"科目一",
				map.get("drivingType"),
				map.get("formerType"),
				map.get("nation"),
				map.get("curLocation"),
				map.get("identityLocation"),
				map.get("stuName"));
		int row = studentMapper.insertMyStudent(student);
		       if(row>0){
		    	   Student student2 = studentMapper.selectByPrimaryKey(stuUuid);
		    	   session.setAttribute("registerId", student2.getStuId());
		       }
		
		TrainerStu trainerStu = new TrainerStu(
				UUID.randomUUID().toString(), traUuid, stuUuid, new Date(), null, "正在学习");
		
		trainerStuMapper.insert(trainerStu);
		
		SchoolStu schoolStu = new SchoolStu(
				UUID.randomUUID().toString(), schUuid, stuUuid, 2017, "正在学习", new Date(), null);
		
		schoolStuMapper.insert(schoolStu);
		
		StuCardTime stuCardTime = new StuCardTime(UUID.randomUUID().toString(), stuUuid, new BigDecimal(0), new BigDecimal(0), new BigDecimal(0), new BigDecimal(0));
		
		stuCardTimeMapper.insert(stuCardTime);
		
	}

	@Override
	public List<Trainer> getTrainersBySchUuid(String schUuid) {
		// TODO Auto-generated method stub
		//根据驾校编号获取所有的教练
		List<Trainer> trainers = trainerMapper.getTrainersBySchUuid(schUuid);
		
		return trainers;
	}
}
