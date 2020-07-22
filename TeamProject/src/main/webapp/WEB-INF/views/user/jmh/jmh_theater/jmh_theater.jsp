<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">
<!--  tag_and_styleSheet include -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/user/jmh/jmh_modal/modal.jsp"%>

<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!--  지도관련 파일 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jmh_js/jmh_js.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x6srghvj2m"></script>
<style>
#theater_count {
	padding-right: 20px;
}
 .divEvent { 
 	float : left; 
 } 
 .content_padding {
 	padding-right: 20px;
 }
 .timeCss {
 	float:left;
 	margin:20px;
 }
 .marginCss {
 	margin-left:100px;
 }
 
 .timeCss > ul > li {
 	text-align:center;
 }
 .product {
 	margin-left:20px;
 	margin-top : 20px;
 }
 .information_css {
 	color:white;
 	padding-left:5px;
 }
 .cloneDiv:hover {
 	background-color:#FACC2E;
 }
 
</style>
<script>
$(function() {
	
	// 현재 시간 및 날짜
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 월
	var day = date.getDate(); // 일
	var dayint = date.getDay(); // 요일 0~6
//  현재 달의 일 수 구하기
	var dateCount = new Date(year, month, 0).getDate();
	
	var dayArray = new Array("일","월","화","수","목","금","토");
	// Ul 첫번째꺼 설정
	$(".cloneDiv").find("li").eq(1).text(day); // 일
	$(".cloneDiv").find("li").eq(2).text("오늘"); // 요일
	$(".cloneDiv").find("li").eq(0).text(month);
	$(".cloneDiv").find("li").eq(0).attr("data-index", 0);
	$(".cloneDiv").find("a").eq(0).addClass("link_btn");
	
	var data_event_date = check(year,month,day);
	
	$(".cloneDiv").find("a").attr("data-event-date",data_event_date);
	
	var dayintIndex = dayint + 1;// 요일인덱스
	var dateIndex = 1; // 일 수 인덱스
	for(var i = 1; i < 28; i++) {
		var cloneTimeDiv = $(".cloneDiv:first").clone();
		// -- 날짜 --
		if(day + dateIndex > dateCount) {
			month++;
			dateIndex = 0;
			day = 1;
		}
		cloneTimeDiv.find("li").eq(1).text(day + dateIndex);
		dateIndex++;
		
		// --요일--
		if(dayintIndex > 6) {
			dayintIndex = 0;
		}
		// 토요일 글꼴색상 수정
		if(dayintIndex == 6) {
			cloneTimeDiv.find("li").eq(1).css("color","blue");
			cloneTimeDiv.find("li").eq(2).css("color","blue");
		}
		// 일요일 글꼴색상 수정
		if(dayintIndex == 0) {
			cloneTimeDiv.find("li").eq(1).css("color","red");
			cloneTimeDiv.find("li").eq(2).css("color","red");
		}
		// 월 넣어두기
		cloneTimeDiv.find("li").eq(0).text(month);
		// 요일 넣기
		cloneTimeDiv.find("li").eq(2).text(dayArray[dayintIndex]);
		dayintIndex ++;
		// index 넣어두기
		cloneTimeDiv.find("li").eq(0).attr("data-index", i);
		//서버전송 데이터 넣기
		var data_event_date = check(year,month,day);
		cloneTimeDiv.find("a").attr("data-event-date",data_event_date);
		
		
		// a 클래스 부여하기
		cloneTimeDiv.find("a").eq(1).addClass("link_btn");
		
		// 붙이기
		$("#appendDiv").append(cloneTimeDiv);	
		
	}
	// 월 나타내기 - 6번째껄로
	var monthText = $("#appendDiv").find(".cloneDiv").eq(6).find("li:first").text();
	$("#monthSpan").text("[ " + monthText + "월 ]");
	
	var checkState = 1;
	// 상영시간표 왼쪽으로 이동
	$("#btnLeftShow").click(function() {
		console.log(checkState);
		switch(checkState) {
		case 0 :
			$("#appendDiv").css("transform", "translate(0px)");
			$("#btnRightShow").css("pointer-events", "auto");
			$(this).css("pointer-events", "none");
			var monthText = $("#appendDiv").find(".cloneDiv").eq(6).find("li:first").text();
			$("#monthSpan").text("[ " + monthText + "월 ]");
			checkState = 1;
			break;
		case 1 :
			$("#appendDiv").css("transform", "translate(-770px)");
			$("#btnRightShow").css("pointer-events", "auto");
			$(this).css("pointer-events", "none");
			var monthText = $("#appendDiv").find(".cloneDiv").eq(20).find("li:first").text();
			$("#monthSpan").text("[ " + monthText + "월 ]");
			console.log(monthText);
			checkState = 0;
			break;
		}
	});
	
	// 상영시간표 오른쪽으로 이동
	$("#btnRightShow").click(function() {
		console.log(checkState);
		switch(checkState) {
		case 0 :
			$("#appendDiv").css("transform", "translate(0px)");
			$("#btnLeftShow").css("pointer-events", "auto");
			$(this).css("pointer-events", "none");
			var monthText = $("#appendDiv").find(".cloneDiv").eq(6).find("li:first").text();
			$("#monthSpan").text("[ " + monthText + "월 ]");
			checkState = 1;
			break;
		case 1 :
			$("#appendDiv").css("transform", "translate(-770px)");
			$("#btnLeftShow").css("pointer-events", "auto");
			$(this).css("pointer-events", "none");
			var monthText = $("#appendDiv").find(".cloneDiv").eq(20).find("li:first").text();
			$("#monthSpan").text("[ " + monthText + "월 ]");
			checkState = 0;
			break;
		}
	});
	// ---------------- 상영시간표 끝
	
	// 상영일 ajax요청
	$(".link_btn").click(function(e) {
		e.preventDefault();
		var data_total_date = $(this).find("li").attr("data-total-date");
		console.log(data_total_date);
	});
	
});
// 지도 관련
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 15
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map
});



