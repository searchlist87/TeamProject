<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>

<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
 <!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>


<script>
$(function() {
//  	var msg = "${findCartResult}";
// 	if (msg == "true") {
// 		alert("중복안내 모달창 등장");
// 	} 
	
	// 수량/금액 증가 버튼
	$(".btnPlus").click(function() {
		var count = $(".btnSetCount").attr("data-food-count");
		// 수량 증가
		var index = $(this).parent().find($(".btnCount")).text();
		var Iindex = parseInt(index);
		if (Iindex < count) {
			var indexPlus = Iindex + 1;
			$(this).parent().find($(".btnCount")).text(indexPlus);
			
			// 수량에 따른 가격 증가
			var price = $(this).parent().parent().parent().find($(".food_price")).attr("data-price");
			var pricePlus = (price * indexPlus);
			var StringpricePlus = String(pricePlus);
			var PriceLastIndex3 = StringpricePlus.substring(StringpricePlus.length-3);
			var priceFirstIndex = StringpricePlus.substring(0,StringpricePlus.length);
			priceIndex = StringpricePlus.substring(priceFirstIndex,PriceLastIndex3);
			
			var firstPriceIndex3;
			var centerPriceIndex3;
			var lastPriceIndex3;
			
			if(StringpricePlus.length == 4) {
				firstPriceIndex3 = StringpricePlus.substr(0,1);
				lastPriceIndex3 = StringpricePlus.substr(1,4);
			} else if(StringpricePlus.length == 5) {
				firstPriceIndex3 = StringpricePlus.substr(0,2);
				lastPriceIndex3 = StringpricePlus.substr(2,5);
			} else if(StringpricePlus.length == 6) {
				firstPriceIndex3 = StringpricePlus.substr(0,3);
				lastPriceIndex3 = StringpricePlus.substr(3,6);
			} else if(StringpricePlus.length == 7) {
				firstPriceIndex3 = StringpricePlus.substr(0,1);
				centerPriceIndex3 = StringpricePlus.substr(1,4);
				lastPriceIndex3 = StringpricePlus.substr(4,7);
			} else if(StringpricePlus.length == 8) {
				firstPriceIndex3 = StringpricePlus.substr(0,2);
				centerPriceIndex3 = StringpricePlus.substr(2,5);
				lastPriceIndex3 = StringpricePlus.substr(5,8);
			}

			if (centerPriceIndex3 != null) {
				var total_price = $(this).parent().parent().parent().find($(".sumPrice")).text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
			} else {
				var total_price = $(this).parent().parent().parent().find($(".sumPrice")).text(firstPriceIndex3+","+lastPriceIndex3+"원");
			}
		};
	});

	// 수량/금액 감소 버튼
	$(".btnMius").click(function() {
		// 수량 감소
		var index = $(this).parent().find($(".btnCount")).text();
		var Iindex = parseInt(index);
		if (Iindex > 1) {
		indexMius = Iindex - 1;
		} else if (Iindex = 1) {
				indexMius = 1;
		}
		$(this).parent().find($(".btnCount")).text(indexMius);
		
		// 수량에 따른 가격 감소
		var price = $("#food_price").attr("data-price");
		var priceMius = (price * indexMius);
		
		var StringpriceMius = String(priceMius);
		var PriceLastIndex3 = StringpriceMius.substring(StringpriceMius.length-3);
		var priceFirstIndex = StringpriceMius.substring(0,StringpriceMius.length);
		priceIndex = StringpriceMius.substring(priceFirstIndex,PriceLastIndex3);
		
		var firstPriceIndex3;
		var centerPriceIndex3;
		var lastPriceIndex3;
		
		if(StringpriceMius.length == 4) {
			firstPriceIndex3 = StringpriceMius.substr(0,1);
			lastPriceIndex3 = StringpriceMius.substr(1,4);
		} else if(StringpriceMius.length == 5) {
			firstPriceIndex3 = StringpriceMius.substr(0,2);
			lastPriceIndex3 = StringpriceMius.substr(2,5);
		} else if(StringpriceMius.length == 6) {
			firstPriceIndex3 = StringpriceMius.substr(0,3);
			lastPriceIndex3 = StringpriceMius.substr(3,6);
		} else if(StringpriceMius.length == 7) {
			firstPriceIndex3 = StringpriceMius.substr(0,1);
			centerPriceIndex3 = StringpriceMius.substr(1,4);
			lastPriceIndex3 = StringpriceMius.substr(4,7);
		} else if(StringpriceMius.length == 8) {
			firstPriceIndex3 = StringpriceMius.substr(0,2);
			centerPriceIndex3 = StringpriceMius.substr(2,5);
			lastPriceIndex3 = StringpriceMius.substr(5,8);
		}
		
		if (centerPriceIndex3 != null) {
			var total_price = $(this).parent().parent().parent().find($(".sumPrice")).text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
		} else {
			var total_price = $(this).parent().parent().parent().find($(".sumPrice")).text(firstPriceIndex3+","+lastPriceIndex3+"원");
		}
	}); // 수량/금액 감소 버튼
	
	// 수정 버튼
	$(".btnUpdate").click(function() {
		
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
								<th class="text-center">
									<i class="ti-trash remove-icon"></i>
								</th>
							</tr>
						</thead>
						<tbody class="Ttbody" id="Ttbody">
						<c:forEach items="${list}" var="foodVo">
							<tr id="food_tr">
								<td class="image"><img src="/resources/images/kdh/${foodVo.food_image}" alt="${foodVo.food_image}"></td>
								<td class="product-des" data-title="Description">
									<p class="product-name"><a href="#">${foodVo.food_name}</a></p>
								</td>
								<td class="food_price" id="food_price" data-price="${foodVo.food_price}"><span><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_price}"></fmt:formatNumber></span>원</td>
								<td class="qty" data-title="Qty">
									<div data-food-count="${foodVo.food_count}" class="input-group btnSetCount" style="text-align: center;">
										<button class="btnMius" type="button">-</button> 
										<span class="btnCount">${foodVo.food_cart_count}</span>
										<button class="btnPlus" type="button">+</button>　
										<button class="btnUpdate" type="button" style="width:50px; height:40px;">수정</button>
									</div>
								</td>
								<td class="total-amount" data-total-price="${foodVo.buy_food_price}"><span class="sumPrice" ><fmt:formatNumber pattern="#,###,###" value="${foodVo.buy_food_price}"></fmt:formatNumber>원</span></td>
								<td class="action" data-title="Remove"><a href="/cart/delete?food_cart_num=${foodVo.food_cart_num}"><i class="ti-trash remove-icon"></i></a></td>
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
										<li>총 상품금액<span class="totalPrice" id="totalPrice" ><fmt:formatNumber pattern="#,###,###" value=""></fmt:formatNumber>원</span></li>
										<li>쿠폰 사용<span class="couponPrice" id="couponPrice" ><fmt:formatNumber pattern="#,###,###" value=""></fmt:formatNumber>원</span></li>
										<li>총 결제금액<span class="lastPrice" id="lastPrice" ><fmt:formatNumber pattern="#,###,###" value=""></fmt:formatNumber>원</span></li>
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
						<p>주문 즉시 조리</p>
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
	

<!-- 푸더 부분 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>