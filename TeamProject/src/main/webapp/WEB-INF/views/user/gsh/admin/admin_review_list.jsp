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
	// 페이지 버튼 클릭시 해당 페이지 넘어가게
	// 링크 수정 필요
	
	// 현재 페이지 액티브 설정
	$("a.page-link").each(function() {
		var page = $(this).attr("href");
		if (page == "${pagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
	
	// 리뷰 삭제 기능
	$("#commentTable > tbody").on("click", ".btnDelete", function() {
		console.log("삭제클릭");
		var that = $(this);
		var review_num = $(this).parent().parent().find("td").eq(0).text();
		console.log("review_num:" + review_num);
		var url = "/gsh/admin/admin_review_delete";
	    var sendData = {
					"review_num" :	review_num
		};
		$.get(url, sendData, function(rData) {
		});
		location.reload();
	});
	
	// 검색 기능
	$("#btnSearch").click(function() {
		// 클릭 기능 활성화 확인
	});
	
});
</script>

<body class="js">
<%@ include file="../../../user/jmh/include/formPage.jsp" %>
<!-- 해더 부분 -->
<%@include file="../../../include/admin_header.jsp" %>
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
									<h4 class="title" >리뷰 관리 페이지</h4>
								</div>	
								
								<!--  검색 -->
<!-- 								<div style="padding:20px;text-align:right;"> -->
										
<!-- 									<div class="single-shorter" style="vertical-align:middle;"> -->
<!-- 											<label>검색 :</label> -->
<!-- 											<select id="searchSelect" name=searchType> -->
<!-- 												<option value="review_content" -->
<%-- 												<c:if test="${GshMovieDto.searchType == 'review_content'}">selected</c:if> --%>
<!-- 												>리뷰내용</option> -->
<!-- 												<option value="user_id" -->
<%-- 												<c:if test="${GshMovieDto.searchType == 'user_id'}">selected</c:if> --%>
<!-- 												>작성자</option> -->
<!-- 												<option value="review_score" -->
<%-- 												<c:if test="${GshMovieDto.searchType == 'review_score'}">selected</c:if> --%>
<!-- 												>평점</option> -->
<!-- 											</select> -->
<!-- 										</div> -->

<%-- 									<input type="text" id="keyword" value="${GshMovieDto.keyword}"/> --%>
<!-- 									<button type="button" class="btn" id="btnSearch">검색</button> -->
<!-- 								</div>	 -->
								<!--  검색 끝 -->
								
								<!--  페이지별 내용 -->
								
								<table id="commentTable" class="table">
									<thead>
										<tr style="background-color: #ccc;">
											<th>리뷰 번호</th>
											<th>작성자 아이디</th>
											<th>리뷰 내용</th>
											<th>평점</th>
											<th>작성일</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody class="tbody">
										<c:forEach items="${reviewList}" var="GshReviewVo">
										<tr>
											<td>${GshReviewVo.review_num}</td>
											<td>${GshReviewVo.user_id}</td>
											<td>${GshReviewVo.review_content}</td>
											<td>${GshReviewVo.review_score}</td>
											<td>${GshReviewVo.review_date}</td>
											<td><button type="button" class="btn btn-sx btnDelete">삭제</button></td>
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
							<div class="col-md-9"></div>
								<div class="col-md-5 text-center" style="text-align:center;">
									<nav style="text-align:center;">
										<ul class="pagination text-center" style="text-align:center;">
										
										<!-- 이전 버튼 -->
										<c:if test ="${gshPagingDto.startPage != 1}">
											<li class="page-item" style="width:60px;"  style="float:left;">
										    	<a class="page-link" href="/gsh/admin/admin_review_list?startPage=${gshPagingDto.startPage - 1}">이전</a>
											</li>
										</c:if>
						
									 	<!-- 페이징 넘버링 -->
									 	<c:forEach begin="${gshPagingDto.startPage}" end="${gshPagingDto.endPage}" var="v">
										    <li id="pageNumber" class="page-item"  style="width:30px; float:left;">
										    	<a class="page-link" href="/gsh/admin/admin_review_list?page=${v}">${v}</a>
										    </li>
										</c:forEach>    	
										
										<!-- 다음 버튼 -->
										  <c:if test="${gshPagingDto.endPage < gshPagingDto.totalPage}">
										    <li class="page-item" style="width:60px; float:left;">
										    	<a class="page-link" href="/gsh/admin/admin_review_list?endPage=${gshPagingDto.endPage + 1}">다음</a>
										    </li>
										   </c:if>
										</ul>
									</nav>
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