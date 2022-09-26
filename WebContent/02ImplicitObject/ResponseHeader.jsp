<%@page import="java.util.Collection"%>
<%@page import="java.util.Collections"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 응답 헤더에 추가할 값 가져오기 = request.getParameter() 
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	long add_date = s.parse(request.getParameter("add_date")).getTime();
	int add_int = Integer.parseInt(request.getParameter("add_int"));
	String add_str = request.getParameter("add_str");
	
	// 만든 변수에 값을 추가하기  - response.add~~ / response.set~~~
	response.addDateHeader("MyBirthday", add_date);
	response.addIntHeader("MyNumber", add_int);
	response.addIntHeader("MyNumber", 1004); // 추가하기 
	response.addHeader("MyName", add_str);
	response.setHeader("MyName", "안중근"); // 수정하기 
%>
<html>
<head>
<title>내장 객체 - response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	for(String hName : headerNames){
		String hValue = response.getHeader(hName);
		// 여기서 getHeader() 메소드는 헤더명이 같으면 값이 여러개더라도 첫번째 헤더값만 가져오기 때문에
		// 출력하면 myNumber : 0202 myNumber : 0202 가 나온다 ! 실제로는 두번째 헤더값은 1004...
	%>
		<li><%= hName %> : <%= hValue %></li>
	<%
	}
	%>
	<h2>myNumber만 출력하기</h2>
	<%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for(String myNum : myNumber){
	%>
		<li>myNumber : <%= myNum %></li>	
	<%
	}
	%>
	
</body>
</html>