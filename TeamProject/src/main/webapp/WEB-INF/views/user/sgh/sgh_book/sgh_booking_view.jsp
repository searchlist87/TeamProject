<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<style>
	.font {
		font-size: 30px;
	}
	.movie_list_li {
		cursor: pointer;
	}
	.movie_list_title {
		text-align: center;
	}
	.modal_content {
		margin-left: 120px;
		font-size: 20px;
		margin-bottom: 30px;
	}
	table {
		border-collapse: separate;
		border-spacing: 20px;
		width: 50%;
		margin-left: 100px;
	}
	td {
		text-align: center;
		border: 1px solid;
		border-radius: 20%;
	}
	th {
		text-align: center;
	}
	.set_prog {
		font-size: 30px;
	}
	strong {
		color: white;
	}
	
</style>
<script src="/resources/js/sgh_js/booking_date.js"></script>
<script>
$(function() {
	
	// 날짜
	var today = new Date();
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1; // 월
	var date = today.getDate(); // 일
	var day = today.getDay(); // 날짜
	var dateCount = new Date(year, month, 0).getDate();
	
	var rmn_sts;
	var total_seat;
	var choice_movie_time;
	
	// 상영 지역 이벤트 설정
	// 상영 지역에 있는 영화관 정보를 받아서 해당 지역으로 클릭하면 그 지역에 관한 영화관 뿌리기
	var theaterArr = new Array();
	$(".theater_code").each(function() {
		var that = $(this);
		theaterArr.push(that);
	});
	
	$("#movie_lsit_span").click(function(e) {
		e.preventDefault();
		$(this).css("border", "2px solid");
	});
	
	// 상영 지역 클릭 이벤트
	$("#screeningArea").on("click", ".areaChoice", function(e) {
		e.preventDefault();
		var a_areaName = $(this).attr("data-a-areaName");
		$(".screeningAreaClone").remove();
		$(".movieChoice").remove();
		$(".movie_list_clone").remove();
		var screenClone = $("#screeningArea").clone().addClass("screeningAreaClone");
		screenClone.find(".title").text("상영 영화관");
		screenClone.find("li").remove();
		screenClone.attr("class", "col-lg-3 col-md-2 col-2 screeningAreaClone");
		screenClone.css("width", "300");
		
		$.each(theaterArr, function() {
			var t_areaName = $(this).attr("data-t-areaName");
			if(a_areaName == t_areaName) {
				var theaterA_tag = $(this);
				screenClone.find("ul").append(theaterA_tag);
			}
		});
		screenClone.find("a").wrap("<li></li>");
		
		$("#prog1").css("color", "red");
		$("#prog2").css("color", "black");
		$("#prog3").css("color", "black");
		$("#prog4").css("color", "black");
		
		$("#screeningArea").after(screenClone);
	});
	
	// 상영 영화관 클릭 이벤트
	$("#section").on("click", ".theater_code", function(e) {
		e.preventDefault();
		var url = "/sgh/book/getMovieName";
		var theater_code = $(this).attr("data-t-theater-code");
		var theater_name = $(this).text();
		$("#theater_name").val(theater_name);
		var sendData = {
				"theater_code" : theater_code
		};
		$(".movieChoice").remove();
		$(".movie_list_clone").remove();
		var screenClone = $("#screeningArea").clone().addClass("movieChoice");
		screenClone.find(".title").text("상영작");
		screenClone.find("li").remove();
		
		$.get(url, sendData, function(rData) {
			$.each(rData, function() {
				var movieName = this.movie_name;
				var a = "<li><a href='#' class='movie_name' data-movie-code='" + this.movie_code + "' data-t-theater-code='"+theater_code+"'>" + movieName + "</a></li>";
				screenClone.find("ul").append(a);
			});
		});
		
		$("#prog1").css("color", "white");
		$("#prog2").css("color", "red");
		$("#prog3").css("color", "white");
		$("#prog4").css("color", "white");
		
		$(".screeningAreaClone").after(screenClone);
	});
	
	var start_date = year + "-" + zeroPlus(month) + "-" + zeroPlus(date);
	var movie_index = 0;
	// 상영작 클릭 이벤트
	$("#section").on("click", ".movie_name", function(e) {
		e.preventDefault();
		movie_index++;
		var movie_id = "movie" + movie_index;
		$(this).attr("id", movie_id);
		$(".movie_list_clone").remove();
		
		var strDate = year + "-" + zeroPlus(month) + "-" + zeroPlus(date) + "("+strDay(day)+")";
		
		var movie_code = $(this).attr("data-movie-code");
		var movie_name = $(this).text();
		$("#movie_name").val(movie_name);
		$("#movie_code").val(movie_code);
		var btn_left = "<div style='float:left;'><button type='button' id='btnLeftShow'><img src='/resources/images/jmh/point_left.png'/></button></div>"
		var btn_right = "<div style='float:right;'><button type='button' id='btnRightShow'><img src='/resources/images/jmh/point_right.PNG'/></button></div>"
		
		var screenClone = $("#screeningArea").clone();
		screenClone.attr("class", "col-lg-4 col-md-2 col-2 movie_list_clone");
		screenClone.find(".title").addClass("movie_list_title").html(btn_left + strDate + btn_right);
		screenClone.find("li").remove();
		var theater_code = $(this).attr("data-t-theater-code");
		
		var url = "/sgh/book/movieSchedule";
		var sendData = {
				"start_date" : start_date,
				"movie_code" : movie_code,
				"theater_code" : theater_code
		};
		
		$.get(url, sendData, function(rData) {
			$.each(rData, function() {
				var movie_grade = (this).movie_grade;
				var start_date = (this).start_date;
				var start_time = (this).start_time;
				var end_time = (this).end_time;
				var screen_name = (this).screen_name;
				var screen_code = (this).screen_code;
				total_seat = (this).screen_total_seat;
				rmn_sts = (this).rmn_sts;
				var movie_time_code = (this).movie_time_code;
				
				var list_span_clone = $("#movie_list_span").clone();
				list_span_clone.find(".movie_list_li").attr("data-movie-time-code", movie_time_code);
				list_span_clone.find(".movie_list_li").attr("data-screen-code", screen_code);
				list_span_clone.find(".movie_list_li").attr("data-screen-name", screen_name);
				list_span_clone.find(".movie_list_li").attr("data-start-date", start_date);
				list_span_clone.find(".movie_list_li").attr("data-start-time", start_time);
				list_span_clone.find(".movie_list_li").attr("data-end-time", end_time);
				list_span_clone.css("display", "block");
				list_span_clone.find("a").html(start_time + "<br/>" + rmn_sts + "/" + total_seat + " " + screen_name);
				$(".movie_list_title").after(list_span_clone);
			});
		});
		
		$("#prog1").css("color", "white");
		$("#prog2").css("color", "white");
		$("#prog3").css("color", "red");
		$("#prog4").css("color", "white");
		
		screenClone.find("a").wrap("<li></li>");
		$(".movieChoice").after(screenClone);
	});
	
	// 날짜 왼쪽 버튼
	var btn_index =  0;
	$("#section").on("click", "#btnLeftShow", function() {
		if(btn_index == 0) {
			return false;
		}
		date--;
		day--;
		btn_index--;
		start_date = year + "-" + zeroPlus(month) + "-" + zeroPlus(date);
		
		if(day < 0) {
			day = 6;
		}
		
		if(date == 0) {
			month--;
			date = new Date(year, month, 0).getDate();
			if(month == 0) {
				year--;
				month = 12;
				date = new Date(year, month, 0).getDate();
			}
		}
		$("#movie" + movie_index).trigger("click");
	});
	
	// 날짜 오른쪽 버튼
	$("#section").on("click", "#btnRightShow", function() {
		if(btn_index > 7) {
			return false;
		}
		date++;
		day++;
		btn_index++;
		start_date = year + "-" + zeroPlus(month) + "-" + zeroPlus(date);
		if(day == 7) {
			day = 0;
		}
		
		if(date > dateCount) {
			month++;
			if(month > 12) {
				year++;
				month = 1;
			}
			date = 1;
		}
		$("#movie" + movie_index).trigger("click");
	});
	
	// 영화 시간대 선택할 시 나오는 모달창
	$("#section").on("click", ".movie_list_li", function(e) {
		e.preventDefault();
		$(".modal_tr").remove();
		$(".movie_list_li").css("border", "1px solid").css("border-radius", "1em");
		$(this).css("border", "4px solid").css("border-radius", "1em");
		$("#modal-70650").trigger("click");
		
		var screen_code = $(this).attr("data-screen-code");
		var screen_name = $(this).attr("data-screen-name");
		var start_date = $(this).attr("data-start-date");
		var start_time = $(this).attr("data-start-time");
		var end_time = $(this).attr("data-end-time");
		$("#screen_code").val(screen_code);
		$("#screen_name").val(screen_name);
		$("#start_date").val(start_date);
		$("#start_time").val(start_time);
		$("#end_time").val(end_time);
		$("#end_time").val(end_time);
		
		var movie_time_code = $(this).attr("data-movie-time-code");
		$("#movie_time_code").val(movie_time_code);
		var movie_code = $(this).attr("date-movie-code");
		var strDate = year + "-" + zeroPlus(month) + "-" + zeroPlus(date) + "("+strDay(day)+")";
		var seat_state = "잔여좌석 : " + rmn_sts + "/" + total_seat;
		$("#modal_time").text(strDate);
		$("#modal_seat").text(seat_state);
		
		// 다음 페이지 갈때 넘길 time_code 저장
		choice_movie_time = movie_time_code;
		
		var url = "/sgh/book/movie_time_seat";
		var sendData = {
				"movie_time_code" : movie_time_code
		};
		
		$.get(url, sendData, function(rData) {
			var index = 1;
			var tr = "";
			$.each(rData, function() {
				var seat_code = (this).seat_code;
				var screen_seat_row = (this).screen_seat_row;
				var screen_seat_col = (this).screen_seat_col;
				var seat_check = (this).seat_check;
				
				// 행의 시작
				if(index == 1) {
			    	tr += "<tr class='modal_tr'>";
				}
				tr += "<td";
				
				// 구매한 좌석이라면 배경색 변경
				if(seat_check == "Y") {
					tr += " style='background-color:#ccc;'";
				}
				tr +=">"+seat_code+"</td>";
				index++;
				// 행의 종료
				if(index > screen_seat_row) {
					tr += "</tr>";
					index = 1;
				}
			});
			$("#modal_table").append(tr);
		}); // get
		
		$("#prog1").css("color", "white");
		$("#prog2").css("color", "white");
		$("#prog3").css("color", "white");
		$("#prog4").css("color", "red");
	});
	
	// 인원/좌석 선택 버튼
	$("#btnChoiceSeat").click(function() {
		$("#frm_time_seat").submit();		
	});
});

