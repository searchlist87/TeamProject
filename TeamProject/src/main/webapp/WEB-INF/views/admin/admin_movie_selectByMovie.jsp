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
${jmhMovieImageVo}
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
										<label for="movie_name"><strong>영화제목</strong></label>
										<input type=text class="form-control" id="movie_name" name="movie_name" readonly value="${jmhMovieVo.movie_name}"/>
									</div>
									<div class="form-group">
										<label for="movie_genre"><strong>영화장르</strong></label>
										<input type="text" class="form-control" id="movie_genre" name="movie_genre"  value="${jmhMovieVo.movie_genre}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_director"><strong>영화감독</strong></label> 
										<input type="text" class="form-control" id="movie_director" name="movie_director" value="${jmhMovieVo.movie_director}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_actor"><strong>등장인물</strong></label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" value="${jmhMovieVo.movie_actor}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_grade"><strong>영화등급 :</strong></label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade" 
										<c:if test="${jmhMovieVo.movie_grade == 'all'}">
										checked
										</c:if>
										/>
										<span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"
										<c:if test="${jmhMovieVo.movie_grade == '12'}">
										checked
										</c:if>
										/><span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"
										<c:if test="${jmhMovieVo.movie_grade == '15'}">
										checked
										</c:if>
										/><span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"
										<c:if test="${jmhMovieVo.movie_grade == '19'}">
										checked
										</c:if>
										/><span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date"><strong>개봉일</strong></label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date"  value="${jmhMovieVo.movie_open_date}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_total_time"><strong>총시간(분)</strong></label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" value="${jmhMovieVo.movie_total_time}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_content"><strong>영화정보</strong></label>
										<textarea rows="5" id="movie_content" name="movie_content" readonly>${jmhMovieVo.movie_content}</textarea>
									</div>
									<div> 
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;"><strong>영화 메인이미지 : </strong></label>
										<div id="main_image_div" style="width:150px;height:auto;">
											<img src="/upload/displayFile?fileName=${jmhMovieVo.movie_main_image}"/>
										</div>
									</div>
									<div class="form-group"> 
										<label for="movie_sub_image" style="margin-right:10px;"><strong>영화 상세사진 : </strong></label>
										<div id="movie_sub_image_div" style="width:300px;height:auto;">
										<c:forEach items="${jmhMovieImageVo}" var="imageVo">
											<img src="/upload/displayFile?fileName=${imageVo.movie_sub_image}"/>
										</c:forEach>
										</div>
									</div>
									<br/>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;"><strong>영화 예고편 : </strong></label>
										<div id="movie_preview_text" style="width:auto;height:auto;">
											<video src="/upload/displayFile?fileName=${jmhMovieVo.movie_preview}" controls></video>
										</div>
									</div>
									<a href="/admin/admin_movie_modify" role="button" class="btn">수정</a>
									<a href="/admin/admin_movie_list" role="button" class="btn">목록</a>
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