<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/admin_header.jsp" %>

<script>
<!-- 주소 창에서 주소 받을때 지정하기 -->
function jusoCallBack(roadFullAddr){
	$("#theater_address").val(roadFullAddr);
}

$(function() {
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	var result = "${result}";
	if(result == "false") {
		alert("등록에 실패하셨습니다 다시 확인해주세요.");
	}
	
	$("#addressSearch").click(function() {
		var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	});
});
</script>
<!-- 해더 부분 -->
<!-- admin_category -->
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 등록</h4>
						</div>
						<!--  페이지별 내용 -->
						<form role="form" action="/sgh/admin/movieTheaterModifyRun" method="get">
							<input type="hidden" name="theater_code" value="${sghTheaterVo.theater_code}">
							<div class="form-group">
								<label for="movie_name"><strong>영화관 지역</strong></label>
								<select class="form-control" name="area_code">
									<c:forEach items="${areaList}" var="sghAreaVo">
										<option value="${sghAreaVo.area_code}"
										<c:if test="${sghTheaterVo.area_code == sghAreaVo.area_code}">
											selected
										</c:if>
										>${sghAreaVo.area_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="movie_genre"><strong>영화관 이름</strong></label>
								<input type="text" class="form-control" id="theater_name" name="theater_name" placeholder="영화관 이름" value="${sghTheaterVo.theater_name}" required />
							</div>
							<div class="form-group">
								<label for="movie_director"><strong>영화관 주소</strong></label>
								<input type="text" class="form-control" id="theater_address" name="theater_address" value="${sghTheaterVo.theater_address}" readonly />
								<button type="button" class="btn" id="addressSearch">주소 검색</button>
							</div>
							<button type="submit" class="btn" id="btnSubmit">등록</button>
							<a href="/sgh/admin/adminMainForm" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../include/footer.jsp" %>