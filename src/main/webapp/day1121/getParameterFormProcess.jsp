<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="입력 폼의 입력값을 받아서 처리하는 일"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//payload 입력된 모든문자들의 charset을 설저랴(post방식에만동작)
//주위:모든request가 사용되기전에 코딩
request.setCharacterEncoding("UTF-8");
//request 내장객체를사용하여 html frorm control에입력된값을 받기
//id+testsdfg&pass=minjo123&birth=2025-11-06&1oc=서울&intro=내소개&Code=U3881
//parameter명이 유일=>String 변수명=request.getParameter("파라메터명");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String birth=request.getParameter("birth");
String location=request.getParameter("loc");
String intro=request.getParameter("intro");
String code=request.getParameter("code");
//입력한 값을 유욯성 검증(back-end) > 서비스객체>DAO>리턴값 서비스받아 >jsp로리턴
//>리턴된값을 받아서 이쁘게 만들어서 사용자에게응답
%>
<div>
<strong><%= request.getMethod() %> 방식 입력값</strong>
<ul>
<!--String 클래스를 생성하여 한글변환가능 : 입력된값이 한글인 모든값에 여러번처리해야한다  -->
<%-- <li><strong>아이디</strong>:<%= new String(id.getBytes("8859_1"),"UTF-8") %></li> --%><li><strong>아이디</strong>:<%= id %></li>
<li><strong>비번</strong>:<%= pass %></li>
<li><strong>생년월일</strong>:<%= birth %></li>
<li><strong>location</strong>:<%= location %></li>
<li><strong>자기소개</strong>:<%= intro %></li>
<li><strong>code</strong>:<%= code %></li>
</ul>
</div>
</body>
</html>