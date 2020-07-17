<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<script>

$(function() {
	var result = "${result}";
	console.log("result :" + result);
	if(result == "false") {
		alert("등록에 실패하셨습니다 다시 확인해주세요.");
	}
	
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	// 시작일
	$("#movie_start_date").blur(function() {
		$(".start_clone").remove();
		var start_date = $(this).val();
		var start_rgx = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		if(!start_rgx.test(start_date)) {
			var span_clone = $("#message_span").clone();
			span_clone.attr("class", "start_clone");
			span_clone.text("YYYY-MM-DD 형식으로 작성해주셔야 합니다.");
			$(this).after(span_clone);
			$("#start_date_result").val("false");
			return false;
		}
		$("#start_date_result").val("true");
	});
	
	// 종료일
	$("#movie_end_date").blur(function() {
		$(".end_clone").remove();
		var end_date = $(this).val();
		var end_rgx = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		if(!end_rgx.test(end_date)) {
			var span_clone = $("#message_span").clone();
			span_clone.attr("class", "end_clone");
			span_clone.text("YYYY-MM-DD 형식으로 작성해주셔야 합니다.");
			$(this).after(span_clone);
			$("#start_date_result").val("false");
			return false;
		}
		$("#start_date_result").val("true");
	});
	
	// 전송할 때
	$("#frm_schedule").submit(function() {
		var start_result = $("#start_date_result").val();
		var end_result = $("#end_date_result").val();
		var movie_code = $("#movie_name option:selected").val();
		var theater_code = $("#theater_name option:selected").val();
		
		$("#movie_code").val(movie_code);
		$("#theater_code").val(theater_code);
		if(start_result == "false" || end_result == "false") {
			alert("비어있는 항목이 존재합니다. 다시 확인해주세요.");
			return false;
		}
	});
});
</script>

<!-- 해더 부분 -->
<div style="visibility: hidden;">
	<span id="message_span" style="color: red;"></span>
</div>
<!-- 등록을 할 때 결과를 체크할 hidden type들 -->
<input type="hidden" id="start_date_result">
<input type="hidden" id="end_date_result">
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">상영일 등록하기</h4>
						</div>
						<!--  페이지별 내용 -->
						<form id="frm_schedule" role="form" action="/sgh/admin/schedule/scheduleRegistRun" method="get">
							<input type="hidden" id="movie_code" name="movie_code">
							<input type="hidden" id="theater_code" name="theater_code">
							<div class="form-group">
								<label for="movie_genre"><strong>등록된 영화</strong></label>
								<select id="movie_name">
									<c:forEach items="${schedule_list}" var="SghScheduleListDto">
										<option value="${SghScheduleListDto.movie_code}">${SghScheduleListDto.movie_name}</option>
									</c:forEach>
								</select>
<!-- 								<input type="text" class="form-control" id="movie_name" name="movie_name"/> -->
							</div>
							<div class="form-group">
								<label for="movie_genre"><strong>등록된 영화관</strong></label>
								<select id="theater_name">
									<c:forEach items="${theater_list}" var="SghTheaterVo">
										<option value="${SghTheaterVo.theater_code}">${SghTheaterVo.theater_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>시작일</strong></label>
								<input type="text" class="form-control" id="movie_start_date" name="movie_start_date"/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>종료일</strong></label>
								<input type="text" class="form-control" id="movie_end_date" name="movie_end_date" />
							</div>
							<button type="submit" class="btn" id="btnSubmit">등록</button>
							<a href="/sgh/admin/schedule/scheduleList" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>