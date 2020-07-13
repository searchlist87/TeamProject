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
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;text-align:right;">
										
									<div class="single-shorter" style="vertical-align:middle;">
											<label>Show :</label>
											<select>
												<option selected="selected">09</option>
												<option>15</option>
												<option>25</option>
												<option>30</option>
											</select>
										</div>

									<input type="text"/>
									<button type="button" class="btn">검색</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;">
									<thead>
										<tr style="hegith:200px;">
											<th style="width:70px;">순서</th>
											<th style="width:100px;">영화이미지</th>
											<th>영화명</th>
											<th style="width:100px;">영화장르</th>
											<th style="width:100px;">영화등급</th>
											<th style="width:130px;">개봉일</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;">
										<tr>
											<td style="vertical-align:middle;">3</td>
											<td style="vertical-align:middle;"><img src="/resources/images/gsh/movie01.jpg"/></td>
											<td style="vertical-align:middle;"><a href=""># 살아있다</a></td>
											<td style="vertical-align:middle;">로맨스</td>
											<td style="vertical-align:middle;"><img src="/resources/images/jmh/movie_grade_12.PNG"/></td>
											<td style="vertical-align:middle;">2020-07-07</td>
										</tr>
										<tr>
											<td style="vertical-align:middle;">3</td>
											<td style="vertical-align:middle;"><img src="/resources/images/gsh/movie01.jpg"/></td>
											<td style="vertical-align:middle;"># 살아있다</td>
											<td style="vertical-align:middle;">로맨스</td>
											<td style="vertical-align:middle;"><img src="/resources/images/jmh/movie_grade_12.PNG"/></td>
											<td style="vertical-align:middle;">2020-07-07</td>
										</tr>
										<tr>
											<td style="vertical-align:middle;">3</td>
											<td style="vertical-align:middle;"><img src="/resources/images/gsh/movie01.jpg"/></td>
											<td style="vertical-align:middle;"># 살아있다</td>
											<td style="vertical-align:middle;">로맨스</td>
											<td style="vertical-align:middle;"><img src="/resources/images/jmh/movie_grade_12.PNG"/></td>
											<td style="vertical-align:middle;">2020-07-07</td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>