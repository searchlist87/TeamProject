<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<!--  admin.js -->
	<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.food_num {
		margin-left:20px;
	}
	
	.food_num_span {
		margin-left:10px;
	}
	
	.fileLabel {
		width:80px;
		height:30px;
		border:1px solid #767676;
		border-top-right-radius:3px;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
		border-bottom-right-radius:3px;
		text-align:center;
		background-color:#efefef;
		padding-top:2px;
	}

</style>
<script>
$(function() {
	$("#food_product_manage > dd").css("display","block");
	$("#food_product_manage > dt").css("color","red");
	$("#food_product_manage > dd").eq(0).css("color","blue");
});
</script>
<body class="js">
<!-- 해더 부분 -->
<%@include file="../../../include/admin_header.jsp" %>
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;margin-bottom:20px;">
									<h4 class="title" >상품관리_상품상세페이지(스토어)</h4>
								</div>	
								<!--  페이지별 내용 -->
								
								<form role="form" action="/kdh/admin/admin_food_modify" method="post" id="modifyForm">
									<div class="form-group">
										<input type="hidden" name="food_num" value="${foodVo.food_num}" id="food_num"/>
										<input type="hidden" name="food_image" value="${foodVo.food_image}" id="food_image"/>
										<label for="food_main_image" style="margin-right:10px;"><strong>상품 메인이미지 : 　</strong></label>
										<div id="main_image_div" style="width:150px;height:auto;">
											<img src="/kdh/upload/displayFile?fileName=${foodVo.food_image}"/>
										</div>
									</div>
									<div class="form-group">
										<label for="food_name"><strong>상품명</strong></label>
										<input type=text class="form-control" id="food_name" name="food_name" value="${foodVo.food_name}"/>
									</div>
									<div class="form-group">
										<label for="food_code"><strong>상품카테고리 :　</strong></label>
										
										<input type="radio" name="food_code" value="100" class="food_code" 
										<c:if test="${foodVo.food_code == '100'}">
										checked
										</c:if>
										/>
										<span class="food_code_span"> 스낵　</span>
										
										<input type="radio" name="food_code" value="200" class="food_code"
										<c:if test="${foodVo.food_code == '200'}">
										checked
										</c:if>
										/><span class="food_code_span"> 음료　</span>
										
										<input type="radio" name="food_code" value="300" class="food_code"
										<c:if test="${foodVo.food_code == '300'}">
										checked
										</c:if>
										/><span class="food_code_span"> 패키지　</span>
										
									</div>
									<div class="form-group">
										<label for="food_price"><strong>상품금액</strong></label> 
										<input type="text" class="form-control" id="food_price" name="food_price" value="${foodVo.food_price}"/>
									</div>
									<div class="form-group">
										<label for="food_count"><strong>상품수량</strong></label>
										<input type="text" class="form-control" id="food_count" name="food_count" value="${foodVo.food_count}"/>
									</div>
									
									<br/>
<%-- 										<a href = "/kdh/admin/admin_food_modify?food_num=${foodVo.food_num}" role="button" class="btn" id="btnOk">등록</a> --%>
										<button type="submit" class="btn" id="btnOk">등록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="../../../include/footer.jsp" %>
</body>
</html>