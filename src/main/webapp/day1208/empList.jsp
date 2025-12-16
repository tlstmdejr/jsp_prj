<%@page import="kr.co.sist.emp.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$("#btn").click(function(){
		if($("#dept").val() !="N/A"){
			searchEmp();
		}//end if
	});
});
function searchEmp(){
	var param={deptno:$("#dept").val()};//부서번호가져오기
	$.ajax({
		url: "http://localhost/jsp_prj/day1208/empData.jsp",
		type:"GET",
		data: param,
		dataType:"JSON",
		error:function(xhr){
			alert("죄송합니다. 잠시후 다시 시도해주세요.")
			console.log(xhr.status);
		},
		success:function(jsonObj){
			$("#pubDate").html(jsonObj.pubDate);
			$("#empCnt").html(jsonObj.dataLength);
			
			//
			var jsonArr=jsonObj.empData;
			
			var createTr="";
			$("#tab>tbody").empty();//tbody내의 모든 자식노드(태그)를 삭제
			$.each(jsonArr,function(ind,jsonTemp){
				createTr="<tr><td>"+(ind+1)+"</td><td><a href='javascript:empDetail("+
						jsonTemp.empno+")'>"+jsonTemp.ename+"</a></td><td>"+
						jsonTemp.job+"</td><td>"+jsonTemp.sal+"</td><td>"+
						jsonTemp.hiredate+"</td><td>"+jsonTemp.hiredateStr+"</td></tr>";
					$("#tab>tbody:last").append(createTr);	
			
									
				
			});
		}
	})
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
            EmployeeService es=EmployeeService.getInstance();
            pageContext.setAttribute("deptList",es.searchAllDept());
            %>
               <strong>사원정보 조회</strong>
               <div>
               <label>부서</label>
               <select id= "dept" style="height:30px">
               <option value="N/A">-----부서 선택 ---</option>
               <c:forEach var="deptDTO" items="${deptList }" varStatus="i">
               <option value="${deptDTO.deptno }"><c:out value="${deptDTO.dname }"/></option>
               </c:forEach>
               </select>
               <input type="button" value="검색" class="btn btn-success btn-sm" id="btn"/>
               </div>
            </div>
            <div id="output">
            <div>조회일자:<span id="pubDate">0000-00-00</span>/ 사원수[<span id="empCnt">0</span>]</div>
            <table id="tab" class="table table-hober">
			<thead>
			<tr>
			<th>번호</th>
			<th>사원명</th>
			<th>직무</th>
			<th>연봉</th>
			<th>입사일1</th>
			<th>입사일2</th>
			</tr>
			</thead>	
			<tbody>
			
			</tbody>		    
            </table>
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