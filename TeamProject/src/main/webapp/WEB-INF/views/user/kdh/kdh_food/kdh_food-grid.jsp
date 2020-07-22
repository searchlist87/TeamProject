<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<style>
	.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
}

</style>
<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>

  <!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>

<script>
$(function() {
	// 페이지 버튼 클릭시 해당 페이지 넘어가게
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		console.log("page:" + page);
		
		location.href = "/kdh/food/foodView?page=" + page;
	});
	
	// 현재 페이지 액티브 설정
	$("a.page-link").each(function() {
		var page = $(this).attr("href");
		if (page == "${pagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
	
});
</script>
</head>
<body class="js">

<!-- 해더 부분 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

	<!-- 음식 메인 사진 -->
	<div class="foodMain" style="background-color:black">
		<div style="background-color:black" class="container">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div>
						<img src="/resources/images/kdh/팝콘.png" style="height:400px; width:70%;"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ 음식 메인 사진 -->
		<div></div>
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
								<!-- Single Widget -->
								<div class="single-widget category">
									<h3 class="title">카테고리</h3>
									<ul class="categor-list">
										<li><a href="/kdh/food/snack">스낵</a></li>
										<li><a href="/kdh/food/drink">음료</a></li>
										<li><a href="/kdh/food/package">패키지</a></li>
									</ul>
								</div>
								<!--/ End Single Widget -->
								
								<!-- Single Widget -->
								<div class="single-widget recent-post">
									<h3 class="title">최신 상품</h3>
									<!-- Single Post -->
									<c:forEach items="${listLatestFood}" var="listLatestFood">
									<div class="single-post first">
										<div class="image">
											<img src="/resources/images/kdh/${listLatestFood.food_image}" alt="${listLatestFood.food_image}">
										</div>
										<div class="content">
											<h5><a href="/kdh/food/innerfood?food_num=${listLatestFood.food_num}">${listLatestFood.food_name}</a></h5>
											
											<p class="price"><fmt:formatNumber pattern="#,###,###" value="${listLatestFood.food_price}"></fmt:formatNumber>원</p>
										</div>
									</div>
									</c:forEach>
								</div>
								<!--/ End Single Widget -->
								
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top">
									<div class="shop-shorter">
										<div class="single-shorter">
											<h3>전체</h3>
										</div>
									</div>
									<ul class="view-mode">
										<li class="active"><a href="shop-grid.html"><i class="fa fa-th-large"></i></a></li>
										<li><a href="shop-list.html"><i class="fa fa-th-list"></i></a></li>
									</ul>
								</div>
								<!--/ End Shop Top -->
							</div>
						</div>
						<div class="row">
						<c:forEach items="${listPageFoodlist}" var="foodVo">
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/innerfood?food_num=${foodVo.food_num}">
											<img id="foodImg" class="default-img" data-food-num="${foodVo.food_num}" src="/resources/images/kdh/${foodVo.food_image}" style="height:300px" alt="${foodVo.food_image}">
										<!-- <span class="out-of-stock">Hot</span> -->
										</a>
									</div>
									<div class="product-content" style="text-align: center;">
										<h3><a href="/kdh/food/innerfood?food_num=${foodVo.food_num}">${foodVo.food_name}</a></h3>
										<div class="product-price">
										
											<span><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_price}"></fmt:formatNumber>원</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Product Style 1  -->	
							
		
<!-- 페이징 -->
<div class="row"  style="text-align:center;">
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
	<div class="col-md-4"></div>
	<div class="col-md-12" style="margin-bottom: 100px;"></div>	
</div>
<!-- /페이징 -->

<!-- 푸더 부분 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>