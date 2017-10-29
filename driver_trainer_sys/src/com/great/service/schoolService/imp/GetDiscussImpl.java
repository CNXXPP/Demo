package com.great.service.schoolService.imp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.great.dao.SchoolCommentMapper;
import com.great.entity.SchoolComment;
import com.great.service.schoolService.inte.IGetDiscuss;
@Service
public class GetDiscussImpl implements IGetDiscuss{
	@Autowired
	SchoolCommentMapper commentMapper;

	@Override
	public ArrayList<SchoolComment> getDiscuss() {
		// TODO Auto-generated method stub
		ArrayList<SchoolComment> disList=commentMapper.getAllDiscuss();
		return disList;
	}

}
