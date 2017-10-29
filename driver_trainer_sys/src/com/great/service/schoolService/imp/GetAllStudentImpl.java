package com.great.service.schoolService.imp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.ExamRegisterMapper;
import com.great.dao.SchoolStuMapper;
import com.great.dao.StuCardTimeMapper;
import com.great.dao.StudentMapper;
import com.great.dao.TrainerStuMapper;
import com.great.entity.CheckStuCardTime;
import com.great.entity.DriverSchool;
import com.great.entity.ExamRegister;
import com.great.entity.SchoolStu;
import com.great.entity.Student;
import com.great.entity.TrainerStu;
import com.great.service.schoolService.inte.IGetAllStudent;
@Service("allStudentImpl")
public class GetAllStudentImpl implements IGetAllStudent{
	
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	SchoolStuMapper schoolStuMapper;
	@Autowired
	TrainerStuMapper trainerStuMapper;
	@Autowired
	StuCardTimeMapper stuCardTimeMapper;
	@Autowired
	ExamRegisterMapper examRegisterMapper;
    //得到所有的学生
	@Override
	public ArrayList<Student> getAllStudent(DriverSchool driverSchool) {
		// TODO Auto-generated method stub
		ArrayList<SchoolStu> scStuList=schoolStuMapper.getStuIdBySchId(driverSchool);
		ArrayList<Student> stuList=new ArrayList<Student>();
		for (int i = 0; i < scStuList.size(); i++) {
			Student student = studentMapper.selectByPrimaryKey(scStuList.get(i).getStuUuid());
			stuList.add(student);
		}
		
		return stuList;
	}
	
	//获取所有未安排教练的学员
	@Override
	public ArrayList<Student> getAllUnsetTrainerStudent(DriverSchool driverSchool) {
		// TODO Auto-generated method stub

		ArrayList<SchoolStu> scStuList = schoolStuMapper
				.getStuIdBySchId(driverSchool);

		ArrayList<Student> stuList = new ArrayList<Student>();

		for (int i = 0; i < scStuList.size(); i++) {

			Student student = studentMapper.selectByPrimaryKey(scStuList.get(i)
					.getStuUuid());

			stuList.add(student);
		}
		ArrayList<TrainerStu> setedStuList = trainerStuMapper
				.checkSetedStudent();

		for (int i = 0; i < setedStuList.size(); i++) {

			for (int j = 0; j < stuList.size(); j++) {

				if (setedStuList.get(i).getStuUuid()
						.equals(stuList.get(j).getStuUuid())) {

					stuList.remove(j);
				}

			}

		}

		return stuList;
	}
	@Override
	public ArrayList<CheckStuCardTime> getStuTime(DriverSchool driverSchool) {
		// TODO Auto-generated method stub
		ArrayList<CheckStuCardTime> cardTimeList=stuCardTimeMapper.getStuTime(driverSchool);
		return cardTimeList;
	}
    
	@Override
	public ArrayList<ExamRegister> getRegistedStudent() {
		// TODO Auto-generated method stub
		ArrayList<ExamRegister> registedStuList = examRegisterMapper.getRegistedStudent();
		

		return registedStuList;
	}
	
	

}
