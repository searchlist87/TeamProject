<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-top:50px;margin-bottom:50px;">
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<!-- 영화 배너 이미지 끝 -->
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="colo-md-4">
					<div style="padding:15px;float:left; margin-bottom:50px;">
						<img src="/upload/displayFile?fileName=${movieDto.movie_main_image}" style="height:auto;" alt="영화이름">
					</div>
				</div>
				<div class="colo-md-8">
					<table class="table">
						<tbody>
							<tr>
								<th>관람등급</th>
								<td><img src="/resources/images/jmh/movie_grade_${movieDto.movie_grade}.png"/></td>
							</tr>
							<tr>
								<th>영화이름</th>
								<td>${movieDto.movie_name}</td>
							</tr>
							<tr>
								<th>평점</th>
								<td>
								<c:forEach begin="1" end="${movieDto.review_score}">
									★
								</c:forEach>
								
								</td>
							</tr>
							<tr>
								<th>장르</th>
								<td>${movieDto.movie_genre}</td>
							</tr>
							<tr>
								<th>감독</th>
								<td>${movieDto.movie_director}</td>
							</tr>
							<tr>
								<th>출연</th>
								<td>${movieDto.movie_actor}</td>
							</tr>
							<tr>
								<th colspan="2"><button type="button" class="btn btn-primary">예매하기</button></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		<!-- 영화정보 부분 시작 -->
<!-- 		<div style="padding:15px;" class="col-md-6"> -->
<!-- 						<div class="tit_info"> -->
<!-- 							<span class="ic_grade gr_15">관람등급</span> -->
<!-- 								<strong>영화이름</strong> -->
<!-- 						</div> -->
<!-- 							<ul class="detail_info1"> -->
<!-- 								<li class="sub_info1"> -->
<!-- 									<em>평점</em><strong><em>점수</em></strong> -->
										
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 							<ul class="detail_info2"> -->
<!-- 								<li class="sub_info1"><em>장르</em><strong><em>액션, 드라마</em> -->
<!-- 									<em>개봉날짜</em><em class="time_info">115분</em></strong> -->
<!-- 								</li> -->
<!-- 								<li class="sub_info2"> -->
<!-- 									<em>감독</em><strong class="line_type"><a href="#"><em>감독이름</em></a></strong> -->
<!-- 								</li> -->
<!-- 								<li class="sub_info3"> -->
<!-- 									<em>출연</em><strong class="line_type"><a href="#">영화배우1</a>, <a href="#">영화배우2</a>,  -->
<!-- 									<a href="#">영화배우3</a>, <a href="#">영화배우4</a>, <a href="#">영화배우5</a></strong> -->
<!-- 								</li> -->
<!-- 							</ul> -->
							
<!--  						<div class="movie_detail_aside_menu"> -->
<!--  							<ul> -->
<!-- 								<li class="area_reserve"><a href="#" class="btn_col1 ty7 rnd"> -->
<!--  								예매하기->해당영화 구매페이지 이동</a>  -->
<!--  								</li>  -->
<!--  							</ul>  -->
<!-- 						</div>  -->
						
<!-- 						영화 감상평은 회원제 -->
<!-- <!-- 						<textarea id="txtComment" maxlength="300" style="margin-top:10px;margin-bottom:50px;" placeholder="평점 및 영화 관람평을 작성해주세요."></textarea> -->
<!-- 					</div> -->
<!-- 				영화정보 부분 끝	 -->
					
<!-- 				<div class="col-md-2"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<!-- 영화 예고편 시작 -->
			
			<div class="slide_wrap slide_movie_detail_trailer">
				<div class="owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="margin-bottom:50px;">
<%-- 						<c:forEach items="${list}" var="vo"> --%>
							<div class="owl-item active"
								style="width: 313.333px; margin-right: 20px;">
								<div class="item" id="movie_trailer_0">
									<a href="#"><em><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202007/16010_109_1.jpg" alt="반도"></em>
									<strong>스틸컷</strong>
									</a>
								</div>
							</div>
<%-- 						</c:forEach> --%>
<!-- 							<div class="owl-item active" -->
<!-- 								style="width: 313.333px; margin-right: 20px;"> -->
<!-- 								<div class="item" id="movie_trailer_1"> -->
<!-- 									<a href="#"><em><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202007/16010_109_2.jpg" alt="반도"></em> -->
<!-- 									<strong>스틸컷</strong> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="owl-item active" -->
<!-- 								style="width: 313.333px; margin-right: 20px;"> -->
<!-- 								<div class="item" id="movie_trailer_2"> -->
<!-- 									<a href="#"><em><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202007/16010_109_3.jpg" alt="반도"></em> -->
<!-- 									<strong>스틸컷</strong> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="owl-item active" -->
<!-- 								style="width: 313.333px; margin-right: 20px;"> -->
<!-- 								<div class="item" id="movie_trailer_3"> -->
<!-- 									<a href="#"><em> -->
<!-- 									<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202007/16010_109_4.jpg" alt="반도"></em> -->
<!-- 										<strong>스틸컷</strong>  -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
			
			<!-- 영화 예고편 끝 -->

			<!-- 영화 내용 시작 -->
				<div class="movieContent " style="margin-bottom:20px;">
					<h2>영화내용</h2>
				</div>
				<div>
					<p>영화내용</p>
				</div>
				
			<div style="margin-top:50px;margin-bottom:50px;">
				<h2>예고편</h2>
				<video src="/upload/displayFile?fileName=${movieDto.movie_preview}" controls style="width:1400px; height:auto;"></video>
			</div>
			
			<!-- 영화 내용 끝 -->
		</div>	
		<div class="col-md-2"></div>
	</div>
		
		<!-- 영화 줄거리 시작 -->
<!-- 			<div class="movie-summary" id="movieInfo"> -->
<!--             	<div class="summary" style="margin-top:10px; margin-bottom:10px;text-align:center;"><strong>영화 내용</strong></div> -->
<!--             	<div class="text" style=text-align:center;>영화내용</div> -->
<!--     		</div> -->
    	<!-- 영화 줄거리 끝 -->
		

	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
