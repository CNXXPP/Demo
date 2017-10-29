package com.great.service.theory;

import javax.servlet.http.HttpSession;

import com.great.entity.Student;

public interface ILoginService {
    //判断该身份证的对象是否存在
	public String login(String stuIdentity, String stuPwd, String inputcode, HttpSession session, String code) throws Exception;
}
