package com.great.websockst;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.great.util.MyHashMap;
import com.megvii.cloud.mylibrary.R.string;

import net.sf.json.JSONObject;


@ServerEndpoint(value="/StudentWebSocket")
public class StudentWebSocket {
	
	private Session session;
	
	private String stuUuid;
	
	@OnOpen
	public void onOpen(Session session)throws Exception{
		System.out.println("连上了websocket--------------------------------------------------------------");
		this.session=session;
	}
	
	@OnMessage
	public void onMessage(String message)throws Exception{
		System.out.println("收到消息"+message+"--------------------------------------------------------------");
		
		JSONObject object = JSONObject.fromObject(message);//转成json字符串
		
		String type = object.getString("msg");//获取推送的消息类型
		
		switch (type) {
		case "login"://登陆成功
			
			 stuUuid = object.getString("ID");
			
			synchronized (MyHashMap.class) {
				//登陆成功将session存到静态map中去，加同步锁
				MyHashMap.hashMap.put(stuUuid, session);
				
			}
			
			
			break;

        case "sendMsg"://接收到消息
        	
        	String reSend = "{msg:'sendMsg'}";
        	
        	JSONObject object2 = JSONObject.fromObject(reSend);
        	
        	session.getAsyncRemote().sendText(object2.toString());
			
			break;
		}
		
		
		
		

	}
	
	@OnClose
	public void onClose(Session session,CloseReason reason)throws Exception{
		System.out.println("关闭了socket"+"---------------------------------------------------------------");
		
		synchronized (MyHashMap.class) {
			MyHashMap.hashMap.remove(stuUuid);//关闭时候将学生的session删掉
		}
	}
	
	@OnError
	public void onError(Session session,Throwable throwable)throws Exception{
		System.out.println("异常了-------------------------------------------------------------------------");
		
		synchronized (MyHashMap.class) {
			MyHashMap.hashMap.remove(stuUuid);//异常时候将map中存的session删除
		}
	}

}
