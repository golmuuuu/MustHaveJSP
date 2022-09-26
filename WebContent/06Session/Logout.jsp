<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 로그아웃하기 

// 방법 1 : 세션에 저장한 회원인증정보 속성 삭제
// 이렇게 하면 특정 속성만 지우고 싶을때 씀 
session.removeAttribute("UserID");
session.removeAttribute("UserName");

// 방법 2 : 모든 속성 한꺼번에 삭제하기
// 세션 자체를 무효화 한다. - 서버는 세션 정보를 더이상 유지할 필요가 없다. - 서버의 부담이 줄어든다.  
// 로그아웃할때에는 이 방법을 쓰도록 하자 
session.invalidate();

// 속성 삭제 후 페이지 이동하기
response.sendRedirect("LoginForm.jsp");
%>
