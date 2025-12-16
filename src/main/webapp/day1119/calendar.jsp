 <%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>JSP템플릿</title>
<link rel="shortcut icon"
	href="http://localhost:8081/jsp_prj/common/images/favicon.ico">

<script src="http://localhost:8081/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://localhost:8081/jsp_prj/common/css/carousel.css"
	rel="stylesheet">
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
.calTitle {
	font-size: 25px;
	font-weight: bold;
}

#calWrap {
	font-family: "맑은 고딕", sans-serif
}

#calHeader {
	text-align: center;
	margin-bottom: 20px
}

.sunTitle {
	width: 120px;
	text-align: center;
	color: #c7c8c9;
	background-color: #DE4f44
}

.weekTitle {
	width: 120px;
	text-align: center;
	font-weight: normal;
}

.satTitel {
	width: 120px;
	text-align: center;
	color: #c7c8c9;
	background-color: #327eef
}

th, td {
	border: 1px solid #c7c8c9;
}

#calTab {
	margin: 0px auto;
	border: 1px solid #c7c8c9;
}

a {
	text-decoration: none;
	color: #000000
}

a:hover {
	color: #c7c8c9
}

td {
	height: 80px;
	vertical-align: top;
	text-align: left;
}

.blackTd {
	background-color: #efefef
}

.sunText {
	color: #da3f35
}

.weekText {
	color: #293048
}

.satText {
	color: #307def
}

.toDayTd {
	background-color: #bacee0
}

/*오늘*/
</style>
<!-- jQuery DNS 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$function()
	{

	}
</script>
</head>

