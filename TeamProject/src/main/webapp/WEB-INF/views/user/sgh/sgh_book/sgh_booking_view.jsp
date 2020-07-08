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
	$("#screeningArea").on("click", ".areaClass", function(e) {
		e.preventDefault();
		var code = $(this).attr("data-theater_code");
		$(".areaChoiceClone").remove();
		// 상영 지역 복사해서 새로 붙이는 작업
		var areaChoiceClone = $("#screeningArea").clone().addClass("areaChoiceClone");
		areaChoiceClone.find("ul").find("li").find("a").eq(0).remove();
		areaChoiceClone.find("h3").text("상영관 선택");
		if(code == '01') {
			areaChoiceClone.find("ul").find("li").find("a").text("서울허니복스");
		} else if (code == '02') {
			areaChoiceClone.find("ul").find("li").find("a").text("울산허니복스");
		}
		$("#screeningArea").after(areaChoiceClone);
	});
	
	$("#section").on("click", ".areaChoiceClone", function(e) {
		e.preventDefault();
		var url = "/sgh/book/areaMovie";
		var h1 = "gdgd";
		var sendData = {
				"hi" : h1
		};
		
		$.getJSON(url, sendData, function(rData) {
			console.log(rData);
		});
	});
});
</script>
		<!-- Product Style -->
		<section id="section" class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div id="screeningArea" class="col-lg-2 col-md-2 col-2">
						<div class="shop-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">상영 지역d</h3>
								<ul class="categor-list">
									<c:forEach items="${list}" var="SghTheaterVo">
										<li><a id="choiceArea" href="#" class="areaClass" data-theater_code="${SghTheaterVo.theater_code}">${SghTheaterVo.theater_area}</a></li>
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