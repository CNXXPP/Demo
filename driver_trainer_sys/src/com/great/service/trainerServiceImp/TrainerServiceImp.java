package com.great.service.trainerServiceImp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import oracle.net.aso.p;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchoolMsgMapper;
import com.great.dao.StuMsgMapper;
import com.great.dao.StudentMapper;
import com.great.dao.TrainerCommentMapper;
import com.great.dao.TrainerMapper;
import com.great.dao.TrainerMsgMapper;
import com.great.entity.SchoolMsg;
import com.great.entity.StuMsg;
import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.entity.TrainerMsg;
import com.great.entity.UpdateTrainerMsg;
import com.great.entity.VerifyPwd;
import com.great.service.trainerService.ItrainerService;

@Service
public class TrainerServiceImp implements ItrainerService{
	
	@Autowired
	TrainerCommentMapper commentMapper;
	
	@Autowired
	TrainerMapper mapper;	
	
	@Autowired
	TrainerMsgMapper trainerMsgMapper;
	
	@Autowired
	SchoolMsgMapper schoolMsgMapper;
	
	@Autowired
	StuMsgMapper stuMsgMapper;
	
	@Autowired
	StudentMapper studentMapper;
	
	@Override
	public List<Map<String, String>> showAppraise(String traUuid) {
		
		List<Map<String, String>> lMaps = commentMapper.showAppraise(traUuid);
        
		return lMaps;
	}


	@Override
	public int  updateTrainerMsg(UpdateTrainerMsg msg) {
		
		int a=commentMapper.updateTrainerMsg(msg);
		
		return a;
	}


	@Override
	public int updateByPrimaryKeySelective(Trainer record) {
	
	 int a = mapper.updateByPrimaryKeySelective(record);
	
	 return a;
	
	}


	@Override
	public int  selectTrainer(VerifyPwd pwd ,String pw2) {
		
	  Trainer trainer = mapper.selectTrainer(pwd);

	  if (trainer==null) {
		
		  return 0;
		  
	 }else {
		 
		VerifyPwd verifyPwd = new VerifyPwd(pwd.getId(), pw2);
	    int c = mapper.updateTrainerPwd(verifyPwd);
    
	    return c;
	}
		
		
	}


	@Override
	public int insertTrainerMsg(TrainerMsg trainerMsg ,Trainer trainer) {		

		int a = trainerMsgMapper.insert(trainerMsg);
		System.out.println("trainerMsg ="+trainerMsg);
		 if (a>0) {
			
			 if (trainerMsg.getTmsgGroup().equals("驾校")) {
		 
				 SchoolMsg schoolMsg = new SchoolMsg(
						 trainerMsg.getTmsgUuid(),
						 trainer.getSchUuid(),
						 trainerMsg.getTmsgTitle(),
						 trainerMsg.getTmsgContext(), 
						 trainer.getTraName(),
						 trainerMsg.getTmsgDate(), 
						 "未查看",
						 "收",
						 "教练");

				int c = schoolMsgMapper.insert(schoolMsg);
			
			}else{				
				
				StuMsg stuMsg = new StuMsg(
						 trainerMsg.getTmsgUuid(),
						 trainerMsg.getTmsgGroup(),
						 trainerMsg.getTmsgTitle(),
						 trainerMsg.getTmsgContext(), 
						 trainer.getTraName(),
						 trainerMsg.getTmsgDate(), 
						 "未查看",
						 "收",
						 "教练");
				
				int s = stuMsgMapper.insert(stuMsg);

				
			}
			 
			 
			 
			 
		 }
		
		
		
		
	
		return a;
	}


	@Override
	public List<Map<String, String>> selectMsg(String key) {
		
		List<Map<String, String>> lMaps = trainerMsgMapper.selectMsg(key);
		
		
		return lMaps;
	}


	@Override
	public int updateState(String uuid) {
		
	int a = trainerMsgMapper.updateState(uuid);
	
		return a;
	}


	@Override
	public int updateByPrimaryKeySelective(Student student) {
		
		int a = studentMapper.updateByPrimaryKeySelective(student);

		return a;
	}

	
	
	
     	
	
 }
