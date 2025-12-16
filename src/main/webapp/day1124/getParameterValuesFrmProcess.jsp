<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//post 방식일때의 한글처리
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<strong><%= request.getMethod() %></strong>방식요청
<% 
//web parmeter의 이름이같다면 배열로처리
String[] lang=request.getParameterValues("language");
//formcontrol이하나일지라도 getparametervalues로 받을수 있다
String[] license=request.getParameterValues("license");
%>
<strong>선택언어</strong>
<%
//try{
if(lang!=null){
for(int i=0; i<lang.length;i++){
	%>
	<%= lang[i] %>
	<%
}
}else{
//}catch(NullPointerException npe){
%>관심언어가없습니다<%
//}//endcatch
}
%>
<br>
<strong>자격증</strong>
<%
if(license.length==1&&license[0].trim().isEmpty()){
	%>자격증이없어요<%
	}
for(int i=0; i<license.length;i++){
	%>
	<%= license[i] %>
	<%
}
%>   
</div>
</body>
</html>