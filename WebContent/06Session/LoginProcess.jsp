<%@page import="memberShip.MemberDTO"%>
<%@page import="memberShip.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 폼으로 전달한 아이디 비번 변수에 저장하기 
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// web.xml에서 디비 연결 정보 application으로 가져오기 
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// 회원 DAO로 회원 DTO 객체 가져오기
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO dto = dao.getMemberDTO(userId, userPwd);
dao.close();

// 로그인 성공 여부에 따라 jsp 처리하기 
if(dto.getId() != null){ // 아이디가 있으면(로그인이 잘 되었으면)
	// 세션 객체에 속성 집어넣기 
	session.setAttribute("UserId", dto.getId());
	session.setAttribute("UserName", dto.getName());
	// 요청에 잘 들어오면 응답으로 loginForm.jsp를 응답한다. 
	response.sendRedirect("LoginForm.jsp");
}else{
	// 로그인 실패를 하면
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
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