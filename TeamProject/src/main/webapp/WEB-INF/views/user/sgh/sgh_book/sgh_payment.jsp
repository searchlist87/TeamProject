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
	
	$("#btnPayment").click(function() {
		$("#frmPayment").submit();
	});
});
</script>
</head>
<form id="frmPayment" action="/sgh/choiceSeat/paymentRun" method="post">
	<c:forEach items="${sghChoiceSeatDto.schedule_code_arr}" var="schedule_code">
	<input type="hidden" name="schedule_code_arr" value="${schedule_code}">
	</c:forEach>
</form>
<body class="js">
		<!-- Breadcrumbs -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<ul class="bread-list">
								<li><a href="index1.html">좌석선택<i class="ti-arrow-right"></i></a></li>
								<li class="active"><a href="blog-single.html">결제하기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
				
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
										<li class="last">Total<span>${sghPaymentVo.movie_price * sghChoiceSeatDto.personnel}원</span></li>
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