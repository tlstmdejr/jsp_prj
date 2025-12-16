<%@page import="day1216.ApiExplorer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day1216.RssDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../fragments/siteProperty.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
	
});
function requestRss(url,title){
	if(confirm(title+"의 기사를 보시겠습니까?")){
		$.ajax({
			url:url+".xml",
			type:"get",
			dataType:"xml",
			error:function(xhr){
				alert(title+"기사를 가져올수 없습니다");
				console.log(xhr.status);
			},
			success: function(xmlDoc){
				var output="";
				
				output+="<h2>"+ title+"</h2>";
				
				var itemNodes=$(xmlDoc).find("item");
				output+="기사 : <strong>"+ itemNodes.length +"</storng>건";
				var description="";
				var itemTitle="";
				$.each(itemNodes,function(ind,itemNode){
					
					itemTitle=$(itemNode).find("title").text();
					if(itemTitle.length > 40){
						itemTitle=itemTitle.substring(0,39)+" ... ";
					}
					description=$( itemNode ).find("description").text();
					if(description.length > 100){
					description=description.substring(0,99)+" ... ";
					}//end if
					output+="<div>";
					output+="<table class='table table-hover'>";
					output+="<tr><th>제목<th><th><a href='"+
							$(itemNode).find("link").text()
							+"' title='뉴스 읽기' target='blank'>"+
					itemTitle+"</th><th>작성일</th><th>"+
					$(itemNode).find("pubDate").text()+"</td></tr><tr><th>설명</th><td colspan='4'>"+
					description+"</td></tr>";
					output+="</table>";
					output+="</div>";
					
				});
				
				
				$("#output").html(output);
			}
		});
		
	}
}
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
               <%
               List<RssDTO> list=new ArrayList<RssDTO>();	
               list.add(new RssDTO("newsflesh","속보","newsflesh"));
               list.add(new RssDTO("issue","정치","issue"));
               list.add(new RssDTO("section/politics","사회","politics"));
               list.add(new RssDTO("section/economy","경제","economy"));
               list.add(new RssDTO("section/society","사회","society"));
               list.add(new RssDTO("section/international","국제","international"));
               list.add(new RssDTO("section/culture","문화","culture"));
               list.add(new RssDTO("section/entertainment","연예","entertainment"));
               list.add(new RssDTO("section/sports","스포츠","sports"));
               list.add(new RssDTO("section/weather","날씨","weather"));
               
               ApiExplorer ae=new ApiExplorer();
               //cors이슈로인하여 rss를ㄹ 자바에서 읽어들여  xml 파일로생성
               for(RssDTO rDTO : list){
            	   ae.createRss(rDTO.getUrl(),rDTO.getEngTitle());
               }
               pageContext.setAttribute("rssList", list);
               %>
               <table class="table table-hover">
               <tr>
               <c:forEach var="news" items="${rssList }">
            <td><a href="javascript:requestRss('${CommonURL}/day1216/${ news.engTitle }','${ news.title }')"><c:out value="${ news.title }"/></a>
               </c:forEach>
               </tr>
               </table>
            </div>
             <div id="output"></div>
         </div>
         <hr class="featurette-divider">
      </div>
      
      <footer class="container">
       <jsp:include page="../fragments/footer.jsp" />
      </footer>
   </main>
   
</body>
</html>