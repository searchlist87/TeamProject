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
	#movie_lsit_span {
		cursor: pointer;
	}
</style>
<script src="/resources/js/sgh_js/booking_date.js"></script>
<script>
$(function() {
	
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
	
	// 상영 지역
	$("#screeningArea").on("click", ".areaChoice", function(e) {
		e.preventDefault();
		var a_areaName = $(this).attr("data-a-areaName");
		$(".screeningAreaClone").remove();
		$(".movieChoice").remove();
		var screenClone = $("#screeningArea").clone().addClass("screeningAreaClone");
		screenClone.find(".title").text("상영 영화관");
		screenClone.find("li").remove();
		
		$.each(theaterArr, function() {
			var t_areaName = $(this).attr("data-t-areaName");
			if(a_areaName == t_areaName) {
				var theaterA_tag = $(this);
				screenClone.find("ul").append(theaterA_tag);
			}
		});
		screenClone.find("a").wrap("<li></li>");
		
		$("#screeningArea").after(screenClone);
	});
	
	// 상영 영화관
	$("#section").on("click", ".theater_code", function(e) {
		e.preventDefault();
		var url = "/sgh/book/getMovieName";
		var theater_code = $(this).attr("data-t-theater-code");
		var sendData = {
				"theater_code" : theater_code
		};
		$(".movieChoice").remove();
		var screenClone = $("#screeningArea").clone().addClass("movieChoice");
		screenClone.find(".title").text("상영작");
		screenClone.find("li").remove();
		
		$.get(url, sendData, function(rData) {
			console.log("rData" + rData);
			$.each(rData, function() {
				var movieName = this.movie_name;
				var a = "<li><a href='#' class='movie_name' data-movie-code='" + this.movie_code + "'>" + movieName + "</a></li>";
				screenClone.find("ul").append(a);
			});
		});
		
		$(".screeningAreaClone").after(screenClone);
	});
	
	// 각각의 영화
	$("#section").on("click", ".movie_name", function(e) {
		e.preventDefault();
		
		var today = new Date();
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1; // 월
		var date = today.getDate(); // 일
		var day = today.getDay(); // 날짜
		
		var strDate = year + "-" + zeroPlus(month) + "-" + zeroPlus(date) + "("+strDay(day)+")";
		
		var movie_code = $(this).attr("data-movie-code");
		var start_date = year + "-" + zeroPlus(month) + "-" + zeroPlus(date);
		
		var screenClone = $("#screeningArea").clone();
		screenClone.attr("class", "col-lg-4 col-md-2 col-2 screeningAreaClone");
		screenClone.find(".title").text(strDate);
		screenClone.find("li").remove();
		
		var url = "/sgh/book/movieSchedule";
		var sendData = {
				"start_date" : start_date,
				"movie_code" : movie_code
		};
		
		$.get(url, sendData, function(rData) {
			$.each(rData, function() {
				var movie_grade = (this).movie_grade;
				var start_time = (this).start_time;
				var screen_name = (this).screen_name;
				var	total_seat = (this).screen_total_seat;
				var rmn_sts = (this).rmn_sts;
				var movie_time_code = (this).movie_time_code;
				console.log("movie_grade : " + movie_grade);
				console.log("start_time : " + start_time);
				console.log("screen_name : " + screen_name);
				console.log("total_seat : " + total_seat);
				console.log("rmn_sts : " + rmn_sts);
				console.log("movie_time_code : " + movie_time_code);
			});
		});
		
		screenClone.find("a").wrap("<li></li>");
		$(".movieChoice").after(screenClone);
	});
});
</script>
<c:forEach items="${theaterList}" var="SghTheaterVo">
	<li style="display: none">
		<a class="theater_code" href="#" data-t-areaName="${SghTheaterVo.area_name}" data-t-theater-code="${SghTheaterVo.theater_code}">${SghTheaterVo.theater_name}</a>
		<a id="aCloneTag" href="#"></a>	
	</li>
</c:forEach>

<span id="movie_lsit_span"class="row" style="margin-left: 30px; border: 1px solid; border-radius: 1em; width: 75px; height: 40px;"><!-- display: none; -->
	<a href="#" style="font: 5px;">
		12:00
		34/34 b관
	</a>	
</span>
		<!-- Product Style -->
		<section id="section" class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div id="screeningArea" class="col-lg-2 col-md-2 col-2">
						<div class="shop-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category">
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

<a href="/templet/checkout" class="btn btn-success">예매</a>

<%@ include file="../../../include/footer.jsp" %>