<%@page import="day1128.ParamDTO"%> <%@page
import="kr.co.sist.user.member.WebMemberService"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include
file="../fragments/siteProperty.jsp"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ include
file="../fragments/loginChk2.jsp"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta
      name="author"
      content="Mark Otto, Jacob Thornton, and Bootstrap contributors"
    />
    <meta name="generator" content="Astro v5.13.2" />
    <title>JSP 템플릿</title>

    <link
      rel="shortcut icon"
      href="${pageContext.request.contextPath}/common/images/favicon.ico"
    />
    <script src="${pageContext.request.contextPath}/common/js/color-modes.js"></script>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>

    <meta name="theme-color" content="#712cf9" />
    <link
      href="${pageContext.request.contextPath}/common/css/carousel.css"
      rel="stylesheet"
    />

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: #0000001a;
        border: solid rgba(0, 0, 0, 0.15);
        border-width: 1px 0;
        box-shadow: inset 0 0.5em 1.5em #0000001a,
          inset 0 0.125em 0.5em #00000026;
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -0.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;
        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .bi {
        width: 1em;
        height: 1em;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>
    <style type="text/css">
      #wrap {
        margin: 0px auto;
        width: 1200px;
        height: 1000px;
      }

      #header {
        height: 150px;
      }

      #container {
        height: 700px;
      }

      #footer {
        height: 150px;
      }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script type="text/javascript">
      /* [수정됨] jQuery 부분도 $로 처리 */
      $(function () {
        //업로드 버튼 처리
        $("#btnUpload").click(function () {
          $("#upfile").click(); //파일을 선택하면파일이변경 /(change event 발생)
        });
        //파일선택시 미리보기
        $("#upfile").change(function (evt) {
          //1. HTML File Control 접근
          var file = evt.target.files[0]; //<input type="file"
          //2. 파일을 읽기위한 스트림 생성
          var reader = new FileReader();
          //3. File객체의 onload 이벤트 핸들러를 설정하여 <img 태그에 src속성에 파일명을 설정
          reader.onload = function (evt) {
            $("#preview").prop("src", evt.target.result);
          };
          //4.스트림을사용하여 <img 태그 이미지를 로딩
          reader.readAsDataURL(file);
          $("#selectFile").html($("#upfile").val());

          //파일이변경되면 hidden에 선택한 파일명을반영
          $("#profile").html($("#upfile").val());
        });

        $("#btn").click(function () {
          if (confirm("회원정보를 수정하시겠습니가")) {
            $("#modifyFrm").submit();
          }
        });
      });
    </script>
  </head>
  <body>
    <header data-bs-theme="dark">
      <jsp:include page="../fragments/header.jsp" />
    </header>
    <main>
      <jsp:include page="../fragments/carousel.jsp" />

      <div class="container marketing">
        <hr class="featurette-divider" />
        <div class="row featurette">
          <div class="col-md-7">
            <% //String id=(String)session.getAttribute("userId"); 
            String id ="testsdfg";//테스트용 하드코딩 위에 로그인체크막아두고
            WebMemberService wms = WebMemberService.getInstance(); 
            ParamDTO pDTO= wms.searchMember(id); 
            // 이메일 파싱 - null 체크 및 @ 기호 존재여부 확인 
            String selectMail = pDTO != null ? pDTO.getEmail() : null;
            String email = ""; String domain = ""; // selectMail이 null이 아니고@ 기호가 포함되어 있는 경우에만 파싱 
            if(selectMail != null &&selectMail.indexOf("@") > 0) { email = selectMail.substring(0,selectMail.indexOf("@")); 
            domain =selectMail.substring(selectMail.indexOf("@") + 1);
            } else
            if(selectMail != null) { // @ 기호가 없는 경우 전체를 email로 처리(암호화된 데이터일 수 있음) email = selectMail;
            System.out.println("[mypage.jsp] 이메일 형식 오류 - @ 기호 없음: " +
            selectMail); } pageContext.setAttribute("pDTO", pDTO);
            pageContext.setAttribute("email", email);
            pageContext.setAttribute("domain", domain); %>
            <h2>회원정보수정</h2>
            <form
              name="modifyFrm"
              method="post"
              id="modifyFrm"
              action="mypageProcess.jsp"
              enctype="multipart/form-data"
            >
              <table id="joinFrm">
                <tr>
                  <td class="title">
                    <label><span class="star">*</span>아이디</label>
                  </td>
                  <td class="input">
                    <strong><c:out value="${ sessionScope.userId }" /></strong>
                  </td>
                </tr>
                <tr>
                  <td class="input" colspan="2">
                    <img
                      src="${ CommonURL }/upload/${ pDTO.profile }"
                      id="preview"
                      style="width: 100px; height: 100px; border-radius: 50px"
                    /><br />
                    <input
                      type="file"
                      accept="image/*"
                      name="upfile"
                      id="upfile"
                      style="display: none"
                    /><br />
                    <input
                      type="button"
                      value="업로드"
                      class="btn btn-success bnt-sm"
                      id="btnUpload"
                    /><br />
                    <input
                      type="hidden"
                      name="profile"
                      id="profile"
                      value="${pDTO.profile }"
                    /><br />
                  </td>
                </tr>

                <tr>
                  <td class="title">
                    <label><span class="star">*</span>비밀번호</label>
                  </td>
                  <td class="input">
                    <input
                      type="password"
                      class="inputBox"
                      name="pass"
                      value="${sessionScope.pass  }"
                    />
                  </td>
                </tr>
                <tr>
                  <td class="title">
                    <label><span class="star">*</span>이름</label>
                  </td>
                  <td class="input">
                    <input
                      type="text"
                      name="name"
                      class="inputBox"
                      value="민병조"
                    />
                  </td>
                </tr>
                <tr>
                  <td class="title">
                    <label><span class="star">*</span>이메일</label>
                  </td>
                  <td class="input">
                    <input
                      type="text"
                      name="email"
                      class="inputBox"
                      value="test"
                    />@<select name="domain">
                      <option value="google.com">google.com</option>
                      <option value="naver.com">naver.com</option>
                      <option value="daum.net">daum.net</option>
                      <option value="hotmail.com">hotmail.com</option>
                      <option value="test.com">test.com</option>
                    </select>
                    <script type="text/javascript">
                      $("#domain").val("${domain}"); // 따옴표 추가
                    </script>
                  </td>
                </tr>
                <tr>
  <td class="title"><label>원본 이메일(디버깅)</label></td>
  <td class="input" style="color: red;">
    <c:out value="${pDTO.email}" default="이메일 없음" />
  </td>
