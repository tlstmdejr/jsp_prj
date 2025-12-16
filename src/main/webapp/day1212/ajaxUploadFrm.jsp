<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>JSP 템플릿</title>

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
	$("#btnFile").click(function(){
		$("#upfile").click()//파일을 선택하면파일이변경 /(change event 발생)
	});
	$("#upfile").change(function(evt){
		
		//1. HTML File Control 접근
		var file= evt.target.files[0]; //<input type="file"
		//2. 파일을 읽기위한 스트림 생성
		var reader=new FileReader();
		//3. File객체의 onload 이벤트 핸들러를 설정하여 <img 태그에 src속성에 파일명을 설정
		reader.onload=function( evt ){
		$("#preview").prop("src", evt.target.result);
		}
		//4.스트림을사용하여 <img 태그 이미지를 로딩
		reader.readAsDataURL(file);
		$("#selectFile").html($("#upfile").val());
		});

		//파일이 변경되면 변경된 파일명을 div에 넣는다.
		
		/* //업로드 가능확장자는 gif,jpg,png,bmp만 가능 체크코드 작성.
		var blockExt="gif,jpg,png,bmp".split(",");
		
		var file=$("#upfile").val();
		var ext=file.substring(file.lastIndexOf(".")+1);
		
		var flag=false;
		for(var i=0; i<blockExt.length; i++){
			if(blockExt[i]==ext){
				flag=true;
			}		
		}
		if(!flag){
			alert("업로드가능한 파일은 gif,jpg,png,bmp만 가능합니다")
			return;
		}
		//파일이변경되면 변경된 파일명을 div에 넣는다
		$("#selectFile").html($("#upfile").val()); */
	$("#btnUpload").click(function(){
		if($("#upfile").val()==""){
			alert("업로더는 필수 입력");
			return;
		}

		if($("#upfile").val()==""){
			alert("파일을 선택해주세요");
			return;
		}
		$("#frm").submit();
		
				});
		$("#btnFileUpload").click(function(){
			if($("#upfile").val() == ""){
			alert("파일을 선택해주세요 .!!! ");
			return;
			}//end if
			
			//ajax로 파일 업로드
			var form=$("#frm")[0];
			var formData=new FormData(form);
			
			$.ajax({
				url:"ajaxFileProcess.jsp",
				contentType:false, //ajax의 요청방식을 binary전송 방식으로 변경
				processData:false,//ajax요청에 query String 붙지 않게 막기
				type:"post",
				data: formData,//binary전송 방식으로 설정된 form
				dataType:"JSON",
				error: function(xhr){
					alert("파일전송시 문제발생")
					},
					success: function(jsonObj){
						if(jsonObj.resultFlag){
							alert("이미지가 업로드 되었습니다.")
							$("#profile").val(jsonObj.uploadName);
						}else{
							alert("이미지 업로드실패")
						}
						}
					
					
				
			
			
	});
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
         <hr class="featurette-divider">
         <div class="row featurette">
            <div class="col-md-7">
               <h2>AJAX파일업로드</h2>
               <!--
				enctype="application/x-Www-form-urlencoded" 파라메터전송방식
				enctype="multipart/form-data" binary전송방식
				-->
		<form action="ajaxUploadFrmProcess.jsp" method="post" id="frm">
		<label>업로더</label>
		<input type="text" name="uploader" id="uploader"><br>
		<label> 대상연령</label>
		<c:forEach var="age" begin="10" end="80" step="10">
		<input type="checkbox" name="age" value="${age}">
		<c:out value="${age }대"></c:out>
		</c:forEach>
		<br>
		<label>파일</label>
		<img src="${CommonURL }/upload/default_img.png" id="preview" style="width:100px;height:100px; border-radius: 50px"/>
		<input type="button" value="파일선택" id="btnFile" class="btn btn-primary btn-sm">
		<input type="button" value="파일업로드" id="btnFileUpload" class="btn btn-info btn-sm">
		업로드는 이미지(jpg,gif,png,bmp)만 가능합니다
		<div id="selectFile"></div>
<!-- 		<input type="file" accept=".jpg, .png, .gif, .bmp" name="upfile" id="upfile" style="display:none" /><br>
 -->		
 		<input type="file" accept="image/*" name="upfile" id="upfile" style="display:none" /><br>
 		<input type="hidden" name="profile" id="profile" /><br>
		<input type="button" value="정보입력" class="btn btn-success btn-sm" id="btnUpload"/><br>
		</form>
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