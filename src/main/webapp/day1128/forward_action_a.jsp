<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
List<String> names=new ArrayList<String>();
names.add("루피");
names.add("루피");
names.add("나미");
names.add("조로");
%>
<% 
//scope객체에 데이터를 할당 > scope객체 사용해서 값 받기
request.setAttribute("names", names);

String name="민병조"; //scope객체에 넘겨도 되지만 parameter로 넘기고 시푸다
int age=20;
%>
<!--parameter가 있는 경우 -->

<jsp:forward page="forward_action_b.jsp">
<jsp:param value="<%= name %>" name="name"/>
<jsp:param value="<%= age %>" name="age"/>
</jsp:forward>

