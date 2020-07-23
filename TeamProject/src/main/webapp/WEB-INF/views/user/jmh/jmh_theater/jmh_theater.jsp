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
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"> -->
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jmh_js/jmh_js.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x6srghvj2m"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d529ea1db0e086a23e9af7cd6835f42e&libraries=services"></script>
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
 
 .theaterHover:hover {
 	color:orange;
 	cursor:pointer;
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
	
	$(".cloneDiv").find("a").attr("data-movie-date",data_event_date);
	
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
		var data_event_date = check(year,month,(day + dateIndex));
		cloneTimeDiv.find("a").attr("data-movie-date",data_event_date);
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
	
	
	
	
	// 영화관 상세보여주기
	$(".theaterInfos").click(function(e) {
		e.preventDefault();
		$(".theaterInfos").css("color", "black");
		$(this).css("color","red");
		
		$("#theaterNameDiv ul").find("li").remove();
		
		
		var area_code = $(this).attr("data-area-code");
		var url = $(this).parent().find("a").attr("href");
		var sendData = {"area_code" : area_code};
		
		$.get(url, sendData, function(rData) {
			$.each(rData, function() {
				var theater_name = this.theater_name;
				var theater_code = this.theater_code;
				html = "<li style='padding:5px;' class='theaterHover theaterCode' data-theater-code='"+theater_code+"'><a>"+theater_name+"</a></li>";
				$("#theaterNameDiv > ul").append(html);
			});
			$("#theaterNameDiv").removeAttr("style");
			
		});
	});
	
	// 영화관코드 가져오기
	$("#theaterAction").on("click", ".theaterCode", function () {
		var theater_code = $(this).attr("data-theater-code");
		
		location.href="/jmh/theater/theaterView?theater_code="+ theater_code;
	});
});

</script>
<script>
$(function () {
	var x =0 ;
	var y =0 ;

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	var address = $("#address").val();
	geocoder.addressSearch(address, function(result, status) {
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
		 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		 x = result[0].x;
		 y = result[0].y;

		} 
	// 네이버 지도 관련
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(y, x),
		    zoom: 15
		});
		
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(y, x),
		    map: map
		});	
	}); 
	
	
	var v = 0;
	// 데이터 비교
	var movie_code_list = "${mTheaterDto}";
	
	$.each($(".movie_name_info"), function() {
		var title_movie_code = $(this).attr("data-movie-code");
		
		var movie_list_clone = $(this).clone().addClass("clone" + v);
		movie_list_clone.css("display", "block");
		$("#movieInfo").append(movie_list_clone);
		var div_wrap = "<div class='row list_wrap"+v+"'></div>";
		$(".clone" + v).after(div_wrap);
		
		$.each($(".movie_schedule_info"), function() {
			var content_movie_code = $(this).attr("data-movie-code");
			if(title_movie_code == content_movie_code) {
				
				var movie_time_list_clone = $(this).clone();	
				movie_time_list_clone.css("display", "block");
				$(".list_wrap" + v).append(movie_time_list_clone);
				// 내용물
				// 내용물 붙이기
			}
		});
		
		v++;
	
	});
	
	// --------------- 일자 클릭했을 경우 -----------------
	a = 0;
	// 일자 ajax 요청
	$(".link_btn").click(function (e) {
		e.preventDefault();
		$("#movieInfo").children().remove();
		$("#temp_div").children().remove();
		var movie_date = $(this).attr("data-movie-date");
		var theater_code = $("#theater_code").val();
		// ajax 요청
		var url = "/jmh/theater/dateGetMovieData";
		var sendData = {"movie_date" : movie_date, "theater_code" : theater_code};
		
		
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"async" : false,
			"success" : function(rData) {
				$.each(rData, function() {
					var movie_code = (this).movie_code;
					var movie_grade = (this).movie_grade;
					var movie_name = (this).movie_name;
					
					// 복사
					var cloneNameInfo = $(".movie_name_info").eq(0).clone();
					
					cloneNameInfo.addClass("movie_name_info2");
					cloneNameInfo.attr("data-movie-code", movie_code);
					cloneNameInfo.find("img").attr("src", "/resources/images/jmh/movie_grade_" + movie_grade + ".png");
					cloneNameInfo.find("span").text(movie_name);
					cloneNameInfo.css("display", "block");
					$("#temp_div").append(cloneNameInfo);
				}); // each
			}
		
		});
		
		
		// 영화 상세정보 가져오기
		var url = "/jmh/theater/dateGetMovieSubData";
		var sendData = {"movie_date" : movie_date, "theater_code" : theater_code};
			$("#temp_sub_div").children().remove();
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"async" : false,
			"success" : function(rData) {	
				console.log(rData);
				$.each(rData, function () {
					var movie_code1 = (this).movie_code;
					var start_time = (this).start_time;
					var rmn_sts = (this).rmn_sts;
					var screen_total_seat = (this).screen_total_seat;
					var screen_name = (this).screen_name;
					
					var cloneMovieSubUl = $(".movie_schedule_info").eq(0).clone();
					cloneMovieSubUl.css("display", "block");
					cloneMovieSubUl.addClass("movie_schedule_info2");
					cloneMovieSubUl.attr("data-movie-code", movie_code1);
					cloneMovieSubUl.find("strong").text(rmn_sts);
					cloneMovieSubUl.find("span").eq(0).text(start_time);
					cloneMovieSubUl.find("span").eq(1).text(screen_total_seat);
					cloneMovieSubUl.find("dd").last().text(screen_name);
					$("#temp_sub_div").append(cloneMovieSubUl);
				}); 
			}
		}); // get end
		
		
		$.each($(".movie_name_info2"), function() {
			var title_movie_code = $(this).attr("data-movie-code");
			var movie_list_clone = $(this).clone().addClass("clone" + a);
			movie_list_clone.css("display", "block");
			$("#movieInfo").append(movie_list_clone);
			var div_wrap = "<div class='row list_wrap"+a+"'></div>";
			$(".clone" + a).after(div_wrap);
			
			$.each($(".movie_schedule_info2"), function() {
				var content_movie_code = $(this).attr("data-movie-code");
				console.log("content_movie_code :" + content_movie_code);
				if(title_movie_code == content_movie_code) {
					
					var movie_time_list_clone = $(this).clone();	
					movie_time_list_clone.css("display", "block");
					$(".list_wrap" + a).append(movie_time_list_clone);
				}
			});
			a++;
		});
		
	});
		
});
</script>

