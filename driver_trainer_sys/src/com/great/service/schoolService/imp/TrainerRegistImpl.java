package com.great.service.schoolService.imp;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.TrainerMapper;
import com.great.entity.Trainer;
import com.great.service.schoolService.inte.ITrainerRegist;
@Service
public class TrainerRegistImpl implements ITrainerRegist{
    @Autowired
    TrainerMapper mapper;
    
	@Override
	public Map<String, Object> trainerRegist(Trainer trainer) {
		// TODO Auto-generated method stub
		int  res=mapper.insert(trainer);
		Map<String, Object> map = new HashMap<>();
		if(res>0){			
			map.put("res", res);
		}
		return map;
	}

}
