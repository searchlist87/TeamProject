<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<script>
$(function() {
	var result = "${result}";
	if(result == "false") {
		alert("실패하였습니다.");
		return;
	}
	
	var user_point = 0;
	var use_point = 0;
	var pointSearchIndex = 0;
	// 포인트 조회
	$("#btnPointSearch").click(function() {
		var url = "/sgh/book/userPoint";

		$.get(url, function(rData) {
			user_point = rData;
			$("#user_point").val(user_point);
			pointSearchIndex++;
		});
	});
	
	// 포인트 사용하기
	$("#btnPointUse").click(function() {
		$("#pointResult").remove();
		var pointUse = 0;
		pointUse = $("#pointUse").val();
		
		// 포인트 조회를 누르지 않고 포인트 사용하기를 눌렀을 경우
		if(pointSearchIndex == 0) {
			$("#btnPointUse").parent().after("<div id='pointResult'><span style='color:red;'>포인트 조회를 해주세요.</span></div>");
			return;
		}
		
		// 포인트 사용하기를 눌렀으나 입력을 하지 않았을 경우
		if(pointUse == "" || pointUse == null) {
			$("#btnPointUse").parent().after("<div id='pointResult'><span style='color:red;'>포인트를 입력해주세요.</span></div>");
			return;
		}
		
		// 보유하고 있는 포인트보다 큰 수를 입력했을 경우
		if(pointUse > user_point) {
			$("#btnPointUse").parent().after("<div id='pointResult'><span style='color:red;'>보유하신 포인트를 넘으셨습니다.</span></div>");
			return;
		}
		
		$("#point_use").text(pointUse + "P");
		var total = 0;
		total = "${sghPaymentVo.movie_price * sghChoiceSeatDto.personnel}";
		$("#total").text((total - pointUse) + "원");
		var index_result = total - pointUse;
		if(index_result < 0) {
			alert("포인트는 계산 금액을 넘어설수 없습니다.");
			return false;
		}
		
		$("#use_point").val(pointUse);
		
	});
	
	// 결제 진행
	$("#btnPayment").click(function() {
		$("#frmPayment").submit();
	});
});
</script>
</head>
<form id="frmPayment" action="/sgh/payment/paymentRun" method="post">
	<c:forEach items="${sghChoiceSeatDto.schedule_code_arr}" var="schedule_code">
	<input type="hidden" name="schedule_code_arr" value="${schedule_code}">
	</c:forEach>
	<input type="hidden" id="use_point" name="use_point" value="0">
</form>
<body class="js">
<!-- Start Checkout -->
<section class="shop checkout section">
	<div class="container">
		<div class="row"> 
			<div class="col-lg-5 col-5">
				<div class="checkout-form">
					<h2>영화 제목 : ${sghPaymentVo.movie_name}</h2>
					<p>일시 : ${sghPaymentVo.start_date} ${sghPaymentVo.start_time} ~ ${sghPaymentVo.end_time}</p>
					<p>영화관 : ${sghPaymentVo.theater_name}</p>
					<p>인원 : ${sghChoiceSeatDto.personnel}명</p>
					<p>금액 : ${sghPaymentVo.movie_price}원</p>
					<p>좌석번호 :
						<strong style="color: red;">
						<c:forEach items="${sghChoiceSeatDto.schedule_text_arr}" var="schedule_text">
							${schedule_text} 
						</c:forEach>
						</strong>
					</p>
					<p>
						<input type="text" id="user_point" class="form-inline" style="float:left;" placeholder="잔액 조회" readonly>
						<button type="button" id="btnPointSearch" class="btn-sm" style="background-color: black; color: white;">조회</button>
					<p>
					<p>
						<input type="number" id="pointUse" class="form-inline" style="float:left;" placeholder="사용할 포인트" step="100">
						<button type="button" id="btnPointUse" class="btn-sm" style="background-color: black; color: white;">사용하기</button>
					<p>
				</div>
			</div>
			<div class="col-lg-4 col-12">
				<div class="order-details">
					<!-- Order Widget -->
					<div class="single-widget">
						<h2>결제 내용</h2>
						<div class="content">
							<ul>
								<li>결제 금액<span>${sghPaymentVo.movie_price}원</span></li>
								<li>(+) 인원<span>${sghChoiceSeatDto.personnel}명</span></li>
								<li>(-) 포인트<span id="point_use" style="color:blue;">0</span>p</li>
								<li class="last">Total<span id="total">${sghPaymentVo.movie_price * sghChoiceSeatDto.personnel}원</span></li>
							</ul>
						</div>
					</div>
					<div class="single-widget get-button">
						<div class="content">
							<div class="button">
								<button id="btnPayment" class="btn">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/ End Checkout -->
<%@ include file="../../../include/footer.jsp" %>		
	
</body>
</html>