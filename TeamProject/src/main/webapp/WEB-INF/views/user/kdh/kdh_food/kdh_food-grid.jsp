<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		console.log("page:" + page);
		
		location.href = "/kdh/food/foodView?page=" + page;
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
									<c:forEach items="${listLatestFood}" var="LatestFood">
									<div class="single-post first">
										<div class="image">
											<img src="/resources/images/kdh/${LatestFood.food_image}" alt="${LatestFood.food_image}">
										</div>
										<div class="content">
											<h5><a href="#">${LatestFood.food_name}</a></h5>
											<p class="price">${LatestFood.food_price}</p>
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
											<span>${foodVo.food_price}</span>
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
		
		
		
		<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
						</div>
						<div class="modal-body">
							<div class="row no-gutters">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
									<!-- Product Slider -->
										<div class="product-gallery">
											<div class="quickview-slider-active">
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
											</div>
										</div>
									<!-- End Product slider -->
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
									<div class="quickview-content">
										<h2>Flared Shift Dress</h2>
										<div class="quickview-ratting-review">
											<div class="quickview-ratting-wrap">
												<div class="quickview-ratting">
													<i class="yellow fa fa-star"></i>
													<i class="yellow fa fa-star"></i>
													<i class="yellow fa fa-star"></i>
													<i class="yellow fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<a href="#"> (1 customer review)</a>
											</div>
											<div class="quickview-stock">
												<span><i class="fa fa-check-circle-o"></i> in stock</span>
											</div>
										</div>
										<h3>$29.00</h3>
										<div class="quickview-peragraph">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
										</div>
										<div class="size">
											<div class="row">
												<div class="col-lg-6 col-12">
													<h5 class="title">Size</h5>
													<select>
														<option selected="selected">s</option>
														<option>m</option>
														<option>l</option>
														<option>xl</option>
													</select>
												</div>
												<div class="col-lg-6 col-12">
													<h5 class="title">Color</h5>
													<select>
														<option selected="selected">orange</option>
														<option>purple</option>
														<option>black</option>
														<option>pink</option>
													</select>
												</div>
											</div>
										</div>
										<div class="quantity">
											<!-- Input Order -->
											<div class="input-group">
												<div class="button minus">
													<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
														<i class="ti-minus"></i>
													</button>
												</div>
												<input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
												<div class="button plus">
													<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
														<i class="ti-plus"></i>
													</button>
												</div>
											</div>
											<!--/ End Input Order -->
										</div>
										<div class="add-to-cart">
											<a href="#" class="btn">Add to cart</a>
											<a href="#" class="btn min"><i class="ti-heart"></i></a>
											<a href="#" class="btn min"><i class="fa fa-compress"></i></a>
										</div>
										<div class="default-social">
											<h4 class="share-now">Share:</h4>
											<ul>
												<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
												<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
												<li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
												<li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal end -->
		
<!-- 페이징 -->
<div class="row"  style="text-align:center;">
	<div class="col-md-4"></div>
		<div class="col-md-8 text-center" style="text-align:center;">
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