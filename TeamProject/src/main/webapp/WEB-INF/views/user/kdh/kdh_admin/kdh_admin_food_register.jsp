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
	.food_grade {
		margin-left:20px;
	}
	
	.food_grade_span {
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
$(function () {
	$("#food_manage > dd").css("display","block");
	$("#food_manage > dt").css("color","red");
	$("#food_manage > dd").eq(1).css("color","blue");
	
	$("#registForm").submit(function (e) {
		// 메인 파일 담기
		var upDiv1 = $("#food_image_div > div");
		console.log("upDiv1:" + upDiv1);
		upDiv1.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='food_image' value='"+filename+"'/>";
			$("#registForm").prepend(hiddenInput);
		});
		
	});
});
// 파일 데이터 미리보기 - 1개
function loadImage(value) {
// 	$("#food_image").prop("disabled","true");
 	// 파일 추가하기
 	console.log("실행됨");
	var file = value.files[0];
	var formData = new FormData(); // <form> 작성
	formData.append("file", file); // <input type="file"> : 파일 선택
	var url = "/kdh/upload/uploadAjax";
	$.ajax({
		"processData" : false,  // text 파일
		"contentType" : false,	// text 파일
		"type" : "post",
		"url" : url,
		"data" : formData,
		"success" : function(rData) {
			var slashIndex = rData.lastIndexOf("/");
			var front = rData.substring(0, slashIndex + 1);
			var rear = rData.substring(slashIndex + 1);
			var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
			var thumbnailName = front + "sm_" + rear;
			var html = "<div data-fileName='" + rData + "'>";
			html += "<img src='/kdh/upload/displayFile?fileName=" + thumbnailName + "'/>";
			html += "<a href='"+rData+"' class='attach-del'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
			html += "</div>";
			
			$("#food_image_div").append(html);
			$("#food_image_text").text(originalFilename);
		}
	});
	
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del", function(e) {
		e.preventDefault();
		$("#food_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/kdh/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
				$("#food_image").removeAttr("disabled");
			}
		});
	});
}
	



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
									<h4 class="title" >상품관리_상품등록(스토어)</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/kdh/admin/admin_food_register" method="post" id="registForm">
								
									<div class="form-group">
										<label for="food_name"><strong>상품명</strong></label>
										<input type=text class="form-control" id="food_name" name="food_name" value="${foodVo.food_name}" required/>
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
										<input type="text" class="form-control" id="food_price" name="food_price" value="${foodVo.food_price}" required/>
									</div>
									<div class="form-group">
										<label for="food_count"><strong>상품수량</strong></label>
										<input type="text" class="form-control" id="food_count" name="food_count" value="${foodVo.food_count}" required/>
									</div>
									
									<br/>
									<div> 
										<span style="color:blue;">* 이미지 파일 크기는 10MB 미만만 가능합니다.</span>
										<span style="color:red;">( 파일명에 '#', [], {}, 등 특수문자는 제외시켜주세요.)</span>
									</div>
									<div class="form-group">
										<label for="food_image" style="margin-right:10px;"><strong>음식 메인이미지 : </strong></label>
										<input type="file" class="food_image" id="food_image" onchange="loadImage(this);" accept="image/*" required style="display:none;"/>
										<label for="food_image" class="fileLabel" >파일 선택</label>
										<span id="food_image_text">선택된 파일 없음</span>
										<div id="food_image_div" style="width:300px;height:auto;"></div>
									</div>
									<br/>
									
									<button type="submit" class="btn btn-primary" id="btnSubmit">등록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="..//../../include/footer.jsp" %>
</body>
</html>