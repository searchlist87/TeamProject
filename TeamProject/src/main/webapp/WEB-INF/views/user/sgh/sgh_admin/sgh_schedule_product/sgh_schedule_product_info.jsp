<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<style>
	table {
		border-collapse: separate;
		border-spacing: 20px;
	}
	td {
		text-align: center;
		border: 1px solid;
		border-radius: 20%;
		cursor: pointer;
	}
	th {
		text-align: center;
	}
</style>
<script src="/resources/js/sgh_js/myScript.js"></script>
<script>
$(function() {
	$("#movie_product_manage > dd").css("display","block");
	$("#movie_product_manage > dt").css("color","red");
	$("#movie_product_manage > dd").eq(0).css("color","blue");
	
	var movie_start_time = "${sghMovieProductVo.movie_start_time}";
	var movie_end_time = "${sghMovieProductVo.movie_end_time}";
	
	var str_start = timestmap_change(movie_start_time);
	var str_end = timestmap_change(movie_start_time);
	$("#movie_time").val(str_start + "~" + str_end);
	
	var list = '${jArray}';
	var parList = JSON.parse(list);
	var index = 1;
	var tr;
	// 테이블 만들기
	$.each(parList, function() {
		var schedule_seat_code = (this).schedule_seat_code;
		var movie_seat_num = (this).movie_seat_num;
		var screen_code = (this).screen_code;
		var seat_check = (this).seat_check;
		var seat_code = (this).seat_code;
		var movie_time_code = (this).movie_time_code;
		var screen_seat_row = "${sghMovieProductVo.screen_seat_row}";
		var screen_seat_col = "${sghMovieProductVo.screen_seat_col}";
		// 행의 시작
		if(index == 1) {
	    	tr += "<tr class='modal_tr'>";
		}
		tr += "<td ";
		
		// 구매한 좌석이라면 배경색 변경
		if(seat_check == "Y") {
			tr += " style='background-color:#ccc;' class='seat'";
		} else {
			tr += " class='seat' style='cursor: pointer;'";
		}
		
		tr +=" data-schedule-seat-code='"+schedule_seat_code+"'>"+seat_code+"</td>";
		index++;
		// 행의 종료
		if(index > screen_seat_row) {
			tr += "</tr>";
			index = 1;
		}
	});
	
	$("#seat_tbody").append(tr);
	
	$("#seat_table").on("click", ".seat", function() {
		var seat = $(this).text();
		$("#myModalLabel").text(seat + "의 좌석 정보");
		$("#seat_name").val(seat);
		$("#modal-112384").trigger("click");
		
		var schedule_seat_code = $(this).attr("data-schedule-seat-code");
		var url = "/sgh/admin/scheduleProduct/buyIdDateAjax";
		var sendData = {
				"schedule_seat_code" : schedule_seat_code
		};
		$.post(url, sendData, function(rData) {
			var user_id = rData.user_id;
			var movie_buy_date = rData.movie_buy_date;
			var str_buy_date = dateString(movie_buy_date);
			
			if(movie_buy_date == "" || movie_buy_date == null) {
				$("#user_id").val("");
				$("#movie_buy_date").val("");
				return;
			}
			
			$("#user_id").val(user_id);
			$("#movie_buy_date").val(str_buy_date);
		});
	});
});
</script>
<input type="hidden" id=seat_col value="${sghMovieProductVo.screen_seat_col}">

<a id="modal-112384" style="visibility: hidden;" href="#modal-container-112384" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			<div class="modal fade" id="modal-container-112384" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="max-height: 1000px;" role="document">
					<div class="modal-content" style="max-height: 1000px;">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel" style="text-align: center;">
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body" style="max-height: 1000px;">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="form-group" style="margin-top: 30px;">
									<label for="theater_name"> 영화관 </label>
									<input type="text" class="form-control" id="theater_name" value="${sghMovieProductVo.theater_name}" readonly/>
								</div>
								<div class="form-group">
									<label for="theater_name"> 스크린 </label>
									<input type="text" class="form-control" id="screen_name" value="${sghMovieProductVo.screen_name }" readonly/>
								</div>
								<div class="form-group">
									<label for="theater_name"> 영화제목 </label>
									<input type="text" class="form-control" id="movie_name" value="${sghMovieProductVo.movie_name }" readonly/>
								</div>
								<div class="form-group">
									<label for="theater_name"> 시간대 </label>
									<input type="text" class="form-control" id="movie_time" readonly/>
								</div>
								<div class="form-group">
									<label for="seat_name"> 좌석 이름 </label>
									<input type="text" class="form-control" id="seat_name" readonly/>
								</div>
								<div class="form-group">
									<label for="user_id"> 구매자 </label>
									<input type="text" class="form-control" id="user_id" readonly/>
								</div>
								<div class="form-group">
									<label for="movie_buy_date"> 구매 시간 </label>
									<input type="text" class="form-control" id="movie_buy_date" readonly/>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">
									닫기
								</button>
							</div>
							</div>
							<div class="col-md-2"></div>
					</div>
				</div>
			</div>

<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!--  페이지별 내용 -->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화상품관리_영화상품조회</h4>
						</div>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="container-fluid">
										<div class="row" style="margin-top: 20px;">
											<div class="col-md-12">
												<div class="jumbotron">
													<h2>영화 제목 : ${sghMovieProductVo.movie_name}</h2>
												    <h4>상영관 : ${sghMovieProductVo.theater_name}</h4>
													<h4>상영 스크린 : ${sghMovieProductVo.screen_name}</h4>
													<h4>상영 시간 : ${sghMovieProductVo.movie_start_time} ~ ${sghMovieProductVo.movie_end_time}</h4>
													<h4>총 좌석 : ${sghMovieProductVo.screen_total_seat}</h4>
													<h4>행 : ${sghMovieProductVo.screen_seat_row}  열 : ${sghMovieProductVo.screen_seat_col}</h4>
													<h4>예약 수 : ${sghMovieProductVo.screen_total_seat - sghMovieProductVo.seat_check_cnt}</h4>
													<h4>남은 좌석 수 : ${sghMovieProductVo.seat_check_cnt}</h4>
												</div>
												<div style="margin-top: 15px;">
													<a class="btn-sm" href="/sgh/admin/scheduleProduct/scheduleProductList" style="background: #58D3F7; color: white;">목록</a>
												</div>
												<div>
													<strong style="text-align: center;"><p style="text-align: center;">영화 스크린</p></strong>
													<table id="seat_table">
														<tbody id="seat_tbody">
														
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>