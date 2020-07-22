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
	
	// 쿠폰 사용 버튼
	$("#btnUse").click(function() {
		var couponPrice = $("#UsecouponPrice").val();
		var StringcouponPrice = String(couponPrice);
		
		var index = $("#btnCount").text();
		var Iindex = parseInt(index);
		var price = $("#food_price").attr("data-price");
		var sumPrice = (price * Iindex);
		
		if (sumPrice > couponPrice) {
			var lastPrice = sumPrice-couponPrice;	
			
			var lastPriceToString = String(lastPrice);
			var PriceLastIndex3 = lastPriceToString.substring(lastPriceToString.length-3);
			var priceFirstIndex = lastPriceToString.substring(0,lastPriceToString.length);
			priceIndex = lastPriceToString.substring(priceFirstIndex,PriceLastIndex3);
			
			var firstPriceIndex3;
			var centerPriceIndex3;
			var lastPriceIndex3;
		
			if(lastPriceToString.length == 4) {
				firstPriceIndex3 = lastPriceToString.substr(0,1);
				lastPriceIndex3 = lastPriceToString.substr(1,4);
			} else if(lastPriceToString.length == 5) {
				firstPriceIndex3 = lastPriceToString.substr(0,2);
				lastPriceIndex3 = lastPriceToString.substr(2,5);
			} else if(lastPriceToString.length == 6) {
				firstPriceIndex3 = lastPriceToString.substr(0,3);
				lastPriceIndex3 = lastPriceToString.substr(3,6);
			} else if(lastPriceToString.length == 7) {
				firstPriceIndex3 = lastPriceToString.substr(0,1);
				centerPriceIndex3 = lastPriceToString.substr(1,4);
				lastPriceIndex3 = lastPriceToString.substr(4,7);
			} else if(lastPriceToString.length == 8) {
				firstPriceIndex3 = lastPriceToString.substr(0,2);
				centerPriceIndex3 = lastPriceToString.substr(2,5);
				lastPriceIndex3 = lastPriceToString.substr(5,8);
			}
			
			if (centerPriceIndex3 != null) {
				$("#lastPrice").text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
	
			} else {
				$("#lastPrice").text(firstPriceIndex3+","+lastPriceIndex3+"원");
			}
			
			// 쿠폰 금액 만들기
			var PriceLastIndex3 = StringcouponPrice.substring(StringcouponPrice.length-3);
			var priceFirstIndex = StringcouponPrice.substring(0,StringcouponPrice.length);
			priceIndex = StringcouponPrice.substring(priceFirstIndex,PriceLastIndex3);
			
			var firstPriceIndex3;
			var centerPriceIndex3;
			var lastPriceIndex3;
			
			if(StringcouponPrice.length == 4) {
				firstPriceIndex3 = StringcouponPrice.substr(0,1);
				lastPriceIndex3 = StringcouponPrice.substr(1,4);
			} else if(StringcouponPrice.length == 5) {
				firstPriceIndex3 = StringcouponPrice.substr(0,2);
				lastPriceIndex3 = StringcouponPrice.substr(2,5);
			} else if(StringcouponPrice.length == 6) {
				firstPriceIndex3 = StringcouponPrice.substr(0,3);
				lastPriceIndex3 = StringcouponPrice.substr(3,6);
			} else if(StringcouponPrice.length == 7) {
				firstPriceIndex3 = StringcouponPrice.substr(0,1);
				centerPriceIndex3 = StringcouponPrice.substr(1,4);
				lastPriceIndex3 = StringcouponPrice.substr(4,7);
			} else if(StringcouponPrice.length == 8) {
				firstPriceIndex3 = StringcouponPrice.substr(0,2);
				centerPriceIndex3 = StringcouponPrice.substr(2,5);
				lastPriceIndex3 = StringcouponPrice.substr(5,8);
			}
			
			if (centerPriceIndex3 != null) {
				$("#couponPrice").text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
		
			} else {
				$("#couponPrice").text(firstPriceIndex3+","+lastPriceIndex3+"원");
			}
		
		} else {
			alert("쿠폰을 사용할 수 없습니다.")
			var zero = 0;
			var couponPriceVal = $("#couponPrice").val();
			$("#couponPrice").text(zero + "원");
			var couponPriceText = $("#couponPrice").text();
			
			var lastPrice = sumPrice;	
			var lastPriceToString = String(lastPrice);
			var PriceLastIndex3 = lastPriceToString.substring(lastPriceToString.length-3);
			var priceFirstIndex = lastPriceToString.substring(0,lastPriceToString.length);
			priceIndex = lastPriceToString.substring(priceFirstIndex,PriceLastIndex3);
			
			var firstPriceIndex3;
			var centerPriceIndex3;
			var lastPriceIndex3;
			
			if(lastPriceToString.length == 4) {
				firstPriceIndex3 = lastPriceToString.substr(0,1);
				lastPriceIndex3 = lastPriceToString.substr(1,4);
			} else if(lastPriceToString.length == 5) {
				firstPriceIndex3 = lastPriceToString.substr(0,2);
				lastPriceIndex3 = lastPriceToString.substr(2,5);
			} else if(lastPriceToString.length == 6) {
				firstPriceIndex3 = lastPriceToString.substr(0,3);
				lastPriceIndex3 = lastPriceToString.substr(3,6);
			} else if(lastPriceToString.length == 7) {
				firstPriceIndex3 = lastPriceToString.substr(0,1);
				centerPriceIndex3 = lastPriceToString.substr(1,4);
				lastPriceIndex3 = lastPriceToString.substr(4,7);
			} else if(lastPriceToString.length == 8) {
				firstPriceIndex3 = lastPriceToString.substr(0,2);
				centerPriceIndex3 = lastPriceToString.substr(2,5);
				lastPriceIndex3 = lastPriceToString.substr(5,8);
			}
		
			if (centerPriceIndex3 != null) {
				$("#lastPrice").text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
			} else {
				$("#lastPrice").text(firstPriceIndex3+","+lastPriceIndex3+"원");
			}
		}
	}); // 쿠폰 사용 버튼
	
	// 쿠폰 삭제하기 버튼
	$("#btnUseNo").click(function() {
		var couponPrice = $("#UsecouponPrice").val();
		var StringcouponPrice = String(couponPrice);
		
		var index = $("#btnCount").text();
		var Iindex = parseInt(index);
		var price = $("#food_price").attr("data-price");
		var sumPrice = (price * Iindex);
		
		var zero = 0;
		var couponPriceVal = $("#couponPrice").val();
		$("#couponPrice").text(zero + "원");
		var couponPriceText = $("#couponPrice").text();
		
		var lastPrice = sumPrice;	
		var lastPriceToString = String(lastPrice);
		var PriceLastIndex3 = lastPriceToString.substring(lastPriceToString.length-3);
		var priceFirstIndex = lastPriceToString.substring(0,lastPriceToString.length);
		priceIndex = lastPriceToString.substring(priceFirstIndex,PriceLastIndex3);
		
		var firstPriceIndex3;
		var centerPriceIndex3;
		var lastPriceIndex3;
		
		if(lastPriceToString.length == 4) {
			firstPriceIndex3 = lastPriceToString.substr(0,1);
			lastPriceIndex3 = lastPriceToString.substr(1,4);
		} else if(lastPriceToString.length == 5) {
			firstPriceIndex3 = lastPriceToString.substr(0,2);
			lastPriceIndex3 = lastPriceToString.substr(2,5);
		} else if(lastPriceToString.length == 6) {
			firstPriceIndex3 = lastPriceToString.substr(0,3);
			lastPriceIndex3 = lastPriceToString.substr(3,6);
		} else if(lastPriceToString.length == 7) {
			firstPriceIndex3 = lastPriceToString.substr(0,1);
			centerPriceIndex3 = lastPriceToString.substr(1,4);
			lastPriceIndex3 = lastPriceToString.substr(4,7);
		} else if(lastPriceToString.length == 8) {
			firstPriceIndex3 = lastPriceToString.substr(0,2);
			centerPriceIndex3 = lastPriceToString.substr(2,5);
			lastPriceIndex3 = lastPriceToString.substr(5,8);
		}
	
		if (centerPriceIndex3 != null) {
			$("#lastPrice").text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
		} else {
			$("#lastPrice").text(firstPriceIndex3+","+lastPriceIndex3+"원");
		}
	
	});
	
	
	// 결제하기 버튼
	$("#btnBuy").click(function() {
		location.href="/kdh/food/buyView";
	});
	
	// 쓰레기통 모양 클릭(스토어 홈으로 보내기)
	$("#trash").click(function() {
		var r = confirm("선택하신 상품을 삭제하시겠습니까?");
		if(r == true) {
			location.href = "/kdh/food/buyFoodNone";
		} else {
			
		}
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
							<li class="active"><a href="blog-single.html">주문/결제</a></li>
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
						<tbody id="Ttbody">
							<tr id="food_tr">
								<td class="image"><img src="/resources/images/kdh/${food_image}" alt="${food_image}이미지"></td>
								<td class="product-des" data-title="Description">
									<p class="product-name"><a href="#">${food_name}</a></p>
								</td>
								<td class="price" id="food_price" data-price="${food_price}"><span><fmt:formatNumber pattern="#,###,###" value="${food_price}"></fmt:formatNumber></span>원</td>
								<td class="qty" data-title="Qty">
									<div id="btnSetCount" data-food-count="${food_count}" class="input-group" style="text-align: center;">
										<button class="button1" id="btnMius" type="button">-</button> 
										<span id="btnCount">${buy_food_buy_count}</span>
										<button class="button1" id="btnPlus" type="button">+</button>
									</div>
								</td>
								<td class="total-amount" data-total-price="${buy_food_buy_price}"><span id="sumPrice" ><fmt:formatNumber pattern="#,###,###" value="${buy_food_buy_price}"></fmt:formatNumber>원</span></td>
								<td class="action" data-title="Remove"><i id="trash" class="ti-trash remove-icon"></i></td>
							</tr>
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
											<input id="UsecouponPrice" name="Coupon" placeholder="쿠폰 사용">
											<a id="btnUse" class="btn" style="color: white;">사용하기</a>
											<a id="btnUseNo" class="btn" style="color: white;">삭제하기</a>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<div class="right">
									<ul>
										<li>총 상품금액<span id="totalPrice" ><fmt:formatNumber pattern="#,###,###" value="${buy_food_buy_price}"></fmt:formatNumber>원</span></li>
										<li>쿠폰 사용<span id="couponPrice" ><fmt:formatNumber pattern="#,###,###" value=""></fmt:formatNumber>원</span></li>
										<li>총 결제금액<span id="lastPrice" ><fmt:formatNumber pattern="#,###,###" value="${buy_food_buy_price}"></fmt:formatNumber>원</span></li>
									</ul>
									<div class="button5">
										<a id="btnBuy" href="#" class="btn">결제하기</a>
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