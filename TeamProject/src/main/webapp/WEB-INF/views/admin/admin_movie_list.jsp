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
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.movie_title:hover {
		color:red;
	}
</style>
<script>
$(function () {
	$("#movie_manage > dd").css("display","block");
	$("#movie_manage > dt").css("color","red");
	$("#movie_manage > dd").eq(0).css("color","blue");
	
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
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;">
									<h4 class="title" >영화관리_영화조회</h4>
								</div>	
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">
										
									<div class="single-shorter" style="vertical-align:middle;">
											<label>검색 :</label>
											<select>
												<option selected="selected">영화명</option>
												<option>영화장르</option>
												<option>영화등급</option>
											</select>
										</div>

									<input type="text"/>
									<button type="button" class="btn">검색</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:70px;">순서</th>
											<th style="width:100px;">영화이미지</th>
											<th>영화명</th>
											<th style="width:100px;">영화장르</th>
											<th style="width:100px;">영화등급</th>
											<th style="width:130px;">개봉일</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
									<!--  영화정보 조회 -->
									<c:forEach items="${jmhMovieVo}" var="jmhMovieVo">
										<tr style="height:50px;">
											<td style="height:100px;vertical-align:middle;">${jmhMovieVo.movie_num}</td>
											<td><img src="/upload/displayFile?fileName=${jmhMovieVo.movie_main_image}"/></td>
											<td style="vertical-align:middle;"><a href="/admin/admin_movie_selectByMovie?movie_code=${jmhMovieVo.movie_code}" class="movie_title">${jmhMovieVo.movie_name}</a></td>
											<td style="vertical-align:middle;">${jmhMovieVo.movie_genre}</td>
											<!--  등급 image 처리 -->
											<td style="vertical-align:middle;"><img src="/resources/images/jmh/movie_grade_12.PNG"/></td>
											<td style="vertical-align:middle;">${jmhMovieVo.movie_open_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
<%@ include file="../include/footer.jsp" %>
</html>