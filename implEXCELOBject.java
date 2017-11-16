public void exportData(HashMap<String, String> params,
			HttpServletRequest request, HttpServletResponse response,int span) {
		List<?> dataList = getEnvMonitorValRept(params, span);
		String realPath = request.getSession().getServletContext().getRealPath("/file/temp");
		EXCELObject s = new EXCELObject();
		s.seteFilePath(realPath);
		String[] titH = { "�豸���", "�۲�ʱ��(yyMMddhhmmss)", "�۲�Ҫ��", "�۲�ֵ","��λ"};
		String[] titN = { "id", "x", "ckey", "evalue","unit"};
		s.setFname("������� "); // ��ʱ�ļ���
		s.setTitle("�������"); // ���������
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
		String excelName = "�������" + DateUtil.getCurrentTime() + ".xls";
		s.exportExcel("�������", excelName, exportFile, request, response);
		
	}