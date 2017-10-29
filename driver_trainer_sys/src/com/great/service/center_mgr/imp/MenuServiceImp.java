package com.great.service.center_mgr.imp;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.great.dao.AuthorityMapper;
import com.great.service.center_mgr.IMenuService;
@Service
public class MenuServiceImp implements IMenuService {

	@Autowired
	private AuthorityMapper authorityMapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class) //¸ü¸ÄÃÜÂë
	public Map<String, Map<String, String>> getMenu(int admId) throws Exception {
		List<Map<String, String>> menuList = authorityMapper.getMenuInfo(admId);
		Map<String, Map<String, String>> menuMap = new HashMap<String, Map<String,String>>();
		Set<String> parentMenu = new HashSet<>();
		for(Map<String, String> m:menuList){
			
			parentMenu.add(m.get("PARENT_MENU"));
			
		}
		System.out.println(parentMenu);
		for(String menu:parentMenu){
			Map<String, String> childMenuMap = new HashMap<>();
			for(Map<String, String> m:menuList){
				if(m.get("PARENT_MENU").equals(menu)){
					childMenuMap.put(m.get("CHILD_MENU"), m.get("MENU_URL"));
				}
				
			}
			menuMap.put(menu, childMenuMap);
		}
		System.out.println(menuMap);
		return menuMap;
	}

	
}
