package com.great.service.theory;

import javax.servlet.http.HttpSession;

import com.great.entity.Student;

public interface ILoginService {
    //�жϸ����֤�Ķ����Ƿ����
	public String login(String stuIdentity, String stuPwd, String inputcode, HttpSession session, String code) throws Exception;
}
