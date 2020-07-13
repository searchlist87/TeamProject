<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
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
</style>
<script>
$(function () {
	$("#movie_manage > dd").css("display","block");
	$("#movie_manage > dt").css("color","red");
	$("#movie_manage > dd").eq(1).css("color","blue");
	
	
	
});

// 파일 데이터 미리보기 - 1개
function loadImage(value) {
	if(value.files && value.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#main_image_div").attr("src", e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}

//파일 데이터 미리보기 - 여러개
function loadSubImage(value) {
	$("#movie_sub_image_div > img").remove();
	var files = value.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) { 
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" />";
			$("#movie_sub_image_div").append(img_html);
		}
		reader.readAsDataURL(f);
		
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
									<h4 class="title" >영화관리_영화등록</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_movie_register" method="post">
									<div class="form-group">
										<label for="movie_name">영화이름</label>
										<input type=text class="form-control" id="movie_name" name="movie_name"  />
									</div>
									<div class="form-group">
										<label for="movie_genre">영화장르</label>
										<input type="text" class="form-control" id="movie_genre" name="movie_genre"  placeholder="로맨스 / 호러 / 스릴러 / 등"/>
									</div>
									<div class="form-group">
										<label for="movie_director">영화감독</label>
										<input type="text" class="form-control" id="movie_director" name="movie_director" />
									</div>
									<div class="form-group">
										<label for="movie_actor">등장인물</label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" />
									</div>
									<div class="form-group">
										<label for="movie_grade">영화등급 :</label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade" checked/><span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"/><span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"/><span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"/><span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date">개봉일</label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date" placeholder="ex)2020-07-07"/>
									</div>
									<div class="form-group">
										<label for="movie_total_time">총시간</label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" placeholder="ex)180분->180"/>
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;">영화 메인이미지 : </label>
										<input type="file" class="movie_main_image" id="movie_main_image" onchange="loadImage(this);"/>
										<div>
											<img src="" id="main_image_div"/>
										</div>
									</div>
									<div class="form-group">
										<label for="movie_sub_image" style="margin-right:10px;">영화 상세사진 : </label>
										<input type="file" class="movie_sub_image" id="movie_sub_image" multiple onchange="loadSubImage(this);"/>
										<div id="movie_sub_image_div">
										</div>
									</div>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;">영화 예고편 : </label>
										<input type="file" class="movie_preview" id="movie_preview" />
									</div>
									<button type="submit" class="btn btn-primary">등록</button>
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