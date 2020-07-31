<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
<style>
	label {
		margin-left: 10px;
		margin-right: 10px;
	}
</style>
<script>
$(function() {
	$("#product_list > dd").css("display","block");
	$("#product_list > dt").css("color","red");
	$("#product_list > dd").eq(0).css("color","blue");
	
	$(".page-link").css("float", "left");
	$(".page-item").css("float", "left");
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove()
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// tab1
	
	// tab1 검색 기능
	$("#btnSearch").click(function() {
		var page = "${sghPagingDto.page}";
		var start_row ="${sghPagingDto.start_row}";
		var end_row ="${sghPagingDto.end_row}";
		var category = $("#category option:selected").val();
		var keyword = $("#keyword").val();
		
		if(keyword == "구매") {
			keyword = "Y";
		} else if(keyword == "환불") {
			keyword = "N";
		}
		location.href = "/sgh/admin/buyListForm?start_row=" + start_row + "&end_row=" + end_row + "&category=" + category + "&keyword=" + keyword;
	});
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// tab2
	
	// 지역 에이잭스 요청
	$("#area_code").change(function() {
		$(".theater_select").remove();
		$(".movie_select").remove();
		var area_code = $(this).val();
		var url = "/sgh/admin/areaAjax";
		var sendData = {
				"area_code" : area_code
		};
		
		$.getJSON(url, sendData, function(rData) {
			var select = "<label for='theater_code' class='theater_select'>영화관 :</label><select id='theater_code' class='theater_select'>";
				select += "<option value='all' selected>전체 영화관</option>";
			console.log("rData :" + rData);
			$.each(rData, function() {
				var theater_code = (this).theater_code;
				var theater_name = (this).theater_name;
				select += "<option value='"+theater_code+"'>"+theater_name+"</option>";
			});
			select += "</select>";
			$("#area_code").after(select);
		});
	});
	
	// 영화관 에이잭스 요청
	$("#price_select").on("change", "#theater_code", function() {
		$(".movie_select").remove();
		var theater_code = $(this).val();
		var url = "/sgh/admin/theaterAjax";
		var sendData = {
				"theater_code" : theater_code
		};
		$.get(url, sendData, function(rData) {
			var select = "<label for='movie_code' class='movie_select'>영화 :</label><select id='movie_code' class='movie_select'>";
			select += "<option value='all' selected>전체 영화</option>";
			$.each(rData, function() {
				var movie_code = (this).movie_code;
				var movie_name = (this).movie_name;
				select += "<option value='"+movie_code+"'>"+movie_name+"</option>";
			});
			select += "</select>";
			$("#theater_code").after(select);
		});
	});
	
	$("#btnPrice").click(function() {
		var movie_code = $("#movie_code option:selected").val();
		var theater_code =$("#theater_code option:selected").val();
		var area_code = $("#area_code option:selected").val();
		var mm_minus = $("#mm_minus option:selected").val();
		var url = "/sgh/admin/priceAjax";
		var sendData = {
				"movie_code" : movie_code,
				"theater_code" : theater_code,
				"area_code" : area_code,
				"mm_minus" : mm_minus
		};
		$.get(url, sendData, function(rData) {
			$("#price_result").text("총 매출은 " + rData + "원 입니다.");
		});
	});
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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
							<h4 class="title" style="text-align: center;">구매내역 조회_영화 구매 내역 조회</h4>
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
												<a class="nav-link" href="#tab2" data-toggle="tab">매출 내역 조회</a>
											</li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="tab1">
													<p>
														<select id="category" name="category">
															<option selected>전체 검색</option>
															<option value='area_name'>지역명</option>
															<option value='theater_name'>영화관명</option>
															<option value='movie_name'>영화제목</option>
															<option value='user_id'>유저</option>
															<option value='movie_buy_check'>상태</option>
														<c:forEach items="${area_list}" var="sghAreaVo">
															<option data-area-code="${sghAreaVo.area_code}">${sghAreaVo.area_name}</option>
														</c:forEach>
														</select>
														<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요.">
														<button id="btnSearch" type="button" class="btn-success">검색</button>
													</p>
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
																			<td>${sghAdminMovieBuyVo.movie_price }원</td>
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
													 								<li class="page-item"><a class="page-link" href="/sgh/admin/buyListForm?start_page=${sghPagingDto.start_page - 1}&keyword=${sghPagingDto.keyword}&category=${sghPagingDto.category}">&laquo;</a></li>
													 							</c:if>
													<!--  								페이지 넘버링 -->
													 							<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
																					<li class="page-item
													 									<c:if test="${sghPagingDto.page == v }">
													 										active
													 									</c:if>
													 									"
													 								>
													 									<a class="page-link" href="/sgh/admin/buyListForm?page=${v}&keyword=${sghPagingDto.keyword}&category=${sghPagingDto.category}">${v}</a>
													 								</li>
													 							</c:forEach>
													<!--  								다음 -->
													 							<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
													 								<li class="page-item"><a class="page-link" href="/sgh/admin/buyListForm?end_page=${sghPagingDto.end_page + 1}&keyword=${sghPagingDto.keyword}&category=${sghPagingDto.category}">&raquo;</a></li>
													 							</c:if>
													 						</ul>
													 					</nav>
																	</div>
																</div>
															</div>
														</div>
													</div>
											</div>
											<div class="tab-pane" id="tab2">
												<div class="row">
													<div class="col-md-12">
														<div class="form-inline form-group" id="price_select" style="margin-top: 20px;">
															<label for="mm_minus">기간 :</label>
															<select id="mm_minus">
																<option value=0 selected>전체 매출</option>
																<option value=-1>1달 매출</option>
																<option value=-3>3달 매출</option>
																<option value=-5>5달 매출</option>
																<option value=-12>1년 매출</option>
															</select>
															<label for="area_code">지역 :</label>
															<select id="area_code" name="area_code">
																<option value="all">전체</option>
																<c:forEach items="${area_list}" var="SghAreaVo">
																	<option value="${SghAreaVo.area_code}">${SghAreaVo.area_name}</option>
																</c:forEach>
															</select>
														</div>
														<div style="float: right;">
														<button id="btnPrice" type="button" class="btn btn-sm">
															검색
														</button>
														</div>
													</div>
													<div style="text-align: center;">
														<span><h4 id="price_result"></h4></span>
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
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>