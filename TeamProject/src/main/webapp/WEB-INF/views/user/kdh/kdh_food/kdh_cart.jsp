<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>

<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>
 <!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>


<script>
$(function() {
	$("#btnSetCount").click(function() {
		var food_count = $("#food_count").val();
		var price = $("#food_price").text();
		console.log("price:" + price);
		var food_price = parseInt(price);
		console.log("food_price:" + food_price);
		var sumPrice = (food_count * food_price) * 1000;
		console.log("sumPrice:" + sumPrice);
		
		$("#sumPrice").text((sumPrice)+"원");
	});
});

</script>

<body class="js">

<!-- 해더 부분 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

</head>

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">홈<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">장바구니</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<!-- Shopping Cart -->
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					<table class="table shopping-summery">
						<thead>
							<tr class="main-hading">
								<th>상품</th>
								<th>이름</th>
								<th class="text-center">가격</th>
								<th class="text-center">개수</th>
								<th class="text-center">합계</th> 
								<th class="text-center"><i class="ti-trash remove-icon"></i></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.foodList}" var="foodVo">
							<tr>
								<td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td>
								<td class="product-des" data-title="Description">
									<p class="product-name"><a href="#">${foodVo.food_name}</a></p>
								</td>
								<td class="price" id="food_price" data-title="Price"><span><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_price}"></fmt:formatNumber> </span></td>
								<td class="qty" data-title="Qty">
									<div id="btnSetCount" class="input-group">
										<div class="button minus">
											<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
												<i class="ti-minus"></i>
											</button>
										</div>
										<input type="text" id="food_count" name="quant[1]" class="input-number"  data-min="1" data-max="${foodVo.food_count}" value="${foodVo.food_buy_count}">
										<div class="button plus">
											<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
												<i class="ti-plus"></i>
											</button>
										</div>
									</div>
								</td>
								<td id="sumPrice" class="total-amount" data-title="Total"><span><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_buy_price}"></fmt:formatNumber>원</span></td>
								<td class="action" data-title="Remove"><a href="#"><i class="ti-trash remove-icon"></i></a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Total Amount -->
					<div class="total-amount">
						<div class="row">
							<div class="col-lg-8 col-md-5 col-12">
								<div class="left">
									<div class="coupon">
										<form action="#" target="_blank">
											<input name="Coupon" placeholder="쿠폰 사용">
											<button class="btn">사용하기</button>
										</form>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<div class="right">
									<ul>
										<li>총 상품금액<span>가격</span></li>
										<li>쿠폰 사용<span>가격</span></li>
										<li class="last">총 결제금액<span>가격</span></li>
									</ul>
									<div class="button5">
										<a href="#" class="btn">결제하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/ End Total Amount -->
				</div>
			</div>
		</div>
	</div>
	<!--/ End Shopping Cart -->
			
	<!-- Start Shop Services Area  -->
	<section class="shop-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>싱싱한 맛</h4>
						<p>주문시 즉시 조리</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>재활용</h4>
						<p>종이 상자 사용</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>안전한 거래</h4>
						<p>100% 안전한 거래 제공</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>저렴한 가격</h4>
						<p>저렴한 가격 제공</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Newsletter -->
<div class="col-md-12" style="margin-bottom: 100px;"></div>	
	
	
	
	<!-- Modal -->
<!--         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"> -->
<!--             <div class="modal-dialog" role="document"> -->
<!--                 <div class="modal-content"> -->
<!--                     <div class="modal-header"> -->
<!--                         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button> -->
<!--                     </div> -->
<!--                     <div class="modal-body"> -->
<!--                         <div class="row no-gutters"> -->
<!--                             <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12"> -->
<!--                                 Product Slider -->
<!-- 									<div class="product-gallery"> -->
<!-- 										<div class="quickview-slider-active"> -->
<!-- 											<div class="single-slider"> -->
<!-- 												<img src="images/modal1.jpg" alt="#"> -->
<!-- 											</div> -->
<!-- 											<div class="single-slider"> -->
<!-- 												<img src="images/modal2.jpg" alt="#"> -->
<!-- 											</div> -->
<!-- 											<div class="single-slider"> -->
<!-- 												<img src="images/modal3.jpg" alt="#"> -->
<!-- 											</div> -->
<!-- 											<div class="single-slider"> -->
<!-- 												<img src="images/modal4.jpg" alt="#"> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								End Product slider -->
<!--                             </div> -->
<!--                             <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12"> -->
<!--                                 <div class="quickview-content"> -->
<!--                                     <h2>Flared Shift Dress</h2> -->
<!--                                     <div class="quickview-ratting-review"> -->
<!--                                         <div class="quickview-ratting-wrap"> -->
<!--                                             <div class="quickview-ratting"> -->
<!--                                                 <i class="yellow fa fa-star"></i> -->
<!--                                                 <i class="yellow fa fa-star"></i> -->
<!--                                                 <i class="yellow fa fa-star"></i> -->
<!--                                                 <i class="yellow fa fa-star"></i> -->
<!--                                                 <i class="fa fa-star"></i> -->
<!--                                             </div> -->
<!--                                             <a href="#"> (1 customer review)</a> -->
<!--                                         </div> -->
<!--                                         <div class="quickview-stock"> -->
<!--                                             <span><i class="fa fa-check-circle-o"></i> in stock</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <h3>$29.00</h3> -->
<!--                                     <div class="quickview-peragraph"> -->
<!--                                         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p> -->
<!--                                     </div> -->
<!-- 									<div class="size"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-lg-6 col-12"> -->
<!-- 												<h5 class="title">Size</h5> -->
<!-- 												<select> -->
<!-- 													<option selected="selected">s</option> -->
<!-- 													<option>m</option> -->
<!-- 													<option>l</option> -->
<!-- 													<option>xl</option> -->
<!-- 												</select> -->
<!-- 											</div> -->
<!-- 											<div class="col-lg-6 col-12"> -->
<!-- 												<h5 class="title">Color</h5> -->
<!-- 												<select> -->
<!-- 													<option selected="selected">orange</option> -->
<!-- 													<option>purple</option> -->
<!-- 													<option>black</option> -->
<!-- 													<option>pink</option> -->
<!-- 												</select> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!--                                     <div class="quantity"> -->
<!-- 										Input Order -->
<!-- 										<div class="input-group"> -->
<!-- 											<div class="button minus"> -->
<!-- 												<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]"> -->
<!-- 													<i class="ti-minus"></i> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 											<input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1"> -->
<!-- 											<div class="button plus"> -->
<!-- 												<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]"> -->
<!-- 													<i class="ti-plus"></i> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										/ End Input Order -->
<!-- 									</div> -->
<!-- 									<div class="add-to-cart"> -->
<!-- 										<a href="#" class="btn">Add to cart</a> -->
<!-- 										<a href="#" class="btn min"><i class="ti-heart"></i></a> -->
<!-- 										<a href="#" class="btn min"><i class="fa fa-compress"></i></a> -->
<!-- 									</div> -->
<!--                                     <div class="default-social"> -->
<!-- 										<h4 class="share-now">Share:</h4> -->
<!--                                         <ul> -->
<!--                                             <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li> -->
<!--                                             <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li> -->
<!--                                             <li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li> -->
<!--                                             <li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!-- Modal end -->

<!-- 푸더 부분 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>