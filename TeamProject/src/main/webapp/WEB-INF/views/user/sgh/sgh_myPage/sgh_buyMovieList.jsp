<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style>
	tr {
		text-align: center;
	}
	
	.subul {
		padding-left : 30px;
		margin-top : 10px;
		font-size : 15px;
		border : 1px dotted #ccc;
	}
</style>
<%@include file="/WEB-INF/views/include/bootstrap.jsp" %>
<script src="/resources/js/sgh_js/myScript.js"></script>
<script>
$(function() {
	$(".buy_date").each(function() {
		var date = $(this).text();
		var str_date = timestmap_change(date);
		$(this).text(str_date);
	});
});
</script>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

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
								<h4>My 구매내역</h4>
								<h3>영화 구매 내역</h3>
							</div>
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>구매번호</th>
												<th>영화명</th>
												<th>금액</th>
												<th>구매일시</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${sghMyMovieBuyVo}" var="sghMyMovieBuyVo">
											<tr>
												<td>${sghMyMovieBuyVo.movie_buy_num}</td>
												<td>${sghMyMovieBuyVo.movie_name}</td>
												<td>${sghMyMovieBuyVo.movie_price}원</td>
												<td class="buy_date">${sghMyMovieBuyVo.movie_buy_date}</td>
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
															<li class="page-item"><a class="page-link" href="/sgh/myPage/movieBuyForm?start_page=${sghPagingDto.start_page - 1}">&laquo;</a></li>
														</c:if>
								<!--  								페이지 넘버링 -->
														<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
														<li class="page-item
																<c:if test="${sghPagingDto.page == v }">
																	active
																</c:if>
																"
															>
																<a class="page-link" href="/sgh/myPage/movieBuyForm?page=${v}" style="float: left;">${v}</a>
															</li>
														</c:forEach>
								<!--  								다음 -->
														<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
															<li class="page-item"><a class="page-link" href="/sgh/myPage/movieBuyForm?end_page=${sghPagingDto.end_page + 1}">&raquo;</a></li>
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