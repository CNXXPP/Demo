package com.great.aop.center;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class CenterAspect {

	private Logger logger = Logger.getLogger(CenterAspect.class);
	
	@Pointcut("execution(* com.great.service.center_mgr.*Service.*(..))")
	public void anyMethod(){}
	
	@Around("anyMethod()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable{
		//1.
		String clsName = pjp.getTarget().getClass().getName();
		System.out.println(clsName);
		String methodName = pjp.getSignature().getName();
		System.out.println(methodName);
		
		//3.
		logger.info("执行方法："+clsName+"."+methodName);
		Object object = pjp.proceed();//执行goHome方法
		logger.info("执行的结果："+object.toString());
		//5.
		System.out.println(object);

		return object;
	}
	
	
	@AfterThrowing("anyMethod()")
	public void throwMsg(JoinPoint pjp){
		String clsName = pjp.getTarget().getClass().getName();
		String methodName = pjp.getSignature().getName();
		
		System.out.println("执行方法出现异常");
		
	}
}
