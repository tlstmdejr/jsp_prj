<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include_b.jsp" %> <!--uri 만가짐 url은 안된다  -->
<%@ include file="../fragments/loginChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="http://192.168.10.83/html_prj/common/images/favicon.ico">
<meta charset="UTF-8">
<title><%= sessionId %>님 안녕하세요</title>

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<!-- jQuery cdn 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	alert("<%= msg %>");
});
</script>
</head>
<body>
<div id="wrap">
	<div id="header">header 1200(w) x 150(h)
			사이트로고, 주력서비스, navigation bar
	 </div>
	<div id="container">
	<div>
	<!-- 다른 jsp에서 구현된 기능을 사용하는 페이지 --> 
	<a href="mineType.jsp">줘!</a>
	<div>
	다른 jsp에서 구현된 기능을 사용하는 페이지
	</div>
	<div>
	<%= msg %>
	</div>
	</div>
	</div>
	<div id="footer">footer 1200(w) x 150(h)</div>
</div>
</body>
</html>