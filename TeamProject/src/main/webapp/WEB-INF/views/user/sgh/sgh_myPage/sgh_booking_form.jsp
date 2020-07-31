<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style>
.subul {
	padding-left : 30px;
	margin-top : 10px;
	font-size : 15px;
	border : 1px dotted #ccc;
}
tr {
	text-align: center;
}
</style>
<%@include file="/WEB-INF/views/include/bootstrap.jsp" %>
<script src="/resources/js/sgh_js/myScript.js"></script>

<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script>
$(function() {
	$(".buy_date").each(function() {
		var buy_date = timestmap_change($(this).text());
		$(this).text(buy_date);
	});
	$(".start_time").each(function() {
		var start_time = timestmap_change($(this).text());
		$(this).text(start_time);
	});
	$(".end_time").each(function() {
		var end_time = timestmap_change($(this).text());
		$(this).text(end_time);
	});
});
</script>

<body class="js">  
<div class="container" style="left:100px;margin-top:100px;">
		<h2>My page_마이페이지</h2>
</div>
<!-- Start Contact -->
<section id="contact-us" class="contact-us section" style="padding:50px;">
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="/WEB-INF/views/user/jmh/include/mypage_side_menu.jsp"%>
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
								<h4>예매 표 확인</h4>
								<h3>기간이 지나지 않은 예매 표 내역</h3>
							</div>
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>영화</th>
												<th>상영관</th>
												<th>구매일</th>
												<th>시작 시간</th>
												<th>종료 시간</th>
												<th>좌석</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${movieBuyList}" var="SghBuyListVo">
											<tr>
												<td>${SghBuyListVo.movie_name}</td>
												<td>${SghBuyListVo.theater_name} ${SghBuyListVo.screen_name}</td>
												<td class="buy_date">${SghBuyListVo.movie_buy_date}</td>
												<td class="start_time">${SghBuyListVo.movie_start_time}</td>
												<td class="end_time">${SghBuyListVo.movie_end_time}</td>
												<td>${SghBuyListVo.seat_code}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
									<!--페이징-->
									<div class="container-fluid">
										<div class="row">
											<div class="col-md-4">
											</div>
											<div class="col-md-8">
												<nav>
													<ul class="pagination">
								<!--  							이전 -->
														<c:if test="${sghPagingDto.start_page != 1}">
															<li class="page-item"><a class="page-link" href="/sgh/myPage/bookingForm?start_page=${sghPagingDto.start_page - 1}">&laquo;</a></li>
														</c:if>
								<!--  								페이지 넘버링 -->
														<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
														<li class="page-item
																<c:if test="${sghPagingDto.page == v }">
																	active
																</c:if>
																"
															>
																<a class="page-link" href="/sgh/myPage/bookingForm?page=${v}" style="float: left;">${v}</a>
															</li>
														</c:forEach>
								<!--  								다음 -->
														<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
															<li class="page-item"><a class="page-link" href="/sgh/myPage/bookingForm?end_page=${sghPagingDto.end_page + 1}">&raquo;</a></li>
														</c:if>
													</ul>
												</nav>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
<!--/ End Contact -->
<%@ include file="../../../include/footer.jsp"%>
</body>
</html>