<body class="js">
<div id="temp_div"></div>
<div id="temp_sub_div"></div>
<!--  복사할 제목&등급 -->
<c:forEach items="${mTheaterDto}" var="mTDto">
	<div class="movie_name_info" data-movie-code='${mTDto.movie_code}' style="display:none;">
		<div class="row" style="margin-top:30px;">
			<img src="/resources/images/jmh/movie_grade_${mTDto.movie_grade}.png"/>
			<span class="fa-2x spam_name" style="padding-top:15px;">${mTDto.movie_name}</span>
		</div>
	</div>
</c:forEach>
<!-- end  복사할 제목&등급 -->

<!--  복사할 영화정보 -->
<div class="row" >
	<c:forEach items="${tScheduleVo}" var="tSvo">
		<ul style="width:200px; text-align:center;display:none;" class="movie_schedule_info" data-movie-code='${tSvo.movie_code}' >
			<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
				<dl>
					<dt style="display:none;">상영시간</dt>
					<dd>
						<span class="fa fa-3x" style="padding-top:10px;">${tSvo.start_time}</span>
					</dd>
					<dt style="display:none;">잔여석</dt>
					<dd style="float:left;padding-left:15px;">
						<strong>${tSvo.rmn_sts}</strong>  / <span>${tSvo.screen_total_seat}</span>
					</dd>
					<dt style="display:none;">상영관</dt>
					<dd>${tSvo.screen_name}</dd>
				</dl>
			</li>
		</ul>
	</c:forEach>
