<%@page import="common.DBConnPool"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Jdbc 테스트 2</h2>'
	<%
	
	// web.xml의 컨텍스트 초기화 매개변수를 가져올 때에는 application내장객체를 이용한다.
	// application객체에는 getInitParameter라는 메소드를 통해 param-name을 매개변수로 넣어 param-value를 가져온다
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");
	
	JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
	jdbc2.close();
	out.print("연결 완료 ");
	%>
	
	<h2>JDBC테스트 - application 객체를 인수로 보내 자바 파일에서 연결 하는 방법</h2>
	<%
	// 스크립틀릿에서는 application객체 바로 선언 가능함 ~!~!
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();
	%>
	
	<h2>커넥션 풀 테스트 </h2>
	<%
	DBConnPool pool = new DBConnPool();
	pool.close();
	%>
</body>
</html>