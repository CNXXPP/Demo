package com.great.service.center_mgr;

import java.util.Map;

public interface IMenuService {

	public Map<String, Map<String, String>> getMenu(int admId) throws Exception;
	
}
