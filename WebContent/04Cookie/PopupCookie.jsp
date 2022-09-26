<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String chkVal = request.getParameter("inactiveToday");

if(chkVal != null && chkVal.equals("1")){
	// 쿠키 생성
	Cookie cookie = new Cookie("PopupClose", "off");
	// 경로 설정
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600*24);
	response.addCookie(cookie);
	out.println("쿠키 : 하루동안 열지 않음");
}
%>
