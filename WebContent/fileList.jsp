<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>업로드 파일 리스트</h1>
<%
	//Object 타입으로 받아오기 때문에 HashMap의 wrapper클래스로 변환해서 사용
	Map<String, String> map = (HashMap<String, String>)request.getAttribute("map");
	Iterator<String> keys = map.keySet().iterator();
	
	while(keys.hasNext()){
		String systemfilename = keys.next();
		String orginfilename = map.get(systemfilename);
%>
	<p>
		<a href="file_down.jsp?file_name=<%=systemfilename%>"><%=orginfilename%></a>
	</p>
<%	} %>
</body>
</html>