<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<style>
	td {
		text-align: center;
	}
	th {
		text-align: center;
	}
</style>
<script src="/resources/js/sgh_js/timestmap_change.js"></script>
<script>
$(function() {
	$("#movie_time_manage > dd").css("display","block");
	$("#movie_time_manage > dt").css("color","red");
	$("#movie_time_manage > dd").eq(2).css("color","blue");
	
	$(".start_time").each(function() {
		var start_time = $(this).text();
		var start_time_change = timestmap_change(start_time);
		$(this).text(start_time_change);
	});
	
	$(".end_time").each(function() {
		var end_time = $(this).text();
		var end_time_change = timestmap_change(end_time);
		$(this).text(end_time_change);
	});
	
	$("#btnSearch").click(function() {
		var category = $("#select_category option:selected").val();
		var keyword = $("#input_keyword").val();
		$("#category").val(category);
		$("#keyword").val(keyword);
		
		$("#frmSearch").submit();
	});
});
</script>
<form id="frmSearch" action="/sgh/admin/movieTime/restoreTimeList" method="get"> 
	<input type="hidden" id="category" name="category">
	<input type="hidden" id="keyword" name="keyword">
</form>
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
							<h4 class="title">상영일정관리_상영회차조회</h4>
						</div>
						<!--  페이지별 내용 -->
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<select id="select_category" style="float: left; height: 35px;">
										<option value="movie_name" selected>상영작</option>
										<option value="theater_name">영화관</option>
									</select>
										<input type="text" class="form-inline" id="input_keyword" placeholder="전체검색은 그냥 검색 버튼" style="float: left;">
										<button type="button" id="btnSearch" class="btn-sm" style="background-color: green; color: white;">검색</button>
									</div>
									<div style="margin-top: 10px;">
										<a href="/sgh/admin/movieTime/movieTimeList" class="btn-sm" style="background-color: black; color: white;">등록된 상영작 목록</a>
										<a href="/sgh/admin/movieTime/deleteMovieTimeList" class="btn-sm" style="background-color: orange; color: white;">삭제된 상영작 목록</a>
										<a href="/sgh/admin/movieTime/endOupMovieTimeList" class="btn-sm" style="background-color: black; color: white;">기간이 지난 상영작 목록</a>
									</div>
									<div class="container-fluid">
										<div class="row">
											<div class="col-md-12"></div>
												<table class="table">
													<thead>
														<tr>
															<th>상영작</th>
															<th>영화관</th>
															<th>상영관</th>
															<th>시작</th>
															<th>종료</th>
															<th>금액</th>
															<th>삭제일</th>
															<th>복구</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${time_list }" var="SghMovieTimeListVo">
														<tr>
															<td>${SghMovieTimeListVo.movie_name}</td>
															<td>${SghMovieTimeListVo.theater_name}</td>
															<td>${SghMovieTimeListVo.screen_name}</td>
															<td class="start_time">${SghMovieTimeListVo.movie_start_time}</td>
															<td class="end_time">${SghMovieTimeListVo.movie_end_time}</td>
															<td>${SghMovieTimeListVo.movie_money}원</td>
															<td>${SghMovieTimeListVo.movie_time_del_date}</td>
															<td><a href="/sgh/admin/movieTime/restoreMovieTime?movie_time_code=${SghMovieTimeListVo.movie_time_code}" class="btn-warning" style="color: white;">복구</a></td>
														</tr>
													</c:forEach>
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
							<li class="page-item"><a class="page-link" href="/sgh/admin/movieTime/deleteMovieTimeList?start_page=${sghPagingDto.start_page - 1}">&laquo;</a></li>
						</c:if>
<!--  								페이지 넘버링 -->
						<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
						<li class="page-item
								<c:if test="${sghPagingDto.page == v }">
									active
								</c:if>
								"
							>
								<a class="page-link" href="/sgh/admin/movieTime/deleteMovieTimeList?page=${v}" style="float: left;">${v}</a>
							</li>
						</c:forEach>
<!--  								다음 -->
						<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
							<li class="page-item"><a class="page-link" href="/sgh/admin/movieTime/deleteMovieTimeList?end_page=${sghPagingDto.end_page + 1}">&raquo;</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>