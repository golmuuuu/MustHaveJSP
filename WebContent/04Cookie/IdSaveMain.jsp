<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 쿠키에 있는 로그인 아이디 정보 가져오기
String loginId = CookieManager.readCookie(request, "loginId");

String cookieCheck = ""; 
// 로그인 아이디가 "" 와 같지 않으면 즉 아이디가 쿠키에 저장되어 있다면
// save_check input요소에 checked를 넣을 변수 !! 그러면 로그인 창에 들어가면
// 아이디 저장하기 체크박스가 체크되어있을 것임 !
if(!loginId.equals("")) cookieCheck = "checked";

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
		아이디 : <input type="text" name="user_id" value="<%= loginId%>">
				<!-- 체크박스의 상태속성을 checked로 설정한다. -->
			   <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> />
		아이디 저장하기
		<br> 
		패스워드 : <input type="text" name="user_pw">
		<br> 
		<input type="submit" value="로그인하기">
	</form>
</body>
</html>