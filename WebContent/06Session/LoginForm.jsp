<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"></jsp:include>
	<h2>로그인 페이지</h2>
	<span style="color : red; font-size : 1.2eml">
		<%= request.getAttribute("LoginErrMsg") == null ? 
				"" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	// 로그인 되지 않으면 	if(session.getAttribute("UserId") == null){
	%>
	<script>
	function validateForm(form) {
		if(!form.user_id.value){
			alert("아이디를 입력하세요. ");
			return false;
		}
		if(form.user_pwd.value == ""){
			alert("패스워드를 입력하세요. ");
			return false;
		}
	}	
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this)">
		<!-- 폼태그 제줄을 하면 valudateForm의 리턴값으로 제출할지 말지 결정한다.
			 아이디나 패스워드가 제대로 입력되지 않으면 false를 리턴해 jsp로 넘어가지 않음  -->	
		아이디 : <input type="text" name="user_id"> <br>
		패스워드 : <input type="password" name="user_pw"> <br>
		<input type="submit" value="로그인하기">
	</form>
	<%
	// 로그인되면 
	}else{
	%>
		<%= session.getAttribute("UserName") %>회원님, 로그인하셨습니다. <br>	
		<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>