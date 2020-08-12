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
	// 전체 상품 체크박스 선택
	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk) {
		  $(".selectCheck").prop("checked", true);
		} else {
		  $(".selectCheck").prop("checked", false);
		}
		});
	
	// 해당 상품 선택
	$(".selectCheck").click(function(){
 		$("#allCheck").prop("checked", false);
 		var sumPrice = 0;
 		var btnCount = 0;
 		var cartPrice = 0;
 		$(".selectCheck").each(function() {
 			if ($(this).prop("checked")) {
	 			var btnCount = parseInt($(this).parent().parent().find(".btnCount").text())
	 			var cartPrice = parseInt($(this).attr("data-cartPrice"));
 				sumPrice += (btnCount * cartPrice);
 			}
 		});
 		console.log(sumPrice);
 		$("#totalPrice").text(sumPrice+"원");
 		$("#totalPrice").attr("data-productPrice", sumPrice);
 		$("#lastPrice").text(sumPrice+"원");
 		$("#lastPrice").attr("data-totalprice", sumPrice);
 		
	});
	
	// 선택된 제품 삭제하기
	$(".removeSelect").click(function() {
		 var r = confirm("체크된 상품을 삭제하시겠습니까?");
		 
		 if(r == true) {
			 var checkArr = new Array();
			 $("input[class='selectCheck']:checked").each(function(){
			 	checkArr.push($(this).attr("data-cartNum"));
			 });
			 
			 $.ajax({
				url : "/kdh/cart/delete",
				type : "post",
				data : { "selectCheck" : checkArr },
				success : function(result) {
					console.log("result: " + result);
					if(result == 1) {
						var user_id = "${user_id}";
						location.href = "/kdh/cart/displayCart?user_id="+user_id;
					} else if(result == 3){
						location.href = "/kdh/food/buyFoodNone";
					} else {
						alert("삭제 실패");
					}
			    }
			 });
		 } 
	});
	
	
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
			var totalPlus = $(this).parent().parent().parent().find($(".small_total")).attr("data-total-price", pricePlus);
			
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
		var totalPlus = $(this).parent().parent().parent().find($(".small_total")).attr("data-total-price", priceMius);
		
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
	
	// 변경 버튼
	$(".btnUpdate").click(function() {
		var food_cart_count = $(this).parent().find($(".btnCount")).text();
		var price = $("#food_price").attr("data-price");
		
		var buy_food_price = price * food_cart_count;
		
		var food_cart_num = $(this).attr("data-food-cart-num");
		var sendData = {
				"food_cart_count" : food_cart_count,
				"buy_food_price" : buy_food_price,
				"food_cart_num" : food_cart_num
		};
		var url = "/kdh/cart/update";
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				var sum = 0;
				$.each($(".small_total"), function() {
				});
			}
		});
		
		var i_count = 0;
		var i_price = 0;
		var priceSum = 0;
		var priceTotalSum = 0;
		
		$(".selectCheck").each(function() {
 			if ($(this).prop("checked")) {
	 			i_count = parseInt($(this).parent().parent().find(".btnCount").text());
	 			i_price = parseInt($(this).attr("data-cartPrice"));
 				priceSum += i_count * i_price;
		 		console.log("priceSum: " + priceSum);
		 		$("#totalPrice").text(priceSum+"원");
		 		$("#totalPrice").attr("data-productPrice", priceSum);
		 		$("#lastPrice").text(priceSum+"원");
		 		$("#lastPrice").attr("data-totalprice", priceSum);
 			}
 		});
		
	});
	
	// 결제하기 버튼
	$("#btnBuy").click(function() {
		var food_buy_price = $("#totalPrice").text();
		var couponPrice = $("#couponPrice").text();
		var food_buy_priceIndex = food_buy_price.substring(0,food_buy_price.length-1);
		var couponPriceIndex = couponPrice.substring(0,couponPrice.length-1);
		var a = food_buy_priceIndex.replace("," ,"");
		var b = $.trim(a);

		$("#food_buy_price1").val(b);
		$("#used_Point1").val(couponPriceIndex);

		var food_num_arr = new Array();
		$("input[class='selectCheck']:checked").each(function() {
			food_num = $(this).attr("data-foodnum");
			console.log("food_num: " + food_num);
			var input_food_num = "<input type='hidden' name='food_frm_num' value='" +food_num+"'/>";
			$("#cartForm").append(input_food_num);
			food_num_arr.push(food_num);
		});
		
		$("#cartForm").submit();
	});
	
	// 쓰레기통 모양 클릭
	$(".action").click(function() {
		var r = confirm("해당 상품을 삭제하시겠습니까?");
		if(r == true) {
			var food_cart_num = $(this).attr("data-food-cart-num");
			location.href="/kdh/cart/delete?food_cart_num="+food_cart_num;
		} else {
		}
	});
	
	// 포인트 사용 버튼
	$("#btnUse").click(function() {
		var couponPrice = $("#pointInfo").val();
		console.log("couponPrice:" + couponPrice);
		var StringcouponPrice = String(couponPrice);
		var usedPoint = $("#UsecouponPrice").val();
		var totalPrice = $("#totalPrice").attr("data-productprice");
		console.log("totalPrice: " + totalPrice);
		console.log("usedPoint: " + usedPoint);
		console.log("couponPrice: " + couponPrice);
		
		if(usedPoint < 0) {
			alert("포인트를 사용할 수 없습니다.");
			$("#couponPrice").text("0P");
			$("#UsecouponPrice").val("0");
			return;
		}
		
		var total_sum = couponPrice - usedPoint;
		if(total_sum < 0) {
			alert("포인트를 사용할 수 없습니다.")
			$("#UsecouponPrice").val("0");
			$("#couponPrice").text("0P");
			return;
		}
		
		total_sum = totalPrice - usedPoint;
		if(total_sum < 0) {
			alert("포인트를 사용할 수 없습니다.")
			$("#UsecouponPrice").val("0");
			$("#couponPrice").text("0P");
			return;
		}
		$("#couponPrice").text(couponPrice+"P");
		$("#couponPrice").text(usedPoint+"P");
		
		var lastPrice = totalPrice - usedPoint;
		$("#lastPrice").text(lastPrice+"원");
	});
	
	// 포인트 삭제하기 버튼
	$("#btnUseNo").click(function() {
		var used_point = $("#UsecouponPrice").val();
		var totalPrice = $("#totalPrice").attr("data-productprice");
		if(used_point < 0) {
			alert("포인트를 사용할 수 없습니다.");
			$("#lastPrice").text(totalPrice+"원");
			$("#couponPrice").text("0P");
			$("#UsecouponPrice").val("0");
			return;
		}
		$("#lastPrice").text(totalPrice+"원");
		$("#couponPrice").text("0P");
		$("#UsecouponPrice").val("0");
	});
});

