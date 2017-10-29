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

@Controller
@RequestMapping("/xp")
public class CenterController {

	private String code = "";
	@Autowired
	private CenterAdminServiceImp centerAdminService;
	@Autowired
	private MenuServiceImp menuServiceImp;
	// ��֤��
	@RequestMapping(value = "/centerMgr/AuthCode")
	@ResponseBody
	// ������������ݣ�ͼƬ��json����������)������������ת��
	public void centerAuthCode(HttpServletResponse response) throws Exception {
		code = AuthCode.getAuthCode();

		BufferedImage image = AuthCode.getAuthImg(code);

		try {
			// д���Ӧimg��ǩ�ϣ���ʾ����
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ��¼
	@RequestMapping(value = "/centerMgr/login")
	@ResponseBody
	// ������������ݣ�ͼƬ��json����������)������������ת��
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
					//��½�ɹ� admin����session������ϴε�½ʱ��
					centerAdminService.updateLastLoginDate(centerAdmin.getAdmUuid());
					Map<String, Map<String, String>> menuMap = menuServiceImp.getMenu(centerAdmin.getAdmId());//���Ȩ�޲˵�
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

	// ���
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

	// ��ȡ����
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

	// ɾ��
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

	// ��������Ϊ123456
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

	// �޸���Ϣ
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
	
	
	
	
}
