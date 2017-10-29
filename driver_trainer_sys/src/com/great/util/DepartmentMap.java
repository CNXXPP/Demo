package com.great.util;

import java.util.IdentityHashMap;

import javax.websocket.Session;

public class DepartmentMap {

    public static IdentityHashMap<String, Session> departmentMap = new IdentityHashMap<String, Session>();
 }
