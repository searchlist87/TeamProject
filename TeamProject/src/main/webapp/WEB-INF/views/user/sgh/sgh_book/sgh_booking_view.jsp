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
</style>

<script>
$(function() {
	
	
	// 상영 지역 이벤트 설정
	// 상영 지역에 있는 영화관 정보를 받아서 해당 지역으로 클릭하면 그 지역에 관한 영화관 뿌리기
	var theaterArr = new Array();
	$(".theater_code").each(function() {
		var that = $(this);
		theaterArr.push(that);
	});
	
	$("#screeningArea").on("click", ".areaChoice", function(e) {
		e.preventDefault();
		var a_areaName = $(this).attr("data-a-areaName");
		$(".screeningAreaClone").remove();
		var screeningAreaClone = $("#screeningArea").clone().addClass("screeningAreaClone");
		screeningAreaClone.find("li").remove();
		
		$.each(theaterArr, function() {
			var t_areaName = $(this).attr("data-t-areaName");
			console.log("t_areaName :" + t_areaName);
			if(a_areaName == t_areaName) {
				var theaterA_tag = $(this);
				screeningAreaClone.find("ul").append(theaterA_tag);
			}
		});
		screeningAreaClone.find("a").wrap("<li></li>");
		
		$("#screeningArea").after(screeningAreaClone);
	});

	$("#section").on("click", ".theater_code", function(e) {
		e.preventDefault();
		var url = "/sgh/book/getMovieName";
		var theater_code = $(this).attr("data-t-theater-code");
		console.log("theater_code :" + theater_code);
		var sendData = {
				"theater_code" : theater_code
		};
		$(".movieChoice").remove();
		var screeningAreaClone = $("#screeningArea").clone().addClass("movieChoice");
		screeningAreaClone.find("li").remove();
		
		$.getJSON(url, sendData, function(rData) {
			console.log("찍힘");
			console.log("rData : " + rData);
			$.each(rData, function() {
				var movieName = this.movie_name;
				var a = "<li><a href='#'>" + movieName + "</a></li>";
				screeningAreaClone.find("ul").append(a);
			});
		});
		$(".screeningAreaClone").after(screeningAreaClone);
	});
});
</script>
<c:forEach items="${theaterList}" var="SghTheaterVo">
	<li style="visibility: hidden;">
		<a class="theater_code" href="#" data-t-areaName="${SghTheaterVo.area_name}" data-t-theater-code="${SghTheaterVo.theater_code}">${SghTheaterVo.theater_name}</a>
		<a id="aCloneTag" href="#"></a>	
	</li>
</c:forEach>

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