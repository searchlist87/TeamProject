<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/admin_header.jsp" %>

<script src="/resources/js/sgh_js/timestmap_change.js"></script>
<script>
$(function() {
	$("#theater_manage > dd").css("display","block");
	$("#theater_manage > dt").css("color","red");
	$("#theater_manage > dd").eq(0).css("color","blue");
	
	$(".page-link").css("float", "left");
	$(".page-item").css("float", "left");
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove()
	
	var del_result = "${del_result}";
	if(del_result == "false") {
		alert("삭제에 실패하셨습니다.");
	}
	
	$(".del_date").each(function() {
		var date = $(this).text();
		var del_date = timestmap_change(date);
		$(this).text(del_date);
		console.log("del_date :" + del_date);
	});
	
	$("#btnAreaSearch").click(function() {
		var start_row ="${sghPagingDto.start_row}";
		var end_row ="${sghPagingDto.end_row}";
		var area_code = $("#select_area option:selected").attr("data-area-code");
		
		location.href = "/sgh/admin/deleteTheaterList?start_row=" + start_row + "&end_row=" + end_row + "&area_code=" + area_code;
	});
});
</script>

<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 관리_영화관 조회</h4>
						</div>
						<div class="form-inline">
							<select id="select_area" class="form-control">
									<option data-area-code='all'>전체 검색</option>
								<c:forEach items="${area_list}" var="sghAreaVo">
									<option data-area-code="${sghAreaVo.area_code}">${sghAreaVo.area_name}</option>
								</c:forEach>
							</select>
							<button id="btnAreaSearch" type="button" class="btn-success" style="margin-left: 10px;">검색</button>
							<a href="/sgh/admin//movieTheaterList" class="btn-sm" style="margin-left: 10px; background-color: black; color: white;">등록된 목록</a>
						</div>
						<!--  페이지별 내용 -->
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>지역</th>
												<th>영화관명</th>
												<th>주소</th>
												<th>시작일</th>
												<th>종료일</th>
												<th>삭제일</th>
												<th>복구</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${theater_list}" var="SghTheaterVo">
											<tr>
												<td>${SghTheaterVo.area_name}</td>
												<td><a href="/sgh/admin/movieScreen/screenList?theater_code=${SghTheaterVo.theater_code}" style="color:blue;">${SghTheaterVo.theater_name}</a></td>
												<td>${SghTheaterVo.theater_address}</td>
												<td>${SghScheduleVo.movie_start_date}</td>
												<td>${SghScheduleVo.movie_end_date}</td>
												<td class="del_date">${SghTheaterVo.theater_del_date}</td>
												<td><a href="/sgh/admin/restoreTheater?theater_code=${SghTheaterVo.theater_code}" class="btn-warning" style="color: white;">복구</a></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!--페이징-->
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-5">
										</div>
										<div class="col-md-7">
											<nav>
						 						<ul class="pagination">
						<!--  							이전 -->
						 							<c:if test="${sghPagingDto.start_page != 1}">
						 								<li class="page-item"><a class="page-link" href="/sgh/admin/deleteTheaterList?start_page=${sghPagingDto.start_page - 1}&area_code=${sghPagingDto.area_code}">&laquo;</a></li>
						 							</c:if>
						<!--  								페이지 넘버링 -->
						 							<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
														<li class="page-item
						 									<c:if test="${sghPagingDto.page == v }">
						 										active
						 									</c:if>
						 									"
						 								>
						 									<a class="page-link" href="/sgh/admin/deleteTheaterList?page=${v}&area_code=${sghPagingDto.area_code}">${v}</a>
						 								</li>
						 							</c:forEach>
						<!--  								다음 -->
						 							<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
						 								<li class="page-item"><a class="page-link" href="/sgh/admin/deleteTheaterList?end_page=${sghPagingDto.end_page + 1}&area_code=${sghPagingDto.area_code}">&raquo;</a></li>
						 							</c:if>
						 						</ul>
						 					</nav>
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
<%@ include file="../../../include/footer.jsp" %>