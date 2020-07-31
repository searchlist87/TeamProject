<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<script src="/resources/js/sgh_js/timestmap_change_ss.js"></script>
<script>
$(function() {
	$("#movie_time_manage > dd").css("display","block");
	$("#movie_time_manage > dt").css("color","red");
	$("#movie_time_manage > dd").eq(2).css("color","blue");
	
	var result = "${result}";
	console.log("result :" + result);
	if(result == "false") {
		alert("등록에 실패하셨습니다 다시 확인해주세요.");
	}
	
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	// 10:00:00.0 으로 들어오는 시간 10:00:00으로 변환
	var movie_start_time = $("#movie_start_time").val();
	var movie_end_time = $("#movie_end_time").val();
	
	var change_start = timestmap_ss(movie_start_time);
	var change_end = timestmap_ss(movie_end_time);
	
	$("#movie_start_time").val(change_start);
	$("#movie_end_time").val(change_end);
	
	// 스크린 셀렉터 선택했을때 값을 input hidden에 넣기	
	$(".screen_select").change(function () {
		var screen_code = $("#screen_code option:selected").val();
		var url = "/sgh/admin/movieTime/screenSeatAjax";
		var sendData = {
			"screen_code" : screen_code	
		};
		
		$.get(url, sendData, function(rData) {
			var total = rData.screen_total_seat;
			var row = rData.screen_seat_row;
			var col = rData.screen_seat_col;
			
			$("#total_seat").val(total);
			$("#row_seat").val(row);
			$("#col_seat").val(col);
		});
	});
	
	// 전송 체크
	$("#frm_movie_time").submit(function() {
		var screen_code = $("#screen_code option:selected").val();
		var movie_schedule_code = $("#movie_schedule_code").attr("data-schedule_code");
		var movie_start_time = $("#movie_start_time").val();
		var movie_end_time = $("#movie_end_time").val();
		
		var time_rgx = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])\s([1-9]|[01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/;
		if(!time_rgx.test(movie_start_time)) {
			alert("시작 시간 정보가 잘못되었습니다. 다시 확인해주세요.");
			return false;
		}
		
		if(!time_rgx.test(movie_end_time)) {
			alert("종료 시간 정보가 잘못되었습니다. 다시 확인해주세요.");
			return false;
		}
	});
});
</script>
<!-- 해더 부분 -->
<div style="visibility: hidden;">
	<span id="message_span" style="color: red;"></span>
</div>
<!-- 상영관 가져올 theater_code 담아둘 hidden -->
<input type="hidden" id="ajax_theater_code">
<!-- 등록을 할 때 결과를 체크할 hidden type들 -->
<input type="hidden" id="start_date_result" value="true">
<input type="hidden" id="end_date_result" value="true">
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">상영회차 수정하기</h4>
						</div>
						<!--  페이지별 내용 -->
						<form id="frm_movie_time" role="form" action="/sgh/admin/movieTime/movieTimeModifyRun" method="get">
							<input type="hidden" name="movie_time_code" value="${movie_time_vo.movie_time_code}">
							<div class="form-group" id="select_div">
								<label for="movie_genre"><strong>등록된 영화</strong></label>
								<input type="text" class="form-control" value="${movie_time_vo.movie_name} (${movie_time_vo.movie_schedule_code})" readonly>
							</div>
							<div class="form-group">
								<label for="movie_genre"><strong>등록된 영화관</strong></label>
								<input type="text" class="form-control" value="${movie_time_vo.theater_name}" readonly>
							</div>
							<div class="form-group" id="screen_div">
								<label for="movie_genre"><strong>상영관</strong></label>
									<select class="form-control screen_select" id="screen_code" name="screen_code">
									<c:forEach items="${screen_list_dto}" var="screen_list_dto">
										<option value="${screen_list_dto.screen_code}"
										<c:if test="${screen_list_dto.screen_code == movie_time_vo.screen_code}">
											selected
										</c:if>
										>${screen_list_dto.screen_name}</option>
									</c:forEach>
									</select>
							</div>
							<div class='form-group col_seat'><label for='total_seat'><strong>총 좌석</strong></label>
								<input type='text' class='form-control' id='total_seat' value="${movie_time_vo.screen_total_seat}" readonly/>
							</div>
							<div class='form-group col_seat'><label for='row_seat'><strong>행</strong></label>
								<input type='text' class='form-control' id='row_seat' value="${movie_time_vo.screen_seat_row}" readonly/>
							</div>
							<div class='form-group col_seat'><label for='col_seat'><strong>열</strong></label>
								<input type='text' class='form-control' id='col_seat' value="${movie_time_vo.screen_seat_col}" readonly/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>시작일</strong></label>
								<input type="text" class="form-control" value="${movie_time_vo.movie_start_date}" readonly/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>종료일</strong></label>
								<input type="text" class="form-control" value="${movie_time_vo.movie_end_date}" readonly/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>시작시간</strong></label>
								<input type="text" class="form-control" id="movie_start_time" name="movie_start_time" value="${movie_time_vo.movie_start_time}" placeholder="2020-01-01 12:00:00 형식으로 작성해주세요."/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>종료시간</strong></label>
								<input type="text" class="form-control" id="movie_end_time" name="movie_end_time" value="${movie_time_vo.movie_end_time}" placeholder="2020-01-01 12:00:00 형식으로 작성해주세요."/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>금액</strong></label>
								<input type="text" class="form-control" id="movie_money" name="movie_money" value="${movie_time_vo.movie_money}" placeholder="금액을 입력해주세요."/>
							</div>
							<button type="submit" class="btn" id="btnSubmit">등록</button>
							<a href="/sgh/admin/movieTime/movieTimeList" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>