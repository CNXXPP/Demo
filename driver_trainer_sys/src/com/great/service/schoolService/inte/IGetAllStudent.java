package com.great.service.schoolService.inte;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.great.dao.StudentMapper;
import com.great.entity.CheckStuCardTime;
import com.great.entity.DriverSchool;
import com.great.entity.ExamRegister;
import com.great.entity.Student;

public interface IGetAllStudent {
	
	public ArrayList<Student> getAllStudent(DriverSchool driverSchool);
	
	public ArrayList<Student> getAllUnsetTrainerStudent(DriverSchool driverSchool);
	
	public ArrayList<CheckStuCardTime> getStuTime(DriverSchool driverSchool);
	
	public ArrayList<ExamRegister> getRegistedStudent();
	

}
