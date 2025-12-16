<%@page import="kr.co.sist.user.member.WebMemberService"%>

<%@page import="day1128.ParamDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ include file="../fragments/loginChk2.jsp"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>회원정보수정</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/common/images/favicon.ico">
<script src="${pageContext.request.contextPath}/common/js/color-modes.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="${pageContext.request.contextPath}/common/css/carousel.css" rel="stylesheet">

<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem
   }
}

.b-example-divider {
   width: 100%;
   height: 3rem;
   background-color: #0000001a;
   border: solid rgba(0, 0, 0, .15);
   border-width: 1px 0;
   box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
   flex-shrink: 0;
   width: 1.5rem;
   height: 100vh
}

.bi {
   vertical-align: -.125em;
   fill: currentColor
}

.nav-scroller {
   position: relative;
   z-index: 2;
   height: 2.75rem;
   overflow-y: hidden
}

.nav-scroller .nav {
   display: flex;
   flex-wrap: nowrap;
   padding-bottom: 1rem;
   margin-top: -1px;
   overflow-x: auto;
   text-align: center;
   white-space: nowrap;
   -webkit-overflow-scrolling: touch
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
   --bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
   z-index: 1500
}

.bd-mode-toggle .bi {
   width: 1em;
   height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
   display: block !important
}
</style>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
/* [수정됨] jQuery 부분도 $로 처리 */
$(function(){
	
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
         <hr class="featurette-divider">
         <div class="row featurette">
            <div class="col-md-7">
               <h2>회원정보수정</h2>
               <%
               request.setCharacterEncoding("UTF-8");
               
               String id=(String)session.getAttribute("userId");
               //1.업로드된 파일을 장할경로 설정
               File saveDir=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
               //2.최대 크기설정
               int maxSize=1024*1024*10;//10mb
               //업로드 크기를 설정
              int uploadSize=1024*1024*600;//600mb
               //3.fileupload객체(multipartRequest)를 생성-> 생성하자마자 업로드 된다
               MultipartRequest mr=new MultipartRequest(request,saveDir.getAbsolutePath(),
  					uploadSize,"UTF-8",new DefaultFileRenamePolicy());
               
               String email=mr.getParameter("email");
               String domain=mr.getParameter("domain");
               String birth=mr.getParameter("birth");
               String loc=mr.getParameter("loc");
               String intro=mr.getParameter("intro");
               String profile=mr.getParameter("profile");//hidden
               //파일명은 파라터를받을수없벗다
           //    String fileName=mr.getParameter("upfile");
               String originalName=mr.getOriginalFileName("upfile");//원본명
  			 String fileSystemName=mr.getFilesystemName("upfile");//변경된이름
  			 
  			 System.out.println("------------["+fileSystemName+"]--------");
  			 //업로드된 파일의 크기를 얻어서 업로드가능 크기와 비교한다
  			 //파일이크다면 사용자에게 에러매세지를보여주고 파일을삭제한다
  			 File compareFile=new File(saveDir.getAbsolutePath()+File.separator+fileSystemName);
  			 boolean flag=false;
  			 if(flag=(compareFile.length()>maxSize)){
				 compareFile.delete();
				 
			 }
			ParamDTO pDTO=new ParamDTO();
			pDTO.setId(id);
			pDTO.setEmail(email+"@"+domain);
			pDTO.setBirth(birth);
			pDTO.setLoc(loc);
			pDTO.setIntro(intro);
			//프로필이미지가 선택도지 안으면 기존이미지명으로 설정되고
			//그렇지않으면서택한 파일명으로 설정된다.
			pDTO.setProfile(fileSystemName==null?profile:fileSystemName);
  			 
			WebMemberService wms=WebMemberService.getInstance();
			boolean flagModify=wms.modifyMember(pDTO);
             pageContext.setAttribute("flag", wms.modifyMember(pDTO));
             //index.jsp에서 프로필이미지를 세션에서 가져와서 보여주기때문에
             //회원정보 변경이 성공하면세션에 프로필이미지를 변경해준다
             if(flagModify){
            	 session.setAttribute("userProfile", pDTO.getProfile());
            	 session.setAttribute("userBirth", pDTO.getBirth());
             }
               %>
               <c:choose>
               <c:when test="${flag }">
               회원정보가 수정되었습니다.<br>
               <img src="${CommonURL }/upload/james.png"/>	
               <a href="${CommonURL }/index.jsp">메인화면</a>
               </c:when>
               <c:otherwise>
               회원정보 변경시 문제가 발생하였습니다.<br>
               사용중 불편을 드려 대단히 죄솧합니다
               </c:otherwise>
               </c:choose>
            </div>
         </div>
         <hr class="featurette-divider">
      </div>
      
      <footer class="container">
       <jsp:include page="../fragments/footer.jsp" />
      </footer>
   </main>
   
</body>
</html>