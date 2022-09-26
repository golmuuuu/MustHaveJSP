<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

// idSaveMain에서 폼태그로 전송한 값들 변수에 저장하기
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");

// 로그인에 성공하면 
if("must".equals(user_id) && "1234".equals(user_pw)){
	
	// 아이디 저장하기 체크가 되어있으면 
	if(save_check != null && save_check.equals("Y")){
		// 쿠키 만들기 쿠키 값은 아이디로 하고 24시간동안 유지한다.
		CookieManager.makeCookie(response, "loginId", user_id, 3600*24);
	// 아이디 저장하기 체크가 되어있지 않으면 
	}else{
		CookieManager.deleteCookie(response, "loginId");
	}
	
	JSFunction.alertLocation("로그인에 성공하였습니다.","IdSaveMain.jsp", out);

// 로그인에 실패하면
}else{
	JSFunction.alertBack("로그인에 실패했습니다.", out);
	
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>