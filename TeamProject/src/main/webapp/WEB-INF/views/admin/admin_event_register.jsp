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
	.movie_grade {
		margin-left:20px;
	}
	
	.movie_grade_span {
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
	$("#event_manage > dd").css("display","block");
	$("#event_manage > dt").css("color","red");
	$("#event_manage > dd").eq(1).css("color","blue");
	
	$("#btnSubmit").click(function () {
		
		// 이벤트 주제 확인
		var event_title = $("#event_title").val();
		if(event_title == "" || event_title == null) {
			$("#event_title").parent().find("span").remove();
			html = "<span style='color:red;'>이벤트 주제를 확인해주세요.</span>";
			$("#event_title").parent().append(html);
			return false;
		}
		$("#event_title").parent().find("span").remove();
		
		// 이벤트 내용 확인
		var event_title = $("#event_content").val();
		if(event_title == "" || event_title == null) {
			$("#event_content").parent().find("span").remove();
			html = "<span style='color:red;'>이벤트 내용을 확인해주세요.</span>";
			$("#event_content").parent().append(html);
			return false;
		}
		$("#event_content").parent().find("span").remove();
		
		
		// 시작일 형식 확인(2020-07-07)
		var event_start_date = $("#event_start_date").val();
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		if(!date_pattern.test(event_start_date)) {
			$("#event_start_date").parent().find("span").remove();
			html = "<span style='color:red;'>이벤트 시작일 형식을 확인해주세요.</span>";
			$("#event_start_date").parent().append(html);
			return false;
		}
		$("#event_start_date").parent().find("span").remove();
		
		// 종료일 형식 확인(2020-07-07)
		var event_end_date = $("#event_end_date").val();
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		if(!date_pattern.test(event_end_date)) {
			$("#event_end_date").parent().find("span").remove();
			html = "<span style='color:red;'>이벤트 종료일 형식을 확인해주세요.</span>";
			$("#event_end_date").parent().append(html);
			return false;
		}
		$("#event_end_date").parent().find("span").remove();
		
		
		// 메인이미지 없을 경우 처리
		var event_main_image = $("#event_thumb_image_text").text();
		if (event_main_image == "" || event_main_image == null) {
			html = "<span style='color:red;'>이벤트 메인이미지를 확인해주세요.</span>";
			$("#event_thumb_image_div").append(html);
			return false;
		}
		
		
		// 상세이미지 없을 경우 처리
		var event_content_image = $("#event_content_image_text").text();
		if (event_content_image == "" || event_content_image == null) {
			html = "<span style='color:red;'>이벤트 상세이미지를 확인해주세요.</span>";
			$("#event_content_image_div").append(html);
			return false;
		}
		
		// 메인 이미지 담기
		var upDiv1 = $("#event_thumb_image_div > div");
		upDiv1.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='event_thumb_image' value='"+filename+"'/>";
			$("#registForm").prepend(hiddenInput);
		});
		
		// 서브 이미지 담기
		var upDiv2 = $("#event_content_image_div > div");
		upDiv2.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='event_content_image' value='"+filename+"'/>";
			$("#registForm").prepend(hiddenInput);
		});
		$("#registForm").submit();
	});	
	
});

// 메인이미지 추가/삭제
function loadImage(value) {
	$("#event_thumb_image_div > span").remove();
	$("#event_thumb_image").prop("disabled","true");
 	// 파일 추가하기
	var file = value.files[0];
	var formData = new FormData(); // <form> 작성
	formData.append("file", file); // <input type="file"> : 파일 선택
	var url = "/upload/uploadAjax";
	$.ajax({
		"processData" : false,  // text 파일
		"contentType" : false,	// text 파일
		"type" : "post",
		"url" : url,
		"data" : formData,
		"success" : function(rData) {
			console.log(rData);
			var slashIndex = rData.lastIndexOf("/");
			var front = rData.substring(0, slashIndex + 1);
			var rear = rData.substring(slashIndex + 1);
			var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
			var thumbnailName = front + "sm_" + rear;
			var html = "<div data-fileName='" + rData + "'>";
			html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/>";
			html += "<a href='"+rData+"' class='attach-del'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
			html += "</div>";
			
			$("#event_thumb_image_div").append(html);
			$("#event_thumb_image_text").text(originalFilename);
		}
	});
	
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del", function(e) {
		e.preventDefault();
		$("#event_thumb_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
				$("#event_thumb_image").removeAttr("disabled");
			}
		});
	});
}

// 서브이미지 추가/삭제
function loadSubImage(value) {
	$("#event_content_image_div > span").remove();
	$("#event_content_image").prop("disabled","true");
 	// 파일 추가하기
	var file = value.files[0];
	var formData = new FormData(); // <form> 작성
	formData.append("file", file); // <input type="file"> : 파일 선택
	var url = "/upload/uploadAjax";
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
			html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/>";
			html += "<a href='"+rData+"' class='attach-del1'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
			html += "</div>";
			
			$("#event_content_image_div").append(html);
			$("#event_content_image_text").text(originalFilename);
		}
	});
	
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del1", function(e) {
		e.preventDefault();
		$("#event_content_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
				$("#event_content_image").removeAttr("disabled");
			}
		});
	});
}

	
</script>
<body class="js">
<!-- 해더 부분 -->
<%@include file="../include/admin_header.jsp" %>
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
									<h4 class="title" >이벤트관리_이벤트등록</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_event_register" method="post" id="registForm">
									<div class="form-group">
										<label for="event_title"><strong>이벤트 주제</strong></label>
										<input type=text class="form-control" id="event_title" name="event_title"/>
									</div>
									<div class="form-group">
										<label for="event_content"><strong>이벤트 내용</strong></label>
										<textarea rows="5" id="event_content" name="event_content"></textarea>
									</div>
									<div class="form-group">
										<label for="event_start_date"><strong>이벤트 시작일</strong></label>
										<input type="text" class="form-control" id="event_start_date" name="event_start_date" placeholder="ex)2020-07-07"/>
									</div>
									<div class="form-group">
										<label for="event_end_date"><strong>이벤트 종료일</strong></label>
										<input type="text" class="form-control" id="event_end_date" name="event_end_date" placeholder="ex)2020-07-07"/>
									</div>
									
									<div> 
										<span style="color:blue;">* 이미지& 동영상 파일 크기는 10MB 미만만 가능합니다.</span>
										<span style="color:red;">( 파일명에 '#', [], {}, 등 특수문자는 제외시켜주세요.)</span>
									</div>
									<div class="form-group">
										<label for="event_thumb_image" style="margin-right:10px;"><strong>이벤트 메인이미지 : </strong></label>
										<input type="file" class="event_thumb_image" id="event_thumb_image" onchange="loadImage(this);" accept="image/*"  style="display:none;"/>
										<label for="event_thumb_image" class="fileLabel" >파일 선택</label>
										<span id="event_thumb_image_text"></span>
										<div id="event_thumb_image_div" style="width:200px;height:auto;"></div>
									</div>
									<div class="form-group" style="width:500px;"> 
										<label for="event_content_image" style="margin-right:10px;"><strong>이벤트 상세이미지 : </strong></label>
										<input type="file" class="event_content_image" id="event_content_image" multiple onchange="loadSubImage(this);"  style="display:none;" accept="image/*"/>
										<label for="event_content_image" class="fileLabel" >파일 선택</label>
										<span id="event_content_image_text"></span>
										<div id="event_content_image_div" style="width:300px;height:auto;"></div>
									</div>
									<br/>
									<button type="button" class="btn btn-primary" id="btnSubmit">등록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>