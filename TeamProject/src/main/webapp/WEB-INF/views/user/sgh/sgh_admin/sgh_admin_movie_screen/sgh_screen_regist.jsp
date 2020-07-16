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
	
	$("#screen_seat_col").blur(function() {
		var row = $("#screen_seat_row").val();
		var col = $(this).val();
		
		var sum = row * col;
		
		$("#screen_total_seat").val(sum);
	});
});
</script>

<!-- 해더 부분 -->
<!-- admin_category -->
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
						<form role="form" action="/sgh/admin/movieScreen/screenRegistRun" method="get">
							<input type="hidden" name="theater_code" value="${sghScreenRegistDto.theater_code}">
							<input type="hidden" name="theater_name" value="${sghScreenRegistDto.theater_name}">
							<div class="form-group">
								<label for="movie_genre"><strong>상영관 이름</strong></label>
								<input type="text" class="form-control" id="screen_name" name="screen_name" placeholder="상영관 이름" required />
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>총 좌석 수</strong></label>
								<input type="text" class="form-control" id="screen_total_seat" name="screen_total_seat" placeholder="열을 입력해야 총 좌석수가 입력 됩니다." readonly />
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>행</strong></label>
								<input type="text" class="form-control" id="screen_seat_row" name="screen_seat_row"/>
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>열</strong></label>
								<input type="text" class="form-control" id="screen_seat_col" name="screen_seat_col"/>
							</div>
							<button type="submit" class="btn" id="btnSubmit">등록</button>
							<a href="/sgh/admin/adminMainForm" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>