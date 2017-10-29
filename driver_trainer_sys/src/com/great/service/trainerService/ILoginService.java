package com.great.service.trainerService;


import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.great.entity.Student;
import com.great.entity.Trainer;
import com.great.entity.TrainerStu;

public interface ILoginService {
	
	public Trainer loginVerify(Trainer trainer);

	public List<Student> showAllstu(String uuid);
	
    public List<Map<String, String>> showStuTime(List<Student> uuid);
	

 }
