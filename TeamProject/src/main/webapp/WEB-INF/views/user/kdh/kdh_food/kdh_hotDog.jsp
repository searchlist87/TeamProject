<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>

<style>
.button1 {
  background-color: white;
  color: black;
  border: 2px solid #000000;
}
</style>

<body class="js">
<script>
function btnCancle() {
	$("#cancleContent").toggle();
}

function btnUseGuide() {
	$("#useContent").toggle();
}
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
					<img alt="캬라멜 팝콘 이미지" src="/resources/images/kdh/카라멜.jpg" />
				</div>
				
				<!-- 바디 오른쪽 이미지-->
				<div class="col-md-6">
					<h2>캬라멜 팝콘(L)</h2>
					<hr/>
					<p>유효기간　　　구매일로부터 92일 이내 사용 가능</p>
					<p>판매수량　　　1회 8개 구매가능</p>
					<p>구매 후 취소　　　구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.
					<hr/>
					<div>수량/금액　　　<button class="button1" id="btnMius" type="button">-</button> 
					<button class="button1" id="btnCount" type="button">갯수</button> 
					<button class="button1" id="btnPlus" type="button">+</button>
					　　　<a>6,000원</a>　　　<button id="btnBuy" type="button" class="btn">구매하기</button>
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
