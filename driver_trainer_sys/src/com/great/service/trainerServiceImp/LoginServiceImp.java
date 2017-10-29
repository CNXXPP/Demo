package com.great.service.trainerServiceImp;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.TrainerMapper;
import com.great.dao.TrainerStuMapper;
import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.entity.TrainerStu;
import com.great.service.trainerService.ILoginService;

@Service
public class LoginServiceImp implements ILoginService{
	
	@Autowired
	TrainerMapper trainerMapper;
	
	
	@Autowired
	TrainerStuMapper stuMapper;


	@Override
	@Transactional(rollbackFor = Exception.class)
	public Trainer loginVerify(Trainer trainer) {
		
		Trainer trainer2 = trainerMapper.loginVerify(trainer);		
		
		if (trainer2 != null) {

			trainerMapper.updateLoginTime(trainer2);
		}
		return trainer2;
	}


	@Override
	public List<Student> showAllstu(String uuid) {
			
	 List<TrainerStu> list = stuMapper.selectByPrimaryKey(uuid);
	 List<Student> listStu = new ArrayList<Student>();
	 
	 for (int i = 0; i < list.size(); i++) {
		
		Student student = stuMapper.showAllStudents(list.get(i).getStuUuid());

		  listStu.add(student);
	
	}
	 
		return listStu;
	}


	@Override
	public List<Map<String, String>> showStuTime(List<Student> student) {
		
		List<Map<String, String>> lMaps=stuMapper.showStuTime(student);  
		

		return lMaps;
	}

 }
