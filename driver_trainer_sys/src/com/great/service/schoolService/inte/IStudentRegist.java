package com.great.service.schoolService.inte;

import com.great.entity.SchoolStu;
import com.great.entity.StuCardTime;
import com.great.entity.Student;
import com.great.entity.TrainerStu;

public interface IStudentRegist {
	
	public int regist(Student student,SchoolStu stu);
	public int setTrainer(TrainerStu trainerStu);
	public int setStuCardTIme(StuCardTime cardTime);

}