</script>

<body class="js">
	<section class="hero-slider">
		<!-- Single Slider -->
		<div style="background-color: black;">
			<div>
				<!--  메인이미지랑 같게 -->
				<img src="/resources/images/main2.jpg"
					style="height: 100%; width: 100%;" />
			</div>
		</div>
		<!--/ End Single Slider -->
	</section>
	<!-- Start Blog Single -->
	<section class="blog-single section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="blog-single-main">
						<div class="row">
							<div class="col-12">
								<!--  메인이미지 가져오기 -->
								<div class="image">
									<img src="/resources/images/jmh/theater.png" alt="상영관이미지">
								</div>
								<!--  영화관 정보 -->
								<div class="blog-detail">
									<h1 class="blog-title fa-4x">울산 삼산점</h1>
									<div class="blog-meta">
										<span><i class="fa fa-film"> 총 상영관 수 :</i></span> 
										<span id="theater_count">15관</span> 
										<span><i class="fa fa-user"> 총 좌석수 :</i></span> 
										<span id="seat_count">155석</span>
									</div>
									<!--  각종 안내(모달창) -->
									<div class="blog-meta">
										<p>울산광역시 남구 삼산동(영화관주소)</p><br/>
										<span class="content_padding">
											<a id="modal-458336" href="#modal-container-458336" role="button" class="btn" data-toggle="modal">
												<img src="/resources/images/jmh/bus.png" /><label class="information_css">대중교통안내</label>
											</a>
										</span> 
										<span class="content_padding">
											<a id="modal-458337" href="#modal-container-458337" role="button" class="btn" data-toggle="modal">
												<img src="/resources/images/jmh/parking.png" /><label class="information_css">주차 안내</label> 
											</a>
										</span> 
										<!--  지도 해야함 -->
										<span class="content_padding">
											<a id="modal-458338" href="#modal-container-458338" role="button" class="btn" data-toggle="modal">
												<img src="/resources/images/jmh/map.png" /><label class="information_css">지도 안내</label> 
											</a>
										</span>
									</div>
									<div class="content">
										<h2 class="blog-title">이벤트</h2>
									</div>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-12">
					<div class="main-sidebar">
					<!--  검색창 -->
						<div class="single-widget search">
							<div class="form">
								<input type="text" placeholder="검색할 영화관 입력"> <a
									class="button" href="#"><i class="fa fa-search"></i></a>
							</div>
						</div>
						<!-- 오른쪽 side bar 안내 -->
						<div class="single-widget category">
							<h3 class="title">영화관 안내</h3>
							<ul class="categor-list">
								<c:forEach items="${areaVo}" var="areavo">
									<li><a href="#" data-area-code="${areavo.area_code}">${areavo.area_name}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		<div>
		<!--  이벤트창 -->
		<div class="row">
			<div class="blog-meta">
				<!--  db 이벤트 읽어오기 -->
				<c:forEach items="${eventVo}" var="eventList">
					<div class="image divEvent">
						<ul>
							<li>
								<a href="/event/selectEvent?event_code=${eventList.event_code}">
								<img src="/upload/displayFile?fileName=${eventList.event_thumb_image}" class="content_padding"/>
								</a>
							</li>
							<li class="fa-stack-1x">${eventList.event_title}</li>
						</ul>
						<br/>
					</div>
				</c:forEach>
			</div>
		</div> <!--  end 이벤트 -->
		<!--  상영시간표 안내 -->
		<div class="row">
			<h2 class="blog-title">상영시간표</h2>
		</div>	
		<div class="row">
			<span class="fa-2x" style="padding-top:10px;padding-left:20px;" id="monthSpan"></span>
		</div>
		<div style="position:relative;">
			<!--  페이징 버튼 -->
				<!--  left_paging_btn -->
			<div style="position:absolute;">
					<button type="button" id="btnLeftShow"><img src="/resources/images/jmh/point_left.png"/></button>
			</div>
			<!--  right_paging_btn -->
			<div style="position:absolute;left:72%;">
				<button type="button" id="btnRightShow"><img src="/resources/images/jmh/point_right.PNG"/></button>
			</div>
			<div style="width:789px;margin-top:22px;margin-left:40px;margin-right:20px;margin-bottom:10px;overflow:hidden;">
				<div id="appendDiv" style="margin:10px;transform:translate(0px); width:1700px;overflow:hidden;">
					<div class="cloneDiv" style="float:left;margin-right:5px;">
						<ul style="text-align:center;">
							<div style="width:50px;"> 
								<li class="fa-1x" style="display:none;"></li>
								<a href=""><li class="fa-2x"></li></a>
								<li></li>
							</div>
						</ul>
					</div>
				</div>
			</div>
		</div>
			
		
		</div>	
		<!--  관람등급 안내 -->
		<div class="row" style="background-color:#f8f8f8;">
			<img src="/resources/images/jmh/movie_grade.png"/>
			<a id="modal-458339" href="#modal-container-458339" role="button"  data-toggle="modal"><img src="/resources/images/jmh/movie_grade_info.png"/></a>
		</div>
		<!--  end 관람등급 안내 -->
		
		<!-- 상영회차 및 시간안내 -->
		<!--  영화 하나 시작 -->
		<div class="row" style="margin-top:30px;">
			<img src="/resources/images/jmh/movie_grade_12.png"/>
			<span class="fa-2x" style="padding-top:15px;">#살아있다</span>
		</div>
		<div class="row">
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
		</div>
		<!--  영화 하나 끝 -->
		<!--  영화 하나 시작 -->
		<div class="row" style="margin-top:30px;">
			<img src="/resources/images/jmh/movie_grade_12.png"/>
			<span class="fa-2x" style="padding-top:15px;">#살아있다</span>
		</div>
		<div class="row">
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
		</div>
		<!--  영화 하나 끝 -->
	</div>
</section>

</body>
<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</html>