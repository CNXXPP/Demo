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
		System.out.println("������websocket--------------------------------------------------------------");
		this.session=session;
	}
	
	@OnMessage
	public void onMessage(String message)throws Exception{
		System.out.println("�յ���Ϣ"+message+"--------------------------------------------------------------");
		
		JSONObject object = JSONObject.fromObject(message);//ת��json�ַ���
		
		String type = object.getString("msg");//��ȡ���͵���Ϣ����
		
		switch (type) {
		case "login"://��½�ɹ�
			
			 stuUuid = object.getString("ID");
			
			synchronized (MyHashMap.class) {
				//��½�ɹ���session�浽��̬map��ȥ����ͬ����
				MyHashMap.hashMap.put(stuUuid, session);
				
			}
			
			
			break;

        case "sendMsg"://���յ���Ϣ
        	
        	String reSend = "{msg:'sendMsg'}";
        	
        	JSONObject object2 = JSONObject.fromObject(reSend);
        	
        	session.getAsyncRemote().sendText(object2.toString());
			
			break;
		}
		
		
		
		

	}
	
	@OnClose
	public void onClose(Session session,CloseReason reason)throws Exception{
		System.out.println("�ر���socket"+"---------------------------------------------------------------");
		
		synchronized (MyHashMap.class) {
			MyHashMap.hashMap.remove(stuUuid);//�ر�ʱ��ѧ����sessionɾ��
		}
	}
	
	@OnError
	public void onError(Session session,Throwable throwable)throws Exception{
		System.out.println("�쳣��-------------------------------------------------------------------------");
		
		synchronized (MyHashMap.class) {
			MyHashMap.hashMap.remove(stuUuid);//�쳣ʱ��map�д��sessionɾ��
		}
	}

}
