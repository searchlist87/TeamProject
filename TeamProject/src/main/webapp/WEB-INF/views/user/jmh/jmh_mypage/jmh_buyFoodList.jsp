<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style>
.subul {
	padding-left : 30px;
	margin-top : 10px;
	font-size : 15px;
	border : 1px dotted #ccc;
}
</style>

<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function() {
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		console.log("page:" + page);
		
		location.href = "/kdh/mypage/buyFoodList?page=" + page;
	});
});
</script>

<body class="js">  
<div class="container" style="left:100px;margin-top:100px;">
		<h2>My page_마이페이지</h2>
</div>
<!-- Start Contact -->
<section id="contact-us" class="contact-us section" style="padding:50px;">
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="../include/mypage_side_menu.jsp"%>
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
								<h4>My 구매내역</h4>
								<h3>푸드 구매 내역</h3>
							</div>
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>구매번호</th>
												<th>상품명</th>
												<th>상품금액</th>
												<th>구매수량</th>
												<th>구매일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${buyFoodList}" var="buyFoodList">
											<tr>
												<td>${buyFoodList.food_buy_code}</td>
												<td>${buyFoodList.food_name}</td>
												<td><fmt:formatNumber pattern="#,###,###" value="${buyFoodList.food_buy_total_price}"></fmt:formatNumber>원</td>
												<td>${buyFoodList.food_buy_count}</td>
												<td>${buyFoodList.food_buy_date}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
								<!-- 페이징 -->
								<div class="row"  style="text-align:center;">
									<div class="col-md-12" style="padding-left: 300px;">
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
												    <li id="pageNumber"  style="width:30px; float:left;" class="page-item 
														<c:if test="${pagingDto.page == v }">
												   			 active 
														</c:if>
														">
														<a id="pageNumber" class="page-link" href="${v}">${v}</a>
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
			</div>
		</div>
		
	

</section>


<!--/ End Contact -->
<%@ include file="../../../include/footer.jsp"%>
</body>
</html>