<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
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
							<h4 class="title" style="text-align: center;">구매내역 조회</h4>
						</div>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="tabbable" id="tabs-486188">
										<ul class="nav nav-tabs">
											<li class="nav-item">
												<a class="nav-link active" href="#tab1" data-toggle="tab">모든 영화 구매 내역 조회</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#tab2" data-toggle="tab">영화관 별 구매 내역 조회</a>
											</li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="tab1">
												<p>
												<!--  페이지별 내용 -->
													<div class="container-fluid">
														<div class="row">
															<div class="col-md-12">
																<table class="table">
																	<thead>
																		<tr>
																			<th>지역</th>
																			<th>영화관명</th>
																			<th>영화제목</th>
																			<th>구매자</th>
																			<th>영화금액</th>
																			<th>구매일</th>
																			<th>상태</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${sghAdminMovieBuyVoList}" var="sghAdminMovieBuyVo">
																		<tr>
																			<td>${sghAdminMovieBuyVo.area_name}</td>
																			<td>${sghAdminMovieBuyVo.theater_name}</td>
																			<td>${sghAdminMovieBuyVo.movie_name }</td>
																			<td>${sghAdminMovieBuyVo.user_id}</td>
																			<td>${sghAdminMovieBuyVo.movie_buy_date }</td>
																			<td>${sghAdminMovieBuyVo.movie_buy_date }</td>
																			<td>
																				<c:choose>
																				<c:when test="${sghAdminMovieBuyVo.movie_buy_check == 'Y'}">
																					구매
																				</c:when>
																				<c:otherwise>
																					환불
																				</c:otherwise>	
																				</c:choose>
																			</td>
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
													 								<li class="page-item"><a class="page-link" href="/sgh/admin/buyListForm?start_page=${sghPagingDto.start_page - 1}&area_code=${sghPagingDto.area_code}">&laquo;</a></li>
													 							</c:if>
													<!--  								페이지 넘버링 -->
													 							<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
																					<li class="page-item
													 									<c:if test="${sghPagingDto.page == v }">
													 										active
													 									</c:if>
													 									"
													 								>
													 									<a class="page-link" href="/sgh/admin/buyListForm?page=${v}&area_code=${sghPagingDto.area_code}">${v}</a>
													 								</li>
													 							</c:forEach>
													<!--  								다음 -->
													 							<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
													 								<li class="page-item"><a class="page-link" href="/sgh/admin/buyListForm?end_page=${sghPagingDto.end_page + 1}&area_code=${sghPagingDto.area_code}">&raquo;</a></li>
													 							</c:if>
													 						</ul>
													 					</nav>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</p>
											</div>
											<div class="tab-pane" id="tab2">
												<p>
													<select id="select_area">
														<option data-area-code='all'>전체 검색</option>
													<c:forEach items="${area_list}" var="sghAreaVo">
														<option data-area-code="${sghAreaVo.area_code}">${sghAreaVo.area_name}</option>
													</c:forEach>
													</select>
													<button id="btnAreaSearch" type="button" class="btn btn-sm">검색</button>
												</p>
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
<%@ include file="/WEB-INF/views/include/footer.jsp" %>