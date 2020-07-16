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
	$("#movie_manage > dd").css("display","block");
	$("#movie_manage > dt").css("color","red");
	$("#movie_manage > dd").eq(1).css("color","blue");
	
});

</script>
<body class="js">
${jmhMovieVo}
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
									<h4 class="title" >영화관리_영화상세페이지</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_movie_register" method="post" id="registForm">
									<div class="form-group">
										<label for="movie_name"><strong>영화이름</strong></label>
										<input type=text class="form-control" id="movie_name" name="movie_name" required/>
									</div>
									<div class="form-group">
										<label for="movie_genre"><strong>영화장르</strong></label>
										<input type="text" class="form-control" id="movie_genre" name="movie_genre"  placeholder="로맨스 / 호러 / 스릴러 / 등" required/>
									</div>
									<div class="form-group">
										<label for="movie_director"><strong>영화감독</strong></label> 
										<input type="text" class="form-control" id="movie_director" name="movie_director" required/>
									</div>
									<div class="form-group">
										<label for="movie_actor"><strong>등장인물</strong></label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" required/>
									</div>
									<div class="form-group">
										<label for="movie_grade"><strong>영화등급 :</strong></label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade" checked/><span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"/><span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"/><span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"/><span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date"><strong>개봉일</strong></label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date" placeholder="ex)2020-07-07" required/>
									</div>
									<div class="form-group">
										<label for="movie_total_time"><strong>총시간</strong></label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" placeholder="ex)180분->180" required/>
									</div>
									<div class="form-group">
										<label for="movie_content"><strong>영화정보</strong></label>
										<textarea rows="5" id="movie_content" name="movie_content"></textarea>
									</div>
									<div> 
										<span style="color:blue;">* 이미지& 동영상 파일 크기는 10MB 미만만 가능합니다.</span>
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;"><strong>영화 메인이미지 : </strong></label>
										<input type="file" class="movie_main_image" id="movie_main_image" onchange="loadImage(this);" accept="image/*" required style="display:none;"/>
										<label for="movie_main_image" class="fileLabel" >파일 선택</label>
										<span id="movie_main_image_text">선택된 파일 없음</span>
										<div id="main_image_div" style="width:300px;height:auto;"></div>
									</div>
									<div class="form-group"> 
										<label for="movie_sub_image" style="margin-right:10px;"><strong>영화 상세사진 : </strong></label>
										<input type="file" class="movie_sub_image" id="movie_sub_image" multiple onchange="loadSubImage(this);" style="display:none;" accept="image/*" required/>
										<label for="movie_sub_image" class="fileLabel" >파일 선택</label>
										<span id="movie_sub_image_text">선택된 파일 없음</span>
										<div id="movie_sub_image_div" style="width:300px;height:auto;"></div>
									</div>
									<br/>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;"><strong>영화 예고편 : </strong></label>
										<input type="file" class="movie_preview" id="movie_preview" accept="video/*" onchange="previewUpload(this);" required style="display:none;"/>
										<label for="movie_preview" class="fileLabel" >파일 선택</label>
										<span id="movie_preview_span">선택된 파일 없음</span>
										<div id="movie_preview_text" style="width:250px;height:auto;"></div>
									</div>
									<button type="submit" class="btn btn-primary" id="btnSubmit">등록</button>
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