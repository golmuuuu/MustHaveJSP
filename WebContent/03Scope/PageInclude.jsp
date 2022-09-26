<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page 지시어를 제외한 나머지 태그 다 삭제함 
문서 안에 문서를 포함하는 형태이므로 태그가 중복될 수 있음  -->

<h4>Include 페이지</h4>
<%
int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
// String pString2 = pageContext.getAttribute("pageString").toString();
Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>
<ul>
	<li>Integer 객체 : <%= pInteger2 %></li>

	<!-- 위에서 속성을 읽어오지 않고 바로 출력하는 방법 -->
	<li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>

	<li>Person 객체 : <%= pPerson2.getName() %>, <%= pPerson2.getAge() %></li>
</ul>