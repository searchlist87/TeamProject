<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.food_title:hover {
		color:red;
	}
.page-item {
	float:left;
}
.page-link {
	width:30px;
	float:left;
}
</style>
<script>
$(function() {
	$("#product_list > dd").css("display","block");
	$("#product_list > dt").css("color","red");
	$("#product_list > dd").eq(1).css("color","blue");
	
	
	// 페이지 버튼 클릭시 해당 페이지 넘어가게
	$("a.page-link").click(function(e) {
		e.preventDefault();
		
		var page = $(this).attr("href");
		console.log("page:" + page);
		
		$("#adminForm > input[name=page]").val(page);
		$("#adminForm").submit();
// 		location.href = "/kdh/admin/admin_food_buy_list?page=" + page;
	});
	
	// 현재 페이지 액티브 설정
	$("a.page-link").each(function() {
		var page = $(this).attr("href");
		if (page == "${pagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
	
	// 검색 버튼
	$("#btnSearch").click(function() {
		var searchType = $("#searchSelect").val();
		var keyword = $("#keyword").val();
		console.log("searchType:" + searchType);
		console.log("keyword:" + keyword);
		$("#adminForm > input[name=searchType]").val(searchType);
		$("#adminForm > input[name=perPage]").val(10);
		$("#adminForm > input[name=keyword]").val(keyword);
		$("#adminForm").submit();
		
// 		location.href = "/kdh/admin/admin_food_buy_list?page=" + page;
	});
	
	// 매출보기 버튼 
	$("#btnShow").click(function() {
		$("#modal-138960").trigger("click");
		// 모달에 검색 버튼
		$("#btnSales").click(function() {
			var mm_minus = $("#mm_minus option:selected").val();
			var food_code = $("#food_code option:selected").val();
			var url = "/kdh/admin/salesAjax";
			var sendData = {
				"food_code" : food_code,
				"mm_minus" : mm_minus
			};
			$.ajax({
				"type" : "get",
				"url" : url,
				"data" : sendData,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				"success" : function(rData) {
					console.log(rData);
					$("#sales_result").text("총 매출은 " + rData + "원 입니다.");
					$("#btnClose").css("display", "");
				}
			});
		});
	});
	
	
});
</script>

<body class="js">
<%@ include file="../../../user/jmh/include/formPage.jsp" %>
<!-- 해더 부분 -->
<%@include file="../../../include/admin_header.jsp" %>
<!-- 폼 전송 -->
<form id="adminForm" action="/kdh/admin/admin_food_buy_list" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
</form>
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;">
									<h4 class="title" >구매 내역조회(푸드)</h4>
								</div>	
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">
									<button style="float: left;" type="button" class="btn" id="btnShow">매출액 보기</button>
										<!-- 매출보기 모달창 -->
											<div class="row">
												<div class="col-md-12">
													 <a id="modal-138960" style="display: none;" href="#modal-container-138960" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
													<div class="modal fade" id="modal-container-138960" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="myModalLabel">
																	</h5> 
																	<button type="button" class="close" data-dismiss="modal">
																		<span aria-hidden="true">X</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div class="row">
																		<div class="col-md-12">
																			<div class="form-inline form-group" id="price_select" style="margin-top: 30px; margin-left: 100px; text-align:center;">
																				<label for="mm_minus" >기간 : </label>
																				<select id="mm_minus">
																					<option value=0 selected>전체 매출</option>
																					<option value=-1>1달 매출</option>
																					<option value=-3>3달 매출</option>
																					<option value=-5>5달 매출</option>
																					<option value=-12>1년 매출</option>
																				</select>
																				<label for="food_code">선택 : </label>
																				<select id="food_code" name="food_code">　　
																					<option value="all">전체</option>
																					<option value="100">스낵</option>
																					<option value="200">음료</option>
																					<option value="300">패키지</option>
																				</select>
																			　　<button id="btnSales" type="button" class="btn">검색</button><br/>　
																			</div>
																			<div class="row">
																			<div class="col-md-2">
																				<h1>　　　</h1></div>
																			<div class="col-md-8"></div>
																			<div class="col-md-2"></div>
																			</div>
																			<div style="text-align:center;">
																				<h4 id="sales_result"></h4><br/>
																				<button type="button" id="btnClose" class="btn" data-dismiss="modal" style="display : none;">닫기</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
									<div class="single-shorter" style="vertical-align:middle;">
										<label>검색 :</label>
										<select id="searchSelect" name=searchType>
											<option value="all"
											<c:if test="${pagingDto.searchType == 'all'}">selected</c:if>
											>전체</option>
											<option value="user_id"
											<c:if test="${pagingDto.searchType == 'user_id'}">selected</c:if>
											>사용자</option>
											<option value="food_name"
											<c:if test="${pagingDto.searchType == 'food_name'}">selected</c:if>
											>상품명</option>
										</select>
									</div>
									<input type="text" id="keyword" value="${pagingDto.keyword}"/>
									<button type="button" class="btn" id="btnSearch">검색</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:100px;">상품명</th>
											<th style="width:100px;">구매자</th>
											<th style="width:100px;">상품금액</th>
											<th style="width:130px;">구매수량</th>
											<th style="width:100px;">구매일</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
								
									<!-- 상품(스토어) 조회 -->
									<c:forEach items="${buyFoodList}" var="buyFoodList">
										<tr>
											<td style="vertical-align:middle;">${buyFoodList.food_name}</td>
											<td style="vertical-align:middle;">${buyFoodList.user_id}</td>
											<td style="vertical-align:middle;"><fmt:formatNumber pattern="#,###,###" value="${buyFoodList.food_buy_total_price}"></fmt:formatNumber>원</td>
											<td style="vertical-align:middle;">${buyFoodList.food_buy_count}</td>
											<td style="vertical-align:middle;">${buyFoodList.food_buy_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
						
						<!-- 페이징 -->
						<div class="row"  style="text-align:center;">
							<div class="col-md-12" style="padding-left: 400px;">
							<div class="col-md-9"></div>
								<div class="col-md-5 text-center" style="text-align:center;">
									<nav style="text-align:center;">
										<ul class="pagination text-center" style="text-align:center;">
										
										<!-- 이전 버튼 -->
										<c:if test ="${pagingDto.startPage != 1}">
											<li class="page-item" style="width:60px;"  style="float:left;">
										    	<a class="page-link" href="${pagingDto.startPage - 1}">이전</a>
											</li>
										</c:if>
						
									 	<!-- 페이징 넘버링 -->
									 	<c:forEach begin="${pagingDto.startPage}" end="${pagingDto.endPage}" var="v">
										    <li id="pageNumber" class="page-item"  style="width:30px; float:left;">
										    	<a class="page-link" href="${v}">${v}</a>
										    </li>
										</c:forEach>    	
										
										<!-- 다음 버튼 -->
										 <c:if test="${pagingDto.endPage < pagingDto.totalPage}">
										   <li class="page-item" style="width:60px; float:left;">
										   	<a class="page-link" href="${pagingDto.endPage + 1}">다음</a>
										   </li>
										  </c:if>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-md-4"></div>
							<div class="col-md-12" style="margin-bottom: 100px;"></div>	
						</div>
						<!-- /페이징 -->
					</div>
				</div>
			</div>
		</section>
</body>
<%@ include file="../../../include/footer.jsp" %>
</html>