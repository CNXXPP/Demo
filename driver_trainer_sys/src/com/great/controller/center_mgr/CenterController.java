package com.great.controller.center_mgr;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.aso.i;
import oracle.net.aso.r;
import oracle.net.aso.s;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.great.entity.AccountChar;
import com.great.entity.CenterAdmin;
import com.great.service.center_mgr.ICenterAdminService;
import com.great.service.center_mgr.imp.AccountCharServiceImp;
import com.great.service.center_mgr.imp.CenterAdminServiceImp;
import com.great.service.center_mgr.imp.MenuServiceImp;
import com.great.util.AuthCode;
import com.megvii.cloud.mylibrary.R.string;

@Controller
@RequestMapping("/xp")
public class CenterController {

	private String code = "";
	@Autowired
	private CenterAdminServiceImp centerAdminService;
	@Autowired
	private MenuServiceImp menuServiceImp;
	// 锟斤拷证锟斤拷
	@RequestMapping(value = "/centerMgr/AuthCode")
	@ResponseBody
	// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟捷ｏ拷图片锟斤拷json锟斤拷锟斤拷锟斤拷锟斤拷锟�锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷转锟斤拷
	public void centerAuthCode(HttpServletResponse response) throws Exception {
		code = AuthCode.getAuthCode();

		BufferedImage image = AuthCode.getAuthImg(code);

		try {
			// 写锟斤拷锟接mg锟斤拷签锟较ｏ拷锟斤拷示锟斤拷锟斤拷
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 锟斤拷录
	@RequestMapping(value = "/centerMgr/login")
	@ResponseBody
	// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟捷ｏ拷图片锟斤拷json锟斤拷锟斤拷锟斤拷锟斤拷锟�锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷转锟斤拷
	public Map<String, Object> centerLogin(CenterAdmin admin, String codeInput,
			HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
		String result = null;
		if (code.equalsIgnoreCase(codeInput)) {
			CenterAdmin centerAdmin = centerAdminService
					.login(admin.getAdmId());
			if (centerAdmin == null) {
				result = "wrongId";
			} else {
				if (admin.getAdmPwd().equals(centerAdmin.getAdmPwd())) {
					session.setAttribute("admin", centerAdmin);
					Map<String, String> adminMap = centerAdminService.getLastLoginDateAndChar(centerAdmin.getAdmUuid());
					session.setAttribute("adminMap", adminMap);
					//锟斤拷陆锟缴癸拷 admin锟斤拷锟斤拷session锟斤拷锟斤拷锟较次碉拷陆时锟斤拷
					centerAdminService.updateLastLoginDate(centerAdmin.getAdmUuid());
					Map<String, Map<String, String>> menuMap = menuServiceImp.getMenu(centerAdmin.getAdmId());//锟斤拷锟饺拷薏说锟�
					session.setAttribute("menuMap", menuMap);
					result = "success";
				} else {
					result = "wrongPwd";
				}
			}
		} else {
			result = "wrongAuthCode";
		}
		map.put("result", result);
		return map;
	}

	// 锟斤拷锟�
	@RequestMapping(value = "/centerMgr/addAdmin")
	@ResponseBody
	public Map<String, Object> addCenterAdmin(CenterAdmin admin, int charNo)
			throws Exception {
		CenterAdmin resultAdmin = centerAdminService.addCenterAdmin(admin,
				charNo);

		Map<String, Object> map = new HashMap<>();
		map.put("result", resultAdmin);
		return map;
	}

	// 锟斤拷取锟斤拷锟斤拷
	@RequestMapping(value = "/centerMgr/showAllAdmin")
	@ResponseBody
	public String showAllAdmin() throws Exception {

		
		JSONArray arr = new JSONArray();
		List<Map<String, String>> adminCharList = centerAdminService
				.selectAllAdminChar();
		for (int i = 0; i < adminCharList.size(); i++) {
			JSONObject object = new JSONObject();
			for (String key : adminCharList.get(i).keySet()) {
				object.put(key, adminCharList.get(i).get(key));
			}
			arr.add(object);
		}
		JSONObject sendJsonObject = new JSONObject();
		sendJsonObject.put("data", arr);

		Map<String, Object> map = new HashMap<>();
		map.put("result", adminCharList);

		return sendJsonObject.toJSONString();
	}

	// 删锟斤拷
	@RequestMapping("/centerMgr/delAdmin")
	@ResponseBody
	public Map<String, Object> delAdmin(int admId) throws Exception {
		String result = null;
		int res = centerAdminService.delAdminById(admId);
		if (res > 0) {
			result = "success";
		} else {
			result = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

	// 锟斤拷锟斤拷锟斤拷锟斤拷为123456
	@RequestMapping(value = "/centerMgr/resetAdminPwd")
	@ResponseBody
	public Map<String, Object> resetAdminPwd(int admId) throws Exception {
		String result = null;
		int res = centerAdminService.resetPwd(admId);
		if (res > 0) {
			result = "success";
		} else {
			result = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

	// 锟睫革拷锟斤拷息
	@RequestMapping(value = "/centerMgr/updateInfo")
	@ResponseBody
	public Map<String, Object> updateInfo(@RequestParam Map<String, String> map)
			throws Exception {
		String result = null;
		System.out.println(map);
		boolean res = centerAdminService.updateAdminInfo(map);
		if (res) {
			result = "success";
		} else {
			result = "false";
		}

		Map<String, Object> map1 = new HashMap<>();
		map1.put("result", result);
		return map1;
	}

	@RequestMapping(value = "/centerMgr/updatePwd")
	@ResponseBody
	public Map<String, Object> updatePwd(int admId, String newPwd,String oldPwd,HttpSession session)
			throws Exception {
		String result = null;
		boolean res = centerAdminService.updatePwd(admId, newPwd);
		CenterAdmin admin = (CenterAdmin) session.getAttribute("admin");
		if(!oldPwd.equals(admin.getAdmPwd())){
			res = false;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", res);
		return map;
	}
	
	@RequestMapping(value = "/testJson")
	@ResponseBody
	public String testJson(String json)
			{
		System.out.println(JSONObject.parseObject(json));
		JSONObject object = JSONObject.parseObject(json);
		JSONArray array = object.getJSONArray("list");
		for (int i = 0; i < array.size(); i++) {
			
			JSONObject object2 = array.getJSONObject(i);
			System.out.println(object2);
		}
		return "1";
	}
	
}
