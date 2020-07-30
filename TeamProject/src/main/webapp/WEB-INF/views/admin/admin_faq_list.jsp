<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.eventTitle:hover {
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
$(function () {
	$("#board_manage > dd").css("display","block");
	$("#board_manage > dt").css("color","red");
	$("#board_manage > dd").eq(2).css("color","blue");
	
	var rMsg = "${rMsg}";
	if(rMsg == "success") {
		alert("등록되었습니다.");
	}
	
	var dMsg = "${dMsg}";
	if (dMsg == "success") {
		alert("삭제되었습니다.");
	}
	
});
</script>

<body class="js">
<%@ include file="../user/jmh/include/formPage.jsp" %>
<!-- 해더 부분 -->
<%@include file="../include/admin_header.jsp" %>
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
									<h4 class="title" >게시판관리_FAQ조회</h4>
								</div>	
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">
										
									<div class="single-shorter" style="vertical-align:middle;">
										<label>검색 :</label>
										<select id="selectSearch">
											<option selected="selected" value="ename">이벤트명</option>
										</select>
									</div>

									<input type="text" name="keyword" id="keyword"/>
									<button class="btn" id="searchBtn">검색</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<div style="padding-bottom:20px;">
									<h6 style="color:green;">* 이벤트 주제를 클릭하면 상세페이지로 이동합니다.</h6>
								</div>
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:70px;">순서</th>
											<th>FAQ 주제</th>
											<th style="width:400px;">FAQ 등록일</th> 
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
									<!--  이벤트 조회 -->
									<c:forEach items="${jmhFAQVo}" var="vo">
										<tr style="height:50px;">
											<td>${vo.faq_code}</td>
											<td><a href="/admin/admin_select_faq?faq_code=${vo.faq_code}" class="faq_Title">${vo.faq_title}</a></td>
											<td>${vo.faq_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
						<!--페이징-->
						<div class="row">
							<div class="col-md-5">
							</div>
							<div class="col-md-7">
								<nav>
			 						<ul class="pagination">
									<!-- 이전 -->
			 							<c:if test="${jmhPagingDto.startPage != 1}">
			 								<li class="page-item"><a class="page-link" href="${jmhPagingDto.start_page - 1}">&laquo;</a></li>
			 							</c:if>
									<!-- 페이지 넘버링 -->
			 							<c:forEach begin="${jmhPagingDto.startPage}" end="${jmhPagingDto.endPage}" var="v">
											<li class="page-item
			 									<c:if test="${jmhPagingDto.page == v }">
			 										active
			 									</c:if>
			 									"
			 								>
			 									<a class="page-link" href="${v}">${v}</a>
			 								</li>
			 							</c:forEach>
									<!-- 다음 -->
			 							<c:if test="${jmhPagingDto.endPage < jmhPagingDto.totalPage}">
			 								<li class="page-item"><a class="page-link" href="${jmhPagingDto.endPage + 1}">&raquo;</a></li>
			 							</c:if>
			 						</ul>
			 					</nav>
							</div>
						</div>
					<!--  페이징 끝 -->
					</div>
				</div>
			</div>
		</section>
</body>
<%@ include file="../include/footer.jsp" %>
</html>