</script>
<form id="frm_time_seat" action="/sgh/choiceSeat/movie_time_seat" method="GET">
	<input type="hidden" id="theater_name" name="theater_name">
	<input type="hidden" id="movie_name" name="movie_name">
	<input type="hidden" id="movie_code" name="movie_code">
	<input type="hidden" id="screen_code" name="screen_code">
	<input type="hidden" id="screen_name" name="screen_name">
	<input type="hidden" id="movie_time_code" name="movie_time_code">
	<input type="hidden" id="start_date" name="start_date">
	<input type="hidden" id="start_time" name="start_time">
	<input type="hidden" id="end_time" name="end_time">
</form>
<!-- 지역 목록 붙여 쓸 숨겨두는 데이터 -->
<c:forEach items="${theaterList}" var="SghTheaterVo">
	<li style="display: none">
		<a class="theater_code" href="#" data-t-areaName="${SghTheaterVo.area_name}" data-t-theater-code="${SghTheaterVo.theater_code}">${SghTheaterVo.theater_name}</a>
		<a id="aCloneTag" href="#"></a>	
	</li>
</c:forEach>
<!-- 상영작 리스트 보여주는 클론용 데이터 -->
<ul id="movie_list_span"class="row" style="float:left; text-align: center; margin-left: 20px; margin-bottom : 10px; width: 90px; height: 50px; display: none;"><!-- display: none; -->
	<li class="movie_list_li" style="border: 1px solid; border-radius: 1em;">
		<a>
		12:00
		34/34 b관
		</a>
	</li>
