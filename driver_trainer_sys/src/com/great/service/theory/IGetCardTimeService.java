package com.great.service.theory;

import java.util.List;
import java.util.Map;

import com.great.entity.CardTimeRecord;
import com.great.entity.StuCardTime;

public interface IGetCardTimeService {
    //��ѯһ��ѧԱ�Ѿ�ѧϰ��ѧʱ��δ��ɵ�ѧʱ���Ƿ���ɵ�״̬
	public StuCardTime selectCardtime(String stuUuid) throws Exception;
	//��ѯһ��ѧԱ�ĵ�һ�׶���ϸ����ѧϰѧʱ
	public List<Map<String, String>> selectFirstSubTime(String stuUuid) throws Exception;
	//��ѯһ��ѧԱ�ĵ��Ľ׶���ϸ����ѧϰѧʱ
	public List<Map<String, String>> selectForthSubTime(String stuUuid) throws Exception;
	//���´�ʱ��
	public int updateStuCartTime(String time, String stuUuid) throws Exception;
	
	public int upStuCartTime(String time, String stuUuid) throws Exception;
	
	public int insertStuCartTime(CardTimeRecord rec) throws Exception;
}
