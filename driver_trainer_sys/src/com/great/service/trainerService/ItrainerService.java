package com.great.service.trainerService;

import java.util.List;
import java.util.Map;

import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.entity.TrainerMsg;
import com.great.entity.UpdateTrainerMsg;
import com.great.entity.VerifyPwd;

public interface ItrainerService {
	
	
	public List<Map<String, String>> showAppraise(String traUuid);
	
	public int  updateTrainerMsg(UpdateTrainerMsg msg);
	
	
	public int  selectTrainer(VerifyPwd pwd ,String pw2);
	
	public  int updateByPrimaryKeySelective(Trainer record);
	
	public int insertTrainerMsg(TrainerMsg trainerMsg ,Trainer trainer);
	
	public List<Map<String,String>> selectMsg(String key);

	int updateState(String uuid);
	
	public int updateByPrimaryKeySelective(Student student);
}