</div>
<!--  복사할 영화정보 -->
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
								<input type="hidden" value="${mTheaterVo.theater_code}" id="theater_code"/>
									<h1 class="blog-title fa-4x">${mTheaterVo.theater_name}</h1>
									<div class="blog-meta">
										<span><i class="fa fa-film"> 총 상영관 수 :</i></span> 
										<span id="theater_count">${screenCount}관</span> 
										<span><i class="fa fa-user"> 총 좌석수 :</i></span> 
										<span id="seat_count">${totalSeat}석</span>
									</div>
									<!--  각종 안내(모달창) -->
									<div class="blog-meta">
									<input type="hidden" value="${mTheaterVo.theater_address}" id="address"/>
										<p>${mTheaterVo.theater_address}</p><br/>
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
					<div class="main-sidebar" style="height:550px;">
					<!--  검색창 -->
						<div class="single-widget search">
							<div class="form">
								<input type="text" placeholder="검색할 영화관 입력"> <a
									class="button" href="#"><i class="fa fa-search"></i></a>
							</div>
						</div>
						<!-- 오른쪽 side bar 안내 -->
						<div class="single-widget category" id="theaterAction">
							<h3 class="title">영화관 안내</h3>
							<div style="width:100px;height:200px;float:left;">
							<ul style="font-size:20px;">
								<c:forEach items="${areaVo}" var="areavo">
									<li style="padding:5px;" class="theaterHover theaterInfos" data-area-code="${areavo.area_code}"><a href="/jmh/theater/theaterInfo">#${areavo.area_name}</a></li>
								</c:forEach>
							</ul>
							</div>
							<!--  영화관 상세이름 나오는 곳 -->
							<div id="theaterNameDiv" style="display:none;">
							<ul style="font-size:15px;" id="theaterNameUl">
							</ul>
							</div>
							<!--  end 영화관 상세이름 나오는 곳 -->
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
		<div class="row" style="background-color:#f8f8f8;">
			<img src="/resources/images/jmh/movie_grade.png"/>
			<a id="modal-458339" href="#modal-container-458339" role="button"  data-toggle="modal"><img src="/resources/images/jmh/movie_grade_info.png"/></a>
		</div>
		<!--  영화 정보 붙이는 곳 -->
		<div id="movieInfo">
			
			
		</div>
		
<!-- 		<div> -->
			<!--  관람등급 안내 -->
<!-- 			<div class="row" style="background-color:#f8f8f8;"> -->
<!-- 				<img src="/resources/images/jmh/movie_grade.png"/> -->
<!-- 				<a id="modal-458339" href="#modal-container-458339" role="button"  data-toggle="modal"><img src="/resources/images/jmh/movie_grade_info.png"/></a> -->
<!-- 			</div> -->
			<!--  end 관람등급 안내 -->
			
				<!--  반복문 시작 -->
<%-- 				<c:forEach items="${mTheaterDto}" var="mTDto"> --%>
<!-- 				<div class="row" style="margin-top:30px;"> -->
<!-- 					<img src="/resources/images/jmh/movie_grade_12.png"/> -->
<%-- 					<span class="fa-2x" style="padding-top:15px;">${mTDto.movie_name}</span> --%>
<!-- 				</div> -->
			<!-- end 영화 제목 -->
<!-- 				<div class="row"> -->
			<!--  영화 회차별 반복 -->
<%-- 					<c:forEach items="${tScheduleVo}" var="tSvo"> --%>
<!-- 					<ul style="width:200px; text-align:center;"> -->
<!-- 						<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;"> -->
<!-- 							<dl> -->
<!-- 								<dt style="display:none;">상영시간</dt> -->
<!-- 								<dd> -->
<%-- 									<span class="fa fa-3x" style="padding-top:10px;">${tSvo.start_time}</span> --%>
<!-- 								</dd> -->
<!-- 								<dt style="display:none;">잔여석</dt> -->
<!-- 								<dd style="float:left;padding-left:15px;"> -->
<%-- 									<strong>82</strong>  / ${tSvo.screen_total_seat} --%>
<!-- 								</dd> -->
<!-- 								<dt style="display:none;">상영관</dt> -->
<%-- 								<dd>${tSvo.screen_name}</dd> --%>
<!-- 							</dl> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<%-- 					</c:forEach> --%>
					<!-- end 영화 회차별 반복 -->
<!-- 				</div> -->
				<!--  반복문 끝 -->
<%-- 				</c:forEach> --%>
		<!--  영화 하나 끝 -->
<!-- 		</div> -->
	</div>
</section>

</body>
<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</html>