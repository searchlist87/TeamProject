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
	
	// 상영 일정에 등록된 영화를 고르면 그에 대한 정보 출력
	$("#movie_name").change(function() {
		$("#theater_div").remove();
		$("#start_date_div").remove();
		$("#end_date_div").remove();
		$("#screen_div").remove();
		var movie_schedule_code = $("#movie_name option:selected").val();
		
		// 등록할 영화를 선택해주세요. 는 상태값 null을 줘서 이것이 선택되면 에이잭스 작동 안하게
		if(movie_schedule_code == 'not') {
			return false;
		}
		
		var url = "/sgh/admin/movieTime/choiceSchedule";
		var sendData = {
			"movie_schedule_code" : movie_schedule_code
		};
		
		$.get(url, sendData, function(rData) {
			
			var movie_name = rData.movie_name;
			var theater_name = rData.theater_name;
			var theater_code = rData.theater_code;
			var movie_start_date = rData.movie_start_date;
			var movie_end_date = rData.movie_end_date;
			var movie_schedule_code = rData.movie_schedule_code;
			
			$("#movie_schedule_code").val(movie_schedule_code);
			$("#ajax_theater_code").val(theater_code);
			
			// 영화관 이름 붙이기
			var theater_div = "<div id='theater_div'><label for='theater_name'><strong>영화관  :  </strong></label>";
			theater_div += "<input type='text' id='theater_name' value='"+ theater_name +"' date-thater-code='"+ theater_code +"' readonly>";
			theater_div += "<button type='button' class='btnScreenSearch'>스크린 조회</button></div>";
			$("#select_div").after(theater_div);
			
			// 시작 날짜 붙이기
			var start_date_div = "<div id='start_date_div'><label for='start_date'><strong>시작 날짜  :  </strong></label>";
			start_date_div += "<input type='text' id='start_date' value='"+ movie_start_date +"' readonly></div>";
			$("#theater_div").after(start_date_div);
			
			// 종료 날짜 붙이기
			var end_date_div = "<div id='end_date_div'><label for='end_date_div'><strong>종료 날짜  :  </strong></label>";
			end_date_div += "<input type='text' id='end_date_div' value='"+ movie_end_date +"' readonly></div>";
			$("#start_date_div").after(end_date_div);
		});
	});
	
	// 스크린에 대한 정보 가져오기
	$("#frm_movie_time").on("click", ".btnScreenSearch", function() {
		$("#screen_div").remove();
		var theater_code = $("#ajax_theater_code").val();
		var url = "/sgh/admin/movieTime/getScreenList";
		var sendData = {
				"theater_code" : theater_code
		};
		
		$.get(url, sendData, function(rData) {
			var screen_select = "<div id='screen_div'><strong>스크린 : </strong><select id='screen_select'>"
				screen_select += "<option value='not' selected>상영할 스크린을 선택해주세요.</option>";
			
			$.each(rData, function() {
				var screen_name = (this).screen_name;
				var screen_code = (this).screen_code;
				screen_select += "<option value='"+screen_code+"'>"+screen_name+"</option>";
			});
			
			screen_select += "</select><div>";
			$("#theater_div").after(screen_select);
		});
	});
	
	// 스크린 셀렉터 선택했을때 값을 input hidden에 넣기	
	$("#frm_movie_time").on("change", "#screen_select", function() {
		$(".total_seat").remove();
		$(".row_seat").remove();
		$(".col_seat").remove();
		
		var screen_code = $("#screen_select option:selected").val();
		$("#screen_code").val(screen_code);
		var url = "/sgh/admin/movieTime/screenSeatAjax";
		var sendData = {
			"screen_code" : screen_code	
		};
		
		$.get(url, sendData, function(rData) {
			var total = rData.screen_total_seat;
			var row = rData.screen_seat_row;
			var col = rData.screen_seat_col;
			
			// 총 좌석 붙이기
			var total_div = "<div class='form-group total_seat'><label for='total_seat'><strong>총 좌석</strong></label>";
				total_div += "<input type='text' class='form-control' id='total_seat' value='"+total+"' placeholder='행과 열을 입력해야합니다.' readonly/></div>";
			$("#end_date_div").after(total_div);
			
			// 행 붙이기
			var row_div = "<div class='form-group row_seat'><label for='row_seat'><strong>총 좌석</strong></label>";
				row_div += "<input type='text' class='form-control' id='row_seat' value='"+row+"' readonly/></div>";
			$(".total_seat").after(row_div);
			
			// 열 붙이기
			var col_div = "<div class='form-group col_seat'><label for='col_seat'><strong>총 좌석</strong></label>";
				col_div += "<input type='text' class='form-control' id='col_seat' value='"+col+"' readonly/></div>";
			$(".row_seat").after(col_div);
			
			$("#screen_total_seat").val(total);
			$("#screen_seat_row").val(row);
			$("#screen_seat_col").val(col);
		});
	});
	
	// 전송 체크
	$("#frm_movie_time").submit(function() {
		var screen_code = $("#screen_code").val();
		var movie_schedule_code = $("#movie_schedule_code").val();
		var movie_start_time = $("#movie_start_time").val();
		var movie_end_time = $("#movie_end_time").val();
		
		var movie_schedule_code = $("#movie_name option:selected").val();
		if(movie_schedule_code == 'not') {
			alert("등록된 영화가 설정되지 않았습니다. 다시 확인해주세요.");
			return false;
		}
		
		var screen_select = $("#screen_select option:selected").val();
		if(screen_select == 'not' || screen_select == null || screen_select == "") {
			alert("스크린이 설정되지 않았습니다. 다시 확인해주세요.");
			return false;
		}
		
		var time_rgx = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])\s([1-9]|[01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/;
		if(!time_rgx.test(movie_start_time)) {
			alert("시작 시간 정보가 잘못되었습니다. 다시 확인해주세요.");
			return false;
		}
		
		if(!time_rgx.test(movie_end_time)) {
			alert("종료 시간 정보가 잘못되었습니다. 다시 확인해주세요.");
			return false;
		}
		
		var money = $("#movie_money").val();
		var money_rgx = /^[0-9]{1,9999999999999}$/;
		if(!money_rgx.test(money)) {
			alert("입력하신 금액이 잘못되었습니다. 다시 확인해주세요.");
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
							<h4 class="title">상영회차 등록하기</h4>
						</div>
						<!--  페이지별 내용 -->
						<form id="frm_movie_time" role="form" action="/sgh/admin/movieTime/registMovieTime" method="get">
							<input type="hidden" id="movie_schedule_code" name="movie_schedule_code">
							<input type="hidden" id="screen_code" name="screen_code">
							<input type="hidden" id="screen_seat_row" name="screen_seat_row">
							<input type="hidden" id="screen_seat_col" name="screen_seat_col">
							<input type="hidden" id="screen_total_seat" name="screen_total_seat">
							<div class="form-group" id="select_div">
								<label for="movie_genre"><strong>등록된 영화</strong></label>
								<select id="movie_name">
										<option value="not">등록할 영화를 선택해주세요.</option>
									<c:forEach items="${schedule_list}" var="SghScheduleListDto">
										<option value="${SghScheduleListDto.movie_schedule_code}">${SghScheduleListDto.movie_name}(${SghScheduleListDto.theater_name})</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>시작 시간</strong></label>
								<input type="text" class="form-control" id="movie_start_time" name="movie_start_time" placeholder="2020-01-01 12:00:00 형식으로 작성해주세요."/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>종료 시간</strong></label>
								<input type="text" class="form-control" id="movie_end_time" name="movie_end_time" placeholder="2020-01-01 12:00:00 형식으로 작성해주세요."/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>금액</strong></label>
								<input type="text" class="form-control" id="movie_money" name="movie_money" placeholder="금액을 입력해주세요."/>
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