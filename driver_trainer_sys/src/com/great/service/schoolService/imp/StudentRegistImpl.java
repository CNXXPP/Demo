package com.great.service.schoolService.imp;

import java.math.BigDecimal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchoolStuMapper;
import com.great.dao.StuCardTimeMapper;
import com.great.dao.StudentMapper;
import com.great.dao.TrainerStuMapper;
import com.great.entity.SchoolStu;
import com.great.entity.StuCardTime;
import com.great.entity.Student;
import com.great.entity.TrainerStu;
import com.great.service.schoolService.inte.IStudentRegist;
@Service
public class StudentRegistImpl implements IStudentRegist{
	
	
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	SchoolStuMapper schoolStuMapper;
	@Autowired
	TrainerStuMapper trainerStuMapper;
	@Autowired
	StuCardTimeMapper cardTimeMapper;

	@Override
	public int regist(Student student,SchoolStu schoolStu) {
		// TODO Auto-generated method stub
		int r=studentMapper.insert(student);
		
		Student stu=studentMapper.getNewUuid();
		System.out.println(stu.getStuUuid());
		schoolStu.setStuUuid(stu.getStuUuid());
		UUID uuid = UUID.randomUUID();
		schoolStu.setSchStuUuid(uuid.toString());
		int res=schoolStuMapper.insert(schoolStu);
	     
		return res;
	}

	@Override
	public int setTrainer(TrainerStu trainerStu) {
		// TODO Auto-generated method stub
		UUID uuid = UUID.randomUUID();
		trainerStu.setTraStuUuid(uuid.toString());
		int res = trainerStuMapper.insert(trainerStu);
		
		return res;
	}

	@Override
	public int setStuCardTIme(StuCardTime cardTime) {
		// TODO Auto-generated method stub
		UUID uuid = UUID.randomUUID();
		cardTime.setCtUuid(uuid.toString());
		cardTime.setCtSub1(new BigDecimal(0));
		cardTime.setCtSub2(new BigDecimal(0));
		cardTime.setCtSub3(new BigDecimal(0));
		cardTime.setCtSub4(new BigDecimal(0));
		
		int res = cardTimeMapper.insert(cardTime);
		return res;
	}
	

}