</script>

<body class="js">

<!-- 해더 부분 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
</head>

<!-- 폼 전송 -->
<form id="cartForm" action="/kdh/cart/buyCart" method="post">
	<input type="hidden" id="food_buy_price1" name="food_buy_price1" value=""/>
	<input type="hidden" id="used_Point1" name="used_Point1" value=""/>
</form>
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
		 						<th>
									<div class="allCheck">
										<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
									</div>
								</th>
								<th>상품</th>
								<th>이름</th>
								<th class="text-center">가격</th>
								<th class="text-center">개수</th>
								<th class="text-center">합계</th> 
								<th class="text-center">
									<i class="removeSelect ti-trash remove-icon"></i>
								</th>
							</tr>
						</thead>
						<tbody class="Ttbody" id="Ttbody">
						<c:forEach items="${list}" var="foodVo">
							<tr id="food_tr">
								<td class="checkBox">
								   <input type="checkbox" name="selectCheck" class="selectCheck" data-cartNum="${foodVo.food_cart_num}" data-cartPrice="${foodVo.food_price}" data-foodnum="${foodVo.food_num}"/>
								</td>
								<td class="image"><img src="/kdh/upload/displayFile?fileName=${foodVo.food_image}" alt="${foodVo.food_image}"></td>
								<td class="product-des" data-food-num="${foodVo.food_num}">
									<p class="product-name"><a href="#">${foodVo.food_name}</a></p>
								</td>
								<td class="food_price" id="food_price" data-price="${foodVo.food_price}"><span><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_price}"></fmt:formatNumber></span>원</td>
								<td class="qty" data-title="Qty">
									<div data-food-count="${foodVo.food_count}" class="input-group btnSetCount" style="text-align: center;">
										<button class="btnMius" type="button">-</button> 
										<span class="btnCount">${foodVo.food_cart_count}</span>
										<button class="btnPlus" type="button">+</button>　
										<button data-food-cart-num="${foodVo.food_cart_num}" class="btnUpdate btn btn-sm" type="button">변경</button>
									</div>
								</td>
								<td class="total-amount small_total" data-total-price="${foodVo.buy_food_price}"><span class="sumPrice" ><fmt:formatNumber pattern="#,###,###" value="${foodVo.buy_food_price}"></fmt:formatNumber>원</span></td>
								<td class="action" data-food-cart-num="${foodVo.food_cart_num}"><i class="ti-trash remove-icon"></i></td>
								<td class="data-food-num" style="display : none;" data-food-num="${foodVo.food_num}"></td>
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
									<ul>
										<li>적립포인트 사용　　　적립포인트 잔액　　　<input id="pointInfo" type="text" style="text-align:right;" value="${totalPoint}" name="pointInfo" readonly>원</li>
										<li>사용 포인트　　　<input data-point="${userInfo.user_point}" id="UsecouponPrice" type="number" value="0" name="Coupon" placeholder="0" style="text-align:right;">원　
										<a id="btnUse" class="btn" style="color: white;">사용하기</a>　
										<a id="btnUseNo" class="btn" style="color: white;">삭제하기</a></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<div class="right">
									<ul>
										<li>총 상품금액<span data-productPrice="" class="totalPrice" id="totalPrice" ><fmt:formatNumber pattern="#,###,###" value="${food_total_money}"></fmt:formatNumber>원</span></li>
										<li>포인트 사용<span data_point="" class="couponPrice" id="couponPrice" >0P</span></li>
										<li>총 결제금액<span data-totalPrice="" class="lastPrice" id="lastPrice" ><fmt:formatNumber pattern="#,###,###" value="${food_total_money}"></fmt:formatNumber>원</span></li>
									</ul>
									<div class="button5">
										<button id="btnBuy" class="btn btn-sm">결제하기</button>
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