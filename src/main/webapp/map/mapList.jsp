<%@page import="kr.co.sist.map.RastaurantDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.map.RestaurantService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../fragments/loginChk2.jsp" %>  

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>등록위치보기</title>

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
	$("btnAdd").click(function(){
	location.href="addMap.jsp";	
	});
	
	
});
</script>
<!-- 다음지도 api  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb2f53c00b8e64c485c6be56cd2f7710"></script>
<script>
var map 
var markerPosition
var marker
window.onload=function(){
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng( 37.504744228091276 , 127.05317810264785), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}//end else

// 마커가 표시될 위치입니다 
markerPosition  = new kakao.maps.LatLng(37.504744228091276 ,127.05317810264785); 

// 마커를 생성합니다
marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

	}//onload
	
function displayMarker(locPosition, message) {

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng( 37.504744228091276 , 127.05317810264785), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
function viewRestaurant(lat,lng,msg){
	
	var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geoloca
	message = '<div style="padding:5px;">'+msg+'</div>'; // 인포윈도우에 표시될
	// 마커와 인포윈도우를 표시합니다
	displayMarker(locPosition, message);
	//setCenter( lat, 1ng); //중심좌표의 이동
	//panTo(lat, 1ng);//부드럽게 이동
	///setMarker(lat, lng);
}//viewRestaurant
              
// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);     
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
            <div>
            <h2>식당 리스트</h2>
            <div id="map" style="width:100%;height:350px;"></div>
            
            <div>
            <%
            RestaurantService rs= RestaurantService.getInstance();
            String id=(String)session.getAttribute("userId");
            List<RastaurantDTO> list=rs.searchRestaurant(id);
            pageContext.setAttribute("restList", list);
            %>
            <table class="table table-hover">
            <thead>
            <tr>
            <th>번호</th>
            <th>식당명</th>
            <th>주메뉴</th>
            <th>입력일</th>
            <th></th>
            </tr>
            </thead>
			<tbody>
			<c:forEach var="rDTO" items="${restList }" varStatus="i">
			<tr>
			<td><c:out value="${i.count }"/></td>
			<td><c:out value="${rDTO.rest_name }"/></td>
			<td><c:out value="${rDTO.menu }"/></td>
			<td><c:out value="${rDTO.input_date }"/></td>
			<td><input type="button" value="보기" class="btn btn-info btn-sm"
							onclick="viewRestaurant(${rDTO.lat},${rDTO.lng },'${rDTO.rest_name }')"></td>
			</tr>				 
			</c:forEach>			
			</tbody>            
            </table>
            </div>
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