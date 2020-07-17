<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<script>

$(function() {
	var result = "${result}";
	if(result == "false") {
		alert("등록에 실패하셨습니다 다시 확인해주세요.");
	}
	
	// 상영관 이름
	$("#screen_name").blur(function() {
		$(".name_clone").remove();
		var span_clone = $("#message_span").clone();
		var screen_name = $(this).val();
		var name_rgx = /^[가-힣a-zA-Z0-9]{1,5}$/;
		if(!name_rgx.test(screen_name)) {
			span_clone.attr("class", "name_clone");
			span_clone.text("필수 정보 입니다. 1~5자 한글, 영문자, 숫자만 사용 가능합니다.");
			$(this).after(span_clone);
			return false;
		}
		$("#screen_name_result").val("true");
	});
	
	// 행
	$("#screen_seat_row").blur(function() {
		$(".row_clone").remove();
		var span_clone = $("#message_span").clone();
		var screen_seat_row = $(this).val();
		var row_rgx = /^[0-9]{1,2}$/;
		if(!row_rgx.test(screen_seat_row)) {
			span_clone.attr("class", "row_clone");
			span_clone.text("필수 정보 입니다. 1~2자 숫자만 사용 가능합니다.");
			$(this).after(span_clone);
			return false;
		}
		
		$("#screen_seat_row_result").val("true");
		var screen_seat_col = $("#screen_seat_col").val();
		var total_seat = screen_seat_row * screen_seat_col;
		$("#screen_total_seat").val(total_seat);
	});
	
	// 열
	$("#screen_seat_col").blur(function() {
		$(".col_clone").remove();
		var span_clone = $("#message_span").clone();
		var screen_seat_col = $(this).val();
		var col_rgx = /^[0-9]{1,2}$/;
		if(!col_rgx.test(screen_seat_col)) {
			span_clone.attr("class", "col_clone");
			span_clone.text("필수 정보 입니다. 1~2자 숫자만 사용 가능합니다.");
			$(this).after(span_clone);
			return false;
		}
		
		$("#screen_seat_col_result").val("true");
		var screen_seat_row = $("#screen_seat_row").val();
		var total_seat = screen_seat_row * screen_seat_col;
		$("#screen_total_seat").val(total_seat);
	});
	
	$("#frm_screen").submit(function() {
		var name_result = $("#screen_name_result").val();
		var row_result = $("#screen_seat_row_result").val();
		var col_result = $("#screen_seat_col_result").val();
		
		if(name_result != "true" || row_result != "true" || col_result != "true") {
			alert("비어있는 곳이 있습니다. 다시 확인해주세요.");
			return false;
		}
	});
});
</script>

<!-- 해더 부분 -->
<!-- admin_category -->
<div style="visibility: hidden;">
	<span id="message_span" style="color: red;"></span>
</div>
<!-- 등록을 할 때 결과를 체크할 hidden type들 -->
<input type="hidden" id="screen_name_result">
<input type="hidden" id="screen_seat_row_result">
<input type="hidden" id="screen_seat_col_result">
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">${sghScreenRegistDto.theater_name}의 상영관 등록</h4>
						</div>
						<!--  페이지별 내용 -->
						<form id="frm_screen" role="form" action="/sgh/admin/movieScreen/screenRegistRun" method="get">
							<input type="hidden" name="theater_code" value="${sghScreenRegistDto.theater_code}">
							<input type="hidden" name="theater_name" value="${sghScreenRegistDto.theater_name}">
							<div class="form-group">
								<label for="movie_genre"><strong>상영관 이름</strong></label>
								<input type="text" class="form-control" id="screen_name" name="screen_name"/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>총 좌석 수</strong></label>
								<input type="text" class="form-control" id="screen_total_seat" name="screen_total_seat" placeholder="열과 행을 입력하면 자동으로 나옵니다." readonly />
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>행</strong></label>
								<input type="text" class="form-control" id="screen_seat_row" name="screen_seat_row" />
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>열</strong></label>
								<input type="text" class="form-control" id="screen_seat_col" name="screen_seat_col"/>
							</div>
							<button type="submit" class="btn" id="btnSubmit">등록</button>
							<a href="/sgh/admin/movieScreen/screenList?theater_code=${sghScreenRegistDto.theater_code}" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>