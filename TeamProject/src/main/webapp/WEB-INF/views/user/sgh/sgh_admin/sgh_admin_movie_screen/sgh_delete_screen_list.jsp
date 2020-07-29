<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<style>
	strong {
		font-size: 20px;
	}
	th {
		text-align: center;
	}
	td {
		text-align: center;
	}
</style>

<script src="/resources/js/sgh_js/timestmap_change.js"></script>
<script>
$(function() {
	
	$(".del_date").each(function() {
		var del_date = $(this).text();
		var change_date = timestmap_change(del_date);
		$(this).text(change_date);
		console.log("change_date :" + change_date);
	});
	
	// 수정 결과
	var restore_result = "${restore_result}";
	console.log("restore_result :" + restore_result);
	if(restore_result == "false") {
		alert("복구에 실패하셨습니다.");
	}
});
</script>

<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
						<!--  페이지별 내용 -->
				<div class="row" style="margin-top: 20px;">
					<div class="col-md-12">
						<h2>${sghTheaterVo.theater_name}</h2>
						<div><strong>지역 : ${sghTheaterVo.area_name}</strong></div>
						<div><strong>주소 : ${sghTheaterVo.theater_address}</strong></div>
						
						<a id="screen_delete_list" class="btn btn-sm" href="/sgh/admin/movieScreen/screenList?theater_code=${theater_code}" style="color:white; margin-bottom: 30px;">등록된 영화관 목록</a>
						<a class="btn btn-sm" href="/sgh/admin/movieTheaterList" style="color:white; margin-bottom: 30px;">목록으로</a>
						
						<div style="margin-bottom: 10px; text-align: center;"><strong>삭제된 상영관 목록</strong></div>
						
						<table class="table">
							<thead>
								<tr>
									<th>상영관</th>
									<th>총 좌석 수</th>
									<th>좌석 행</th>
									<th>좌석 열</th>
									<th>삭제일</th>
									<th>복구</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${screen_list}" var="SghScreenVo">
								<tr>
									<td>${SghScreenVo.screen_name}</td>
									<td>${SghScreenVo.screen_total_seat}</td>
									<td>${SghScreenVo.screen_seat_row}</td>
									<td>${SghScreenVo.screen_seat_col}</td>
									<td class="del_date">${SghScreenVo.screen_del_date}</td>
									<td><a href="/sgh/admin/movieScreen/screenRestore?screen_code=${SghScreenVo.screen_code}&theater_code=${theater_code}" class="btn-warning" style="color: white;">복구</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--페이징-->
<div class="container-fluid" style="margin-bottom: 30px;">
	<div class="row">
		<div class="col-md-6">
		</div>
		<div class="col-md-6">
			<nav>
				<ul class="pagination">
<!--  							이전 -->
					<c:if test="${sghPagingDto.start_page != 1}">
						<li class="page-item"><a class="page-link" href="/sgh/admin/movieScreen/deleteScreenList?start_page=${sghPagingDto.start_page - 1}&theater_code=${theater_code}">&laquo;</a></li>
					</c:if>
<!--  								페이지 넘버링 -->
					<c:forEach begin="${sghPagingDto.start_page}" end="${sghPagingDto.end_page}" var="v">
					<li class="page-item
							<c:if test="${sghPagingDto.page == v }">
								active
							</c:if>
							"
						>
							<a class="page-link" href="/sgh/admin/movieScreen/deleteScreenList?page=${v}&theater_code=${theater_code}" style="float: left;">${v}</a>
						</li>
					</c:forEach>
<!--  								다음 -->
					<c:if test="${sghPagingDto.end_page < sghPagingDto.total_page}">
						<li class="page-item"><a class="page-link" href="/sgh/admin/movieScreen/deleteScreenList?end_page=${sghPagingDto.end_page + 1}&theater_code=${theater_code}">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</div>
<%@ include file="../../../../include/footer.jsp" %>