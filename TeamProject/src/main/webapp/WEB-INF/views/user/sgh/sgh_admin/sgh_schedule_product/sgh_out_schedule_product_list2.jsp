<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<style>
	td {
		text-align: center;
	}
	th {
		text-align: center;
	}
</style>
<script>
</script>

<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!--  페이지별 내용 -->
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화상품관리_영화상품조회</h4>
						</div>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="container-fluid">
										<div class="row" style="margin-top: 20px;">
											<div class="col-md-12">
												<table class="table">
													<thead>
														<tr>
															<th>상영작</th>
															<th>영화관</th>
															<th>상영관</th>
															<th>시간대</th>
															<th>총좌석</th>
															<th>예약상황</th>
															<th>확인</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${movie_product_vo}" var="movie_product_vo">
														<tr>
															<td>${movie_product_vo.movie_name}</td>
															<td>${movie_product_vo.theater_name}</td>
															<td>${movie_product_vo.screen_name}</td>
															<td>${movie_product_vo.movie_start_time} ~ <br/>${movie_product_vo.movie_end_time}</td>
															<td>${movie_product_vo.screen_total_seat}</td>
															<td>${movie_product_vo.seat_check_cnt}</td>
															<td><a href="/sgh/admin/scheduleProduct/scheduleProductInfo?movie_time_code=${movie_product_vo.movie_time_code}" class="btn-primary" style="color: white;">확인</a></td>
														</tr>
													</c:forEach>
													</tbody>
												</table>
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
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>