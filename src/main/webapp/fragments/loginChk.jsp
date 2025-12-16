<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션에 로그인한정보가 있는지?)
String sessionId="";
if(new Random().nextBoolean()){
	sessionId="min";
}else{
//없다면 로그인페이지
	response.sendRedirect("http://192.168.10.83/jsp_prj/login/loginFrm.jsp");
	return;
}
%>