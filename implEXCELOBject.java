public void exportData(HashMap<String, String> params,
			HttpServletRequest request, HttpServletResponse response,int span) {
		List<?> dataList = getEnvMonitorValRept(params, span);
		String realPath = request.getSession().getServletContext().getRealPath("/file/temp");
		EXCELObject s = new EXCELObject();
		s.seteFilePath(realPath);
		String[] titH = { "设备编号", "观测时间(yyMMddhhmmss)", "观测要素", "观测值","单位"};
		String[] titN = { "id", "x", "ckey", "evalue","unit"};
		s.setFname("监测数据 "); // 临时文件名
		s.setTitle("监测数据"); // 大标题名称
		s.setTitH(titH);
		s.setTitN(titN);
		s.setDataList((List<Map<String, String>>) dataList);
		File exportFile = null;
		try {
			exportFile = s.setData();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String excelName = "监测数据" + DateUtil.getCurrentTime() + ".xls";
		s.exportExcel("监测数据", excelName, exportFile, request, response);
		
	}