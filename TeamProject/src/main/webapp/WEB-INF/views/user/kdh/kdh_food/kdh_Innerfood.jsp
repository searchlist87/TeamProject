<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>
 <!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	
<style>
.button1 {
  width: 20px;
  background-color: white;
  color: black;
  border: 2px solid #000000;
}
</style>

<body class="js">
<script>
$(function() {
	
	// 구매 후 취소 버튼
	function btnCancle() {
		$("#cancleContent").toggle();
	}
	
	// 상품이용안내 버튼 
	function btnUseGuide() {
		$("#useContent").toggle();
	}
	
	// 수량/금액 증가 버튼
	$("#btnPlus").click(function() {
		var count = "${foodVo.food_count}";
		// 수량 증가
		var index = $("#btnCount").text();
		var Iindex = parseInt(index);
		if (Iindex < count) {
			var indexPlus = Iindex + 1;
			$("#btnCount").text(indexPlus);
			
			// 수량에 따른 가격 증가
			var price = $("#price").attr("data-price");
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
				$("#price").text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
			} else {
				$("#price").text(firstPriceIndex3+","+lastPriceIndex3+"원");
			}
		};
	});
	
	// 수량/금액 감소 버튼
	$("#btnMius").click(function() {
		// 수량 감소
		var index = $("#btnCount").text();
		var Iindex = parseInt(index);
		if (Iindex > 1) {
		indexMius = Iindex - 1;
		} else if (Iindex = 1) {
				indexMius = 1;
		}
		$("#btnCount").text(indexMius);
		
		// 수량에 따른 가격 감소
		var price = $("#price").attr("data-price");
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
			$("#price").text(firstPriceIndex3+","+centerPriceIndex3+","+lastPriceIndex3+"원");
		} else {
			$("#price").text(firstPriceIndex3+","+lastPriceIndex3+"원");
		}
	});
	
 	// 구매하기 버튼
	$("#btnBuy").click(function() {
		var num = "${foodVo.food_num}";
		var price = $("#price").attr("data-price");
		var buy_count = $("#btnCount").text();
		
		var food_num = parseInt(num);
		console.log("food_num:"+ food_num);
		var iprice = parseInt(price);
		console.log("iprice:"+ iprice);
		var food_buy_count = parseInt(buy_count);
		console.log("food_buy_count:"+ food_buy_count);
		var food_buy_price = iprice;
		console.log("food_buy_price:"+ food_buy_price);
// 		location.href = "/kdh/food/cart?food_num="+food_num+"&food_buy_price="+food_buy_price+"&food_buy_count="+food_buy_count;
// 		location.href = "/kdh/food/cart?foodInfoDto="+foodInfoDto;
	});
});
</script>
<!-- 해더 부분 -->
<%@include file="../../../include/header.jsp" %>

<!-- 바디 부분 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
			
	</div>
	<div class="row">
		<div class="col-md-2">
		
		</div>
		<div class="col-md-8">
		
			<div class="row">
				<!-- 바디 왼쪽 이미지-->
				<div class="col-md-6" style="text-align: center">
					<img alt="${foodVo.food_name} 이미지" src="/resources/images/kdh/${foodVo.food_image}" style="width: 500px; height:auto;"/>
				</div>
				
				<!-- 바디 오른쪽 이미지-->
				<div id="priceDiv" class="col-md-6">
					<h2>${foodVo.food_name}</h2>
					<hr/>
					<p>유효기간　　　구매일로부터 92일 이내 사용 가능</p>
					<p>판매수량　　　1회 8개 구매가능</p>
					<p>구매 후 취소　　　구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.
					<hr/>
					<div>수량/금액　　　<button class="button1" id="btnMius" type="button">-</button> 
					<span id="btnCount">1</span>
					<button class="button1" id="btnPlus" type="button">+</button>
					　　　<a id="price" data-price="${foodVo.food_price}"><fmt:formatNumber pattern="#,###,###" value="${foodVo.food_price}"></fmt:formatNumber>원</a>　　　<button id="btnBuy" type="button" class="btn">구매하기</button>
					</div>
					<hr/>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				 <hr/>
				<button id="btnCancle" type="button" class="btn" onclick="btnCancle()">구매 후 취소</button>
				<br/><br/><div id="cancleContent" style="display:none">■ 연장/취소/환불 안내<br/>
				본 상품은 구매일로부터 10일 이내에 취소 가능합니다.<br/>
				- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.<br/>
				- 구매일로부터 5년까지 유효기간 연장이 가능합니다.<br/>
				- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다.<br/>
				- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.<br/>
				- 본 상품은 현금으로 환불이 불가합니다.<br/>
				 ※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청이 가능합니다.</div><br/>
				<button id="btnUseGuide" type="button" class="btn" onclick="btnUseGuide()">상품이용안내</button>
				<br/><br/><div id="useContent" style="display:none">■ 이용 안내<br/>
				본 상품의 사용 기한은 구매일로부터 92일까지입니다.<br/>
				- 영화관 매점에서 스토어 쿠폰번호 제시 후 상품으로 교환하실 수 있습니다.<br/>
				- 본 상품은 온라인 전용 판매 상품으로 현장 구매는 불가합니다.<br/>
				- 구매한 상품은 “내정보 > 구매내역”에서 확인할 수 있습니다.<br/>
				- 팝콘 및 음료의 맛, 크기, 종류 변경 시 추가 금액이 발생할 수 있습니다.<br/>
				- 상기 이미지는 실제 제품과 다를 수 있습니다.</div><br/>
			</div>
			<div class="col-md-2">
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<h1>　　　</h1></div>
			<div class="col-md-8"></div>
			<div class="col-md-2"></div>
		</div>
</div>







<%@ include file="../../../include/footer.jsp" %>
</body>
