package com.great.service.examination.imp;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import oracle.net.aso.s;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.dao.ExamMapper;
import com.great.dao.ExamRegisterMapper;
import com.great.dao.QuestionMapper;
import com.great.dao.StuScoreMapper;
import com.great.dao.StudentMapper;
import com.great.entity.Exam;
import com.great.entity.ExamRegister;
import com.great.entity.Question;
import com.great.entity.StuExamInfo;
import com.great.entity.StuScore;
import com.great.entity.Student;
import com.great.service.examination.IExaminationService;
import com.great.util.FacePP;
@Service
public class ExaminationServiceImp implements IExaminationService{

	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private ExamRegisterMapper examRegisterMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private StuScoreMapper scoreMapper;
	@Autowired
	private ExamMapper examMapper;

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Question> getAllQuestion(String sub) throws Exception {

		ArrayList<Question> ramQuestion = questionMapper.getRamQuestion(sub);
		return ramQuestion;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public String login(Student student,HttpSession session) throws Exception{
		Student stu = studentMapper.selectByIdentity(student.getStuIdentity());
		if(stu == null){
			return "wrongId";
		}else{
			if(stu.getStuPwd().equals(student.getStuPwd())){
				session.setAttribute("examStudent", stu);
				String subject = null;
				if(stu.getSubNo() == 1){
					subject = "科目一";
				}else if(stu.getSubNo() == 4){
					subject = "科目四";
				}else{
					return "noRegister";
				}
				StuExamInfo stuExamInfo = scoreMapper.selectByStuUuid(stu.getStuUuid());
				//查看是否报名考生
				ExamRegister examRegister = examRegisterMapper.selectExamRegisterByStuIdentity(stu.getStuUuid());
				session.setAttribute("phoPath", examRegister.getExamPhotoPath());
				String examUuid = examRegister.getExamUuid();
				Exam exam = examMapper.selectByPrimaryKey(examUuid);
				if(exam.getExamStatus().equals("未开始")){
					return "notStart";
				}
				Date examDate = exam.getExamDate();
				if(examRegister == null){
					return "noRegister";
				}
				
				Map<String, Object> map1 = new HashMap<>();
				map1.put("stuUuid", stu.getStuUuid());
				map1.put("scDate", examDate);
				StuScore stuScore = scoreMapper.selectByStuUuidExamDate(map1);
				
				//查看是否已经考试通过
				if(stuScore != null && stuExamInfo != null && stuExamInfo.getSubName().equals(subject) && stuExamInfo.getExamResult() !=null){
					return "examed";
				}
				ArrayList<Question> ramQuestion = questionMapper.getExamQues(subject);
				Map<String, Object> map = new HashMap<String, Object>();
				
				JSONArray array = new JSONArray();
				for (Question question:ramQuestion) {
					JSONObject object = new JSONObject();
					object.put("desc", question.getqDescription());
					object.put("a", question.getqAnswerA());
					object.put("b", question.getqAnswerB());
					object.put("c", question.getqAnswerC());
					object.put("d", question.getqAnswerD());
					object.put("correct", question.getqAnswerCorrect());
					array.add(object);
				}
				JSONObject object = new JSONObject();
				object.put("data", array);
				map.put("data", array);
				session.setAttribute("questionList", object);
				
				session.setAttribute(stu.getStuId()+"", ramQuestion);
				return "success";
			}else{
				return "wrongPwd";
			}
		}
		
	}
	
	@Override
	public boolean calcScore(String scScore,String curSub,String startTime,String endTime,HttpSession session) throws Exception {
		Timestamp timestampStart = new Timestamp(Long.parseLong(startTime));
		Timestamp timestampEnd = new Timestamp(Long.parseLong(endTime));
		
		StuScore stuScore = new StuScore();
		Student student = (Student) session.getAttribute("examStudent");
		
		ExamRegister examRegister = examRegisterMapper.selectExamRegisterByStuIdentity(student.getStuUuid());
		
		//获得考试日期
		String examUuid = examRegister.getExamUuid();
		Exam exam = examMapper.selectByPrimaryKey(examUuid);
		Date examDate = exam.getExamDate();
		
		stuScore.setStartTime(timestampStart);
		stuScore.setEndTime(timestampEnd);
		stuScore.setScUuid(UUID.randomUUID().toString());
		stuScore.setStuUuid(student.getStuUuid());
		stuScore.setScScore(Integer.parseInt(scScore));
		stuScore.setCurSub(curSub);
		stuScore.setScDate(examDate);
		System.out.println(stuScore);
		FacePP facePP = new FacePP();
		facePP.setPhoDir(examRegister.getExamPhotoPath());
		boolean validateRs = facePP.faceValidate();
		if(!validateRs){
			stuScore.setScScore(-1); //人脸识别验证识别，成绩为-1表示作弊
			return false;
		}
		int res = scoreMapper.insert(stuScore);
		if(res > 0){
			return true;
		}
		
		
		return false;
	}
}
