<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - Response</title>
</head>
<body>
	<%
		// 	// request내장 객체로 값 받아오기 -  user-id / user_pwd 
	// 	// 메인에서 쓴 name을 꼭 잘 써야함 안그러면 널포인트 예외가발생함  
	// 	String id = request.getParameter("user_id");
	// 	String pwd = request.getParameter("user_pwd");

	// 	// 회원 인증 진행하기 
	// 	if(id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")){

	// 		// 로그인이 되면 응답으로 웰컴이라는 페이지로 이동하게 한다.

	// 		response.sendRedirect("ResponseWelcome.jsp");
	// 	}else{
	// 		request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
	// 			.forward(request, response);
	// 		// 만약에 로그인이 되지 않으면 메인.jsp 로 forward 된다. (forward : 전달된다는 )
	// 		// 쿼리스트링으로 loginErr 에 1을 넣고 메인으로 돌아간다. = 이 매개변수를 통해 로그인 성공여부를 판단한다.

	// 	}

	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
		response.sendRedirect("ResponseWelcome.jsp");
	} else {
		request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
	}
	%>

</body>
</html>