<body>
	<header data-bs-theme="dark">
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">메인</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link disabled"
							aria-disabled="true">Disabled</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<main>
		<div id="myCarousel" class="carousel slide mb-6"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
                        <rect width="100%" height="100%"
							fill="var(--bs-secondary-color)"></rect>
                     </svg>
					<div class="container">
						<div class="carousel-caption text-start">
							<h1>Example headline.</h1>
							<p class="opacity-75">Some representative placeholder content
								for the first slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
                        <rect width="100%" height="100%"
							fill="var(--bs-secondary-color)"></rect>
                     </svg>
					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
                        <rect width="100%" height="100%"
							fill="var(--bs-secondary-color)"></rect>
                     </svg>
					<div class="container">
						<div class="carousel-caption text-end">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div id="calWrap">
    <jsp:useBean id="cDTO" class="kr.co.sist.calendar.CalendarDTO" scope="page"/>
    <jsp:setProperty property="*" name="cDTO"/>

    <%
    // 2. 오늘 날짜 기준 (현재 달력 계산용)
    Calendar cal = Calendar.getInstance();
    
    // 오늘 날짜 저장 (오늘 표시용) - 불변
    int todayYear = cal.get(Calendar.YEAR);
    int todayMonth = cal.get(Calendar.MONTH) + 1;
    int todayDay = cal.get(Calendar.DAY_OF_MONTH);
    
    // 3. 파라미터가 들어왔다면 해당 날짜로 Calendar 객체 설정
    String paramYear = cDTO.getParamYear();
    String paramMonth = cDTO.getParamMonth();
    
    if(paramYear != null && paramMonth != null && !paramYear.equals("") && !paramMonth.equals("")){
        // 파라미터가 있으면 그 날짜로 세팅 (월은 0부터 시작하므로 -1 필요할 수 있으나, 로직에 따라 그대로 사용)
        // 보통 jsp에서 넘길때 1~12월을 넘기므로 -1 해줌
        cal.set(Calendar.YEAR, Integer.parseInt(paramYear));
        cal.set(Calendar.MONTH, Integer.parseInt(paramMonth) - 1);
    }
    
    // 1일로 설정 (해당 월의 달력을 그리기 위해)
    cal.set(Calendar.DAY_OF_MONTH, 1);
    
    // 화면에 보여질 년, 월 추출
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1; // 0~11 이므로 +1
    
    // 이전달, 다음달 계산
    int prevYear = nowYear;
    int prevMonth = nowMonth - 1;
    if(prevMonth == 0) { prevYear--; prevMonth = 12; }
    
    int nextYear = nowYear;
    int nextMonth = nowMonth + 1;
    if(nextMonth == 13) { nextYear++; nextMonth = 1; }
    %>

    <div id="calHeader">
        <a href="calendar.jsp?paramYear=<%=prevYear%>&paramMonth=<%=prevMonth%>">
            <span class="calTitle" title="이전월">&lt;</span>
        </a>
        
        <span class="calTitle"><%=nowYear%>-<%=nowMonth%></span>
        
        <a href="calendar.jsp?paramYear=<%=nextYear%>&paramMonth=<%=nextMonth%>">
            <span class="calTitle" title="다음월">&gt;</span>
        </a>
        
        <a href="calendar.jsp" class="btn btn-success btn-sm">오늘</a>
    </div>

    <div id="calBody">
        <table id="calTab">
            <thead>
                <tr>
                    <th class="sunTitle">일</th>
                    <th class="weekTitle">월</th>
                    <th class="weekTitle">화</th>
                    <th class="weekTitle">수</th>
                    <th class="weekTitle">목</th>
                    <th class="weekTitle">금</th>
                    <th class="satTitel">토</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <%
                // 1. 1일 앞의 공백 출력
                int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 1(일) ~ 7(토)
                for(int i = 1; i < dayOfWeek; i++) {
                %>
                    <td class="blackTd"></td>
                <%
                }
                
                // 2. 날짜 출력 (1일 부터 마지막 날까지)
                int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                
                for(int tempDay = 1; tempDay <= lastDay; tempDay++) {
                    // 요일별 색상 및 줄바꿈 계산
                    int currentWeek = cal.get(Calendar.DAY_OF_WEEK);
                    String dayColorCss = "weekText";
                    
                    if(currentWeek == Calendar.SUNDAY) dayColorCss = "sunText";
                    if(currentWeek == Calendar.SATURDAY) dayColorCss = "satText";
                    
                    // 오늘 날짜 강조 (년, 월, 일이 모두 같아야 함)
                    String toDayClass = "";
                    if(nowYear == todayYear && nowMonth == todayMonth && tempDay == todayDay) {
                        toDayClass = " toDayTd";
                    }
                %>
                    <td class="<%=dayColorCss%><%=toDayClass%>">
                        <div><%=tempDay%></div>
                    </td>
                <%
                    // 토요일이면 줄바꿈 (</tr><tr>) 단, 마지막 날이 토요일이면 줄바꿈 안함
                    if(currentWeek == Calendar.SATURDAY && tempDay != lastDay) {
                        out.println("</tr><tr>");
                    }
                    
                    // 날짜 하루 증가
                    cal.add(Calendar.DAY_OF_MONTH, 1);
                } // end for loop
                
                // 3. 뒷부분 공백 처리 (모양 예쁘게 잡기 위해, 선택사항)
                // 반복문이 끝난 시점의 cal은 다음달 1일임. 요일을 구해서 토요일까지 빈칸 채움
                int nextMonthStartWeek = cal.get(Calendar.DAY_OF_WEEK); 
                if(nextMonthStartWeek != Calendar.SUNDAY) { // 일요일이면 이미 줄바꿈 되었으므로 처리 불필요
                     for(int i = nextMonthStartWeek; i <= 7; i++) {
                         out.println("<td class='blackTd'></td>");
                     }
                }
                %>
                </tr>
            </tbody>
        </table>
    </div>
    
    <div style="margin-top:20px; text-align: center;">
        <iframe width="560" height="315"
            src="https://www.youtube.com/embed/zN8K_uE1LYg?si=2byiEtqf8fjUFXtS"
            title="YouTube video player" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    </div>
</div>
				<hr class="featurette-divider">
				<!-- /END THE FEATURETTES -->
			</div>
			<!-- /.container -->
			<!-- FOOTER -->
			<footer class="container">
				<p class="float-end">
					<a href="#">위로</a>
				</p>
				<p>
					&copy; SIST class2. &middot; <a href="#">개인정보호정책</a> &middot;
					개인정보관리 책임자 님이셈
				</p>
			</footer>
	</main>

</body>

</html>