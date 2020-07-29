<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/admin_header.jsp" %>

<script>
$(function() {
	$(".page-link").css("float", "left");
	$(".page-item").css("float", "left");
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove()
	
	$("#btnAreaSearch").click(function() {
		var start_row ="${sghPagingDto.start_row}";
		var end_row ="${sghPagingDto.end_row}";
		var area_code = $("#select_area option:selected").attr("data-area-code");
		
		location.href = "/sgh/admin/movieTheaterList?start_row=" + start_row + "&end_row=" + end_row + "&area_code=" + area_code;
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
						<select id="select_area">
								<option data-area-code='all'>전체 검색</option>
							<c:forEach items="${area_list}" var="sghAreaVo">
								<option data-area-code="${sghAreaVo.area_code}">${sghAreaVo.area_name}</option>
							</c:forEach>
						</select>
						<button id="btnAreaSearch" type="button" class="btn btn-sm">검색</button>
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
												<th>수정</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${theater_list}" var="SghTheaterVo">
											<tr>
												<td>${SghTheaterVo.area_name}</td>
												<td><a href="/sgh/admin/movieScreen/screenList?theater_code=${SghTheaterVo.theater_code}" style="color:blue;">${SghTheaterVo.theater_name}</a></td>
												<td>${SghTheaterVo.theater_address}</td>
												<td><a href="/sgh/admin/movieTheaterModify?theater_code=${SghTheaterVo.theater_code}" class="btn-primary" style="color: white;">수정</a></td>
												<td><a href="/sgh/admin/deleteTheater?theater_code=${SghTheaterVo.theater_code}" class="btn-danger" style="color: white;">삭제</a></td>
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
						 								<li class="page-item"><a class="page-link" href="/sgh/admin/movieTheaterList?start_page=${sghPagingDto.start_page - 1}&area_code=${sghPagingDto.area_code}">&laquo;</a></li>
						 							</c:if>
						<!--  								페이지 넘버링 -->
						 							<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
														<li class="page-item
						 									<c:if test="${sghPagingDto.page == v }">
						 										active
						 									</c:if>
						 									"
						 								>
						 									<a class="page-link" href="/sgh/admin/movieTheaterList?page=${v}&area_code=${sghPagingDto.area_code}">${v}</a>
						 								</li>
						 							</c:forEach>
						<!--  								다음 -->
						 							<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
						 								<li class="page-item"><a class="page-link" href="/sgh/admin/movieTheaterList?end_page=${sghPagingDto.end_page + 1}&area_code=${sghPagingDto.area_code}">&raquo;</a></li>
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