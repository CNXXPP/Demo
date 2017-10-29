package com.great.websockst;

import java.io.IOException;
import java.util.IdentityHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import oracle.net.aso.k;
import net.sf.json.JSONObject;

import com.alibaba.fastjson.JSONArray;
import com.great.util.DepartmentMap;
import com.great.util.MyHashMap;

@ServerEndpoint("/MySocket")
public class MySocket {
	
	private String  userUuid;
	private String  userName;
	private String  department;
	private Session session;
	
	private String  group;
	private String  identity;
	
	@OnOpen
	public void open(Session session){
		
		this.session=session;
		
	}
	
	
	
	@OnMessage
    public void message(String message) throws IOException{
	
	 JSONObject object = JSONObject.fromObject(message);
	
	  switch (object.getString("msg")) {
	  
    	case "login":
		     
    		userUuid = object.getString("ID");
    		userName = object.getString("userName");
    		department = object.getString("department");
 		   
    		DepartmentMap.departmentMap.put(department, session);  	//存所在部门
   		 
    		synchronized (MyHashMap.class) {			
		
		     MyHashMap.hashMap.put(userUuid, session);

          }
		    String arr = "{msg:'login' , userName:'"+userName+"'}";
		    
		    for (String key : MyHashMap.hashMap.keySet()) {

		    	if (key!=userUuid) {
                 System.out.println("key =="+key);
		    		MyHashMap.hashMap.get(key).getBasicRemote().sendText(arr);
				}
		    	
			}
		    
		
		   break;
		 
		 
		case "sendMsg":
			 
			group = object.getString("group");			

			System.out.println("group ==" + group);
			
			identity = object.getString("identity");
			
			String arry = "{msg:'sendMsg' , identity:'"+identity+"'}";
		

			if (group.equals("驾校")) {
				
			    for (String key : MyHashMap.hashMap.keySet()) {
			    	
			       DepartmentMap.departmentMap.get(group).getAsyncRemote().sendText(arry);					
			    	
				}
			    
			}else {				
				
		        MyHashMap.hashMap.get(group).getAsyncRemote().sendText(arry);	
			}
	
	           
          break;

	}
		
		
		
	}
	
	
    @OnClose
    public void close(Session session,CloseReason Reason){
    	
    	MyHashMap.hashMap.remove(userUuid);
   	
    }
    
    @OnError
    public void error(Session session,Throwable t){

    	MyHashMap.hashMap.remove(userUuid);
    }
    

 }