</tr>

                <tr>
                  <td class="title">
                    <label><span class="star">*</span>생일</label>
                  </td>
                  <td class="input">
                    <input
                      type="date"
                      name="birth"
                      class="inputBox"
                      value="${pDTO.birth }"
                    />
                  </td>
                </tr>

                <tr>
                  <td class="title">
                    <label><span class="star">*</span>소재지</label>
                  </td>
                  <td class="input">
                    <select
                      name="loc"
                      class="inputBox"
                      id="loc"
                      style="width: 120px; height: 25px"
                    >
                      <option value="N/A">선택해주세요</option>
                      <option value="강원">강원</option>
                      <option value="경기">경기</option>
                      <option value="경남">경남</option>
                      <option value="경북">경북</option>
                      <option value="광주">광주</option>
                      <option value="대구">대구</option>
                      <option value="대전">대전</option>
                      <option value="부산">부산</option>
                      <option value="서울">서울</option>
                      <option value="울산">울산</option>
                      <option value="인천">인천</option>
                      <option value="전남">전남</option>
                      <option value="전북">전북</option>
                      <option value="제주">제주</option>
                      <option value="충남">충남</option>
                      <option value="충북">충북</option>
                      <option value="제주">제주</option>
                      <option value="해외">해외</option>
                    </select>
                    <script type="text/javascript">
                      $("#loc").val("${pDTO.loc}");
                    </script>
                  </td>
                </tr>
                <tr>
                  <td class="title">소개</td>
                  <td>
                    <textarea name="intro" style="width: 400px; height: 100px">
										<c:out value="${pDTO.intro}" />
										</textarea
                    >
                  </td>
                </tr>
                <tr>
                  <td colspan="2" style="text-align: center">
                    <input type="hidden" name="code" value="U3881" />
                    <input
                      type="button"
                      value="변경"
                      class="btn btn-success"
                      id="btn"
                    />
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <hr class="featurette-divider" />
      </div>

      <footer class="container">
        <jsp:include page="../fragments/footer.jsp" />
      </footer>
    </main>
  </body>
</html>
