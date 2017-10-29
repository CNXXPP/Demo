package com.great.service.schoolService.inte;

import java.util.ArrayList;



import com.great.entity.Trainer;
import com.great.entity.TrainerTable;


public interface IGetAllTrainer {
	
	public ArrayList<Trainer> getAllTrainer(Trainer trainer);
	
	public ArrayList<TrainerTable> getAllTrainerT(Trainer trainer);
	
	

}
