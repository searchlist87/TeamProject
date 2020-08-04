<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>

<script>
<!-- 주소 창에서 주소 받을때 지정하기 -->
function jusoCallBack(roadFullAddr){
	$("#theater_address").val(roadFullAddr);
}

$(function() {
	$("#theater_manage > dd").css("display","block");
	$("#theater_manage > dt").css("color","red");
	$("#theater_manage > dd").eq(1).css("color","blue");
	
	// 실패했을 경우
	var result = "${result}";
	if(result == "false") {
		alert("등록에 실패하셨습니다 다시 확인해주세요.");
	}
	
	// 영화관 이름
	$("#area_name").blur(function() {
		$(".name_clone").remove();
		var theater_name = $(this).val();
		var name_rgx = /^[가-힣a-zA-Z0-9]{1,50}$/;
		if(!name_rgx.test(theater_name)) {
			var span_clone = $("#message_span").clone();
			span_clone.attr("class", "name_clone");
			span_clone.text("필수 정보 입니다. 1~50자 한글과 영어, 숫자만 허용됩니다.");
			$(this).after(span_clone);
			return false;
		}
		$("#area_name_result").val("true");
	});
	
	// 전송 할 때
	$("#frm_area").submit(function() {
		var area_name = $("#area_name_result").val();
		if(area_name != "true" || area_name == null) {
			alert("비어있는 정보가 있습니다. 다시 확인해주세요.");
			return false;
		}
	});
});
</script>

<!-- 해더 부분 -->
<!-- admin_category -->
<div style="visibility: hidden;">
	<span id="message_span" style="color: red;"></span>
</div>
<!-- 등록을 할 때 결과를 체크할 hidden type들 -->
<input type="hidden" id="area_name_result">
<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 관리_지역 등록</h4>
						</div>
						<!--  페이지별 내용 -->
						<form id="frm_area" role="form" action="/sgh/admin/areaAddRun" method="get">
							<div class="form-group">
								<label for="movie_genre"><strong>지역 이름</strong></label>
								<input type="text" class="form-control" id="area_name" name="area_name" placeholder="지역 이름"/>
							</div>
							<button type="submit" class="btn">등록</button>
							<a href="/sgh/admin/areaListForm" class="btn" style="color: white;">취소</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>