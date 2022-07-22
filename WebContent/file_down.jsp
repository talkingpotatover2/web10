<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.ServletUtils" %>
<%
	String fileName = request.getParameter("file_name");

	String savePath = "upload";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = sDownloadPath + "\\" + fileName;
	
	byte b[] = new byte[4096];
	File ofile = new File(sFilePath);
	
	FileInputStream in = new FileInputStream(sFilePath);  //읽어올 파일
	
	String sMimeType = getServletContext().getMimeType(sFilePath);  //타입 체크(작성 안해도됨)
	System.out.println("sMimeType>>>" + sMimeType);
	
	if(sMimeType == null){
		sMimeType = "application/octet-stream";  //8비트 형식으로 처리
	}
	
	response.setContentType(sMimeType);
	
	String sEncoding = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
	
	//파일 다운로드 창 실행(이거 없으면 다운로드 안됨)
	response.setHeader("Content-Disposition", "attachment; filename=" + sEncoding);
	
	ServletOutputStream out2 = response.getOutputStream();
	int numRead;
	
	while((numRead = in.read(b, 0, b.length)) != -1){
		out2.write(b, 0, numRead);
	}
	
	out2.flush();
	out2.close();
	in.close();
%>