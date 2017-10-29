package com.great.service.mainpageService.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.DriverSchoolMapper;
import com.great.service.mainpageService.ImainpageService;

@Service
public class MainpageServiceImp implements ImainpageService{

	
	@Autowired
	DriverSchoolMapper driverSchoolMapper;
	
	
	
	@Override
	public List<Map<String, String>> allSchool() {
		
	  List<Map<String, String>> maps = driverSchoolMapper.allSchool();
      
	  System.out.println("allSchool >> ="+maps);
		return maps;
	}

	
	
	
	

 }
