<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function result(num,num2,num3){
	alert(num+" x "+num2+" = "+(num*num2)+" / "+num3);
}
</script>
</head>
<body>
<% //scriptlet => jsp가 java로변경될때 _jspService()안데 코드가 생성된다
String name="민병조";
%>
안녕하세요? <span><%= name %></span>님
<%! int today=19; %>
<ul>
<%for(int i=0; i<10;i++){
	%>
<li><%= i %></li>
<%
}
%>
</ul>
<!-- 구구단 2단 -->
<table border="2px">
<tr>
<% for(int j=0; j<10; j++){ %>
	<td onclick="result(2,<%=j%>,<%=2*j%>)">2x<%= j%></td>
<% } %>
</tr>
</table>
<div>
구구단 모든단을 테이블로 출력
<table border="2px">
<% for(int i=2; i<10; i++){ %>
<tr>
	<%for (int j=1; j<10; j++){ %>
		<td > <%= i*j %></td>
	
	<%}/*end for*/%>
</tr>
	<%}//end for%>

</table>
</div>
</body>
</html>