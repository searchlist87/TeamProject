<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
<style>
	tr {
		text-align: center;
	}

</style>


<script>
$(function() {
	$("#theater_manage > dd").css("display","block");
	$("#theater_manage > dt").css("color","red");
	$("#theater_manage > dd").eq(0).css("color","blue");
	
	$(".page-link").css("float", "left");
	$(".page-item").css("float", "left");
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove()
	
	$("#btnAreaSearch").click(function() {
		var start_row ="${sghPagingDto.start_row}";
		var end_row ="${sghPagingDto.end_row}";
		var area_code = $("#select_area option:selected").attr("data-area-code");
		
		location.href = "/sgh/admin/movieTheaterList?start_row=" + start_row + "&end_row=" + end_row + "&area_code=" + area_code;
	});
});
</script>

<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 관리_지역 조회</h4>
						</div>
						<div style="margin-top: 10px;">
							<a href="/sgh/admin/areaListForm" class="btn-sm" style="background-color: orange; color: white;">등록된 지역</a>
							<a href="/sgh/admin/deleteAreaListForm" class="btn-sm" style="background-color: black; color: white;">삭제된 지역</a>
						</div>
						<!--  페이지별 내용 -->
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>지역</th>
												<th>수정</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${area_list}" var="SghAreaVo">
											<tr>
												<td>${SghAreaVo.area_name}</td>
												<td><a href="/sgh/admin/areaModfiyForm?area_code=${SghAreaVo.area_code}" class="btn-primary" style="color: white;">수정</a></td>
												<td><a href="/sgh/admin/areaDeleteRun?area_code=${SghAreaVo.area_code}" class="btn-danger" style="color: white;">삭제</a></td>
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
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>