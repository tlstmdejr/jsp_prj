<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ sessionScope.userId == null }">
<c:redirect url="${CommonURL }/login/loginFrm.jsp"/>
</c:if> --%>

<%@ page language="java" pageEncoding="UTF-8"%>
<c:if test="${ sessionScope.userId == null }">
<c:redirect url="${ CommonURL }/login/loginFrm.jsp"/>
</c:if> 
