<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>
</head>
<body>
   <header data-bs-theme="dark">
      <jsp:include page="../fragments/header.jsp" /> 
   </header>
   <main>
      <jsp:include page="../fragments/carousel.jsp"/>
      <div class="container marketing">
         <hr class="featurette-divider">
         <div class="row featurette">
            <div class="col-md-7">
               <strong>el에서제공하는 연산자</strong>
               <ul>
               <li><strong>산술연산자</strong>
               <li>11+28=${11+28 }</li>
               <li>11*28=${11*28 }</li>
               <li>10을 2로 나눈 나머지 =${10%2 }(${10 mod 2 })</li>
               <li><strong>관계연산자</strong>
               <li>5 &gt; 4=${ 5 > 4 }(${5 gt 4 })</li>
               <li>5 &lt; 4=${ 5 < 4 }(${5 lt 4 })</li>
               <li>5 &gt;= 4=${ 5 >= 4 }(${5 ge 4 })</li>
               <li>5 &lt;= 4=${ 5 <= 4 }(${5 le 4 })</li>
               <li>5 ==4 =${5 == 4 }(${5 eq 4 })</li>
               <li>5 !=4 =${5 != 4 }(${5 ne 4 })</li>
               <li><strong>논리연산자</strong>
               <li> 5 &gt; 4 &amp;&amp; 4 &lt; 5=${5>4 && 4<5 }(${5 gt 4 and 4 lt 5 })
               <li> 5 &gt; 4 || 4 &lt; 5=${5>4 || 4<5 }(${5 gt 4 or 4 lt 5 })
               <li><strong>단항연산자</strong>
               <li> !(5 &gt; 4 &amp;&amp; 4 &lt; 5) =${!(5>4 && 4<5) }(${not(5 gt 4 and 4 lt 5) })
               <li><strong>삼항연산자</strong>
 			   <li>10은 =${10%2==0 ? "짝수":"홀수" } (${10 mod 2 eq 0 ? '짝수':'홀수' })	             	
 			   <%
 			   String temp=null;
 			   String temp2="";
 			   List<String> list=new ArrayList();
 			  
 			   pageContext.setAttribute("temp",temp);
 			   pageContext.setAttribute("temp2",temp2);
 			   pageContext.setAttribute("list",list);
 			   %>
 			   <li><strong>el에서는 null을 출력하지않는다</strong>
 			   <li>temp = ${temp }<%= temp %></li>
 			   <li>empty 연산자</li>
 			   <li>temp2가 ""? ${empty temp2 }</li>
 			   <li>ㅣlist에방으갯수가0인가 ? ${empty list }</li>
               </ul>
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