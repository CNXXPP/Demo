package com.great.service.schoolService.imp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.TrainerMapper;
import com.great.entity.Trainer;
import com.great.entity.TrainerTable;
import com.great.service.schoolService.inte.IGetAllTrainer;
@Service
public class GetAllTrainerImpl implements IGetAllTrainer{
	
	@Autowired
	TrainerMapper mapper;

	@Override
	public ArrayList<Trainer> getAllTrainer(Trainer trainer) {
		// TODO Auto-generated method stub
		ArrayList<Trainer> traList=mapper.getAllTrainers(trainer);
		
		return traList;
	}

	@Override
	public ArrayList<TrainerTable> getAllTrainerT(Trainer trainer) {
		// TODO Auto-generated method stub
		ArrayList<Trainer> traList=mapper.getAllTrainers(trainer);
		ArrayList<TrainerTable> t=new ArrayList<TrainerTable>();
		for (int i = 0; i < traList.size(); i++) {
			System.out.println(traList.get(i).getTraName());
			String d=new SimpleDateFormat("yyyy-mm-dd hh:MM:ss").format( traList.get(i).getTraHireDate());
			System.out.println(d);
			TrainerTable table = new TrainerTable(traList.get(i).getTraId().toString(),traList.get(i).getTraName(),traList.get(i).getTraGender(),traList.get(i).getTraAge().toString(),traList.get(i).getTraPhone(),traList.get(i).getTraScore().toString(),d,traList.get(i).getDrivingType());
		    t.add(table);
		}
		
		return t;
	}

}
