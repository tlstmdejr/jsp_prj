<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
request.setCharacterEncoding("UTF-8");

String name=request.getParameter("na");
String age=request.getParameter("age");

//JSONObject을 응답. 나이를 가지고 태어난 해를 구해서 응답. Ⅰ
int nowYear=LocalDate.now().getYear();
//int nowYear=Calendar.getInstance().get(Calendar.YEAR);
//1. JSONObject 을 생성(Map 기반)
JSONObject jsonObj=new JSONObject();

int intAge=0;
if(age != null && !age.isEmpty()){
	intAge=Integer.parseInt(age);
}
//2. JSONObject에 응답할 값 설정
jsonObj.put("name",name+"님안녕하세요");
jsonObj.put("age",intAge);
jsonObj.put("birth",nowYear-intAge+1);

//3.JSONObject을 출력
out.print(jsonObj.toJSONString());
%>