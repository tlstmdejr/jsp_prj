<%@page import="kr.co.sist.user.member.WebMemberService"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <link
      rel="shortcut icon"
      href="http://192.168.10.68/jsp_prj/common/images/favicon.ico"
    />
    <meta charset="UTF-8" />
    <title>아이디 중복확인</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
      crossorigin="anonymous"
    ></script>
    <style type="text/css">
      #wrap {
        margin: 0px auto;
        width: 480px;
        height: 380px;
      }
      #container {
        height: 380px;
        position: relative;
        background: #ffffff url(images/id_background.png) no-repeat;
      }
      #searchFrm {
        position: absolute;
        top: 180px;
        left: 100px;
      }
      #searchResult {
        position: absolute;
        top: 230px;
        left: 100px;
      }
      .fail {
        color: #ff0000;
      }
      .success {
        color: #186292;
      }
    </style>

    <script type="text/javascript">
      window.onload = function () {
        document.getElementById("btnSearch").addEventListener("click", findId);
        // 중복된 이벤트 리스너 제거함
        document.getElementById("id").addEventListener("keydown", chkEnter); // 엔터키 적용
      }; //onload

      function chkEnter(evt) {
        if (evt.which == 13) {
          findId(); // 세미콜론 추가
        }
      }

      function findId() {
        var obj = document.popupFrm; // [수정] 대소문자 일치 (HTML name="popupFrm")
        var id = obj.id.value;

        // [수정] 괄호 ')'가 빠져있던 치명적인 오류 수정
        if (id.replace(/ /g, "") == "") {
          alert("중복검사할 아이디를 입력해주세요");
          return;
        }
        obj.submit();
      } //findId

      function sendId(id) {
        // [중요] 부모창의 form name이 'joinFrm'이고 input name이 'id'여야 작동함
        // 값이 안 들어간다면 부모창 HTML을 확인하세요.
        if (opener.window.document.joinFrm) {
          opener.window.document.joinFrm.id.value = id;
          self.close();
        } else {
          alert("회원가입 창(joinFrm)을 찾을 수 없습니다.");
        }
      }
    </script>
  </head>
  <body>
    <div id="wrap">
      <div id="container">
        <div id="searchFrm">
          <form name="popupFrm" action="findId.jsp">
            <input
              type="text"
              name="id"
              id="id"
              value="${param.id }"
              style="width: 200px"
            />
            <input
              type="button"
              value="중복확인"
              class="btn btn-success btn-sm"
              id="btnSearch"
            />
          </form>
        </div>

        <c:if test="${not empty param.id }">
          <div id="searchResult">
            <% WebMemberService wmService=WebMemberService.getInstance(); //
            boolean flagId=wmService.searchId(request.getParameter("id"));
            pageContext.setAttribute("flagId",flagId); %>

            <c:set var="resultCss" value="success" />
            <c:set var="resultMsg" value="사용가능" />

            <c:if test="${flagId }">
              <c:set var="resultCss" value="fail" />
              <c:set var="resultMsg" value="사용불가능" />
            </c:if>

            입력하신 아이디 <strong>${param.id }</strong>는
            <span class="${resultCss }"><c:out value="${resultMsg }" /></span>

            <c:if test="${not flagId }">
              <a href="javascript:sendId('${param.id }')">[사용]</a>
            </c:if>
          </div>
        </c:if>
      </div>
    </div>
  </body>
</html>
