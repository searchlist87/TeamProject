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
	$("#event_manage > dd").eq(0).css("color","blue");
	
});

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
									<h4 class="title" >이벤트조회_이벤트상세페이지</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_movie_register" method="post" id="registForm">
									<div class="form-group">
										<label for="event_title"><strong>이벤트 주제</strong></label>
										<input type=text class="form-control" id="event_title" name="event_title" readonly/>
									</div>
									<div class="form-group">
										<label for="event_content"><strong>이벤트 내용</strong></label>
										<textarea rows="5" id="event_content" name="event_content" readonly></textarea>
									</div>
									<div class="form-group">
										<label for="event_start_date"><strong>이벤트 시작일</strong></label>
										<input type="text" class="form-control" id="event_start_date" name="event_start_date" placeholder="ex)2020-07-07" readonly/>
									</div>
									<div class="form-group">
										<label for="event_end_time"><strong>이벤트 종료일</strong></label>
										<input type="text" class="form-control" id="event_end_time" name="event_end_times" placeholder="ex)2020-07-07" readonly/>
									</div>
									
									<div> 
										<span style="color:blue;">* 이미지& 동영상 파일 크기는 10MB 미만만 가능합니다.</span>
										<span style="color:red;">( 파일명에 '#', [], {}, 등 특수문자는 제외시켜주세요.)</span>
									</div>
									<div class="form-group">
										<label for="event_thumb_image" style="margin-right:10px;"><strong>이벤트 메인이미지 : </strong></label>
										<input type="file" class="event_thumb_image" id="event_thumb_image" onchange="loadImage(this);" accept="image/*"  readonly style="display:none;"/>
										<label for="event_thumb_image" class="fileLabel" >파일 선택</label>
										<span id="event_thumb_image_text">선택된 파일 없음</span>
										<div id="event_thumb_image" style="width:300px;height:auto;"></div>
									</div>
									<div class="form-group"> 
										<label for="event_content_image" style="margin-right:10px;"><strong>이벤트 상세이미지 : </strong></label>
										<input type="file" class="event_content_image" id="event_content_image" multiple onchange="loadSubImage(this);" readonly style="display:none;" accept="image/*" required/>
										<label for="event_content_image" class="fileLabel" >파일 선택</label>
										<span id="event_content_image_text">선택된 파일 없음</span>
										<div id="event_content_image_div" style="width:300px;height:auto;"></div>
									</div>
									<br/>
									<button type="submit" class="btn btn-primary" >수정</button>
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