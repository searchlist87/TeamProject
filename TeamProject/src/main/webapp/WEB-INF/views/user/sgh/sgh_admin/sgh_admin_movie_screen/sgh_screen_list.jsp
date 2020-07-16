<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<script>
$(function() {
	$("#screen_regist").click(function(e) {
		e.preventDefault();
		
		$("#frm_theater").submit();
	});
});
</script>

<form id="frm_theater" action="/sgh/admin/movieScreen/screenRegist" type="get">
	<input type="hidden" name="theater_name" value="${sghTheaterVo.theater_name}">
	<input type="hidden" name="theater_code" value="${sghTheaterVo.theater_code}">
</form>
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!--  페이지별 내용 -->
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="container-fluid">
										<div class="row" style="margin-top: 20px;">
											<div class="col-md-2"></div>
											<div class="col-md-8">
												<h2>${sghTheaterVo.theater_name}</h2>
												<div><strong>지역 : ${sghTheaterVo.area_name}</strong></div>
												<div><strong>주소 : ${sghTheaterVo.theater_address}</strong></div>
												
												<a id="screen_regist" class="btn" href="/#" style="color:white; margin-bottom: 30px;">상영관 등록</a>
												<a class="btn" href="/sgh/admin/adminMainForm" style="color:white; margin-bottom: 30px;">목록으로</a>
												
												<table class="table">
													<thead>
														<tr>
															<th>상영관</th>
															<th>총 좌석 수</th>
															<th>좌석 행</th>
															<th>좌석 열</th>
															<th>수정</th>
															<th>삭제</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${screen_list}" var="SghScreenVo">
														<tr>
															<td>${SghScreenVo.screen_name}</td>
															<td>${SghScreenVo.screen_total_seat}</td>
															<td>${SghScreenVo.screen_seat_row}</td>
															<td>${SghScreenVo.screen_seat_col}</td>
															<td><a href="/sgh/admin/movieScreen/screenModify?screen_code=${SghScreenVo.screen_code}" class="btn-primary" style="color: white;">수정</a></td>
															<td><a href="/#" class="btn-danger" style="color: white;">삭제</a></td>
														</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="col-md-2"></div>
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