</ul>
<!-- 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-70650" href="#modal-container-70650" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
			<div class="modal fade" id="modal-container-70650" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="background-color: #F2F2F2;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body" style="margin-top: 50px; height: 50%;">
							<div>
								<span class="modal_content"><strong id="modal_time">시간대</strong></span>
							</div>
							<div>
								<span class="modal_content"><strong id="modal_seat">좌석 상황</strong></span>
							</div>
							<div>
								<span class="modal_content"><strong>screen</strong></span>
							</div>
							<table>
								<tbody id="modal_table">
									
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button id="btnChoiceSeat" type="button" class="btn" style="color: #FFF;">
								인원/좌석 선택
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		<!-- Product Style -->
		<section id="section" class="product-area shop-sidebar shop section" style="padding-top: 50px; background-color:#333; mar">
			<div style="margin-bottom: 30px;" >
				<strong style="margin-left: 190px; margin-bottom: 30px; font-size: 50px; color:white;">
					<img alt="카메라 이미지" src="/resources/images/camera2.png" width="100px;" height="50px;">
					영화 예매
				</strong>
				<div style="text-align: center;">
					<strong class="set_prog" id="prog1">&#9312;</strong>
					<strong class="set_prog">&#8594;</strong>
					<strong class="set_prog" id="prog2">&#9313;</strong>
					<strong class="set_prog">&#8594;</strong>
					<strong class="set_prog" id="prog3">&#9314;</strong>
					<strong class="set_prog">&#8594;</strong>
					<strong class="set_prog" id="prog4">&#9315;</strong>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div id="screeningArea" class="col-lg-2 col-md-2 col-2">
						<div class="shop-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category" style="height: 500px;">
								<h3 class="title">상영 지역</h3>
								<ul class="categor-list">
									<c:forEach items="${areaList}" var="SghAreaVo">
										<li><a href="#" class="areaChoice" data-a-areaName="${SghAreaVo.area_name}">${SghAreaVo.area_name }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

<%@ include file="../../../include/footer.jsp" %>