package com.great.service.theory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.great.entity.Question;
import com.great.entity.StuStimulateExam;

public interface IMocExamScoreService {
    //��ѯ��ǰѧ����ģ�⿼�Գɼ�
	public List<Map<String, String>> getmocExamScore(String stuUuid) throws Exception;
	//�����ȡ��Ŀ
	public ArrayList<Question> getRamQues(String subject) throws Exception;
	//����ģ�⿼�Գɼ�
	public int insertSco(StuStimulateExam stumoc) throws Exception;
}
