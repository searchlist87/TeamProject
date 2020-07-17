<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<body>
${movieDto.movie_main_image}
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-top:50px;margin-bottom:50px;">
			<div class="carousel slide" id="carousel-346228">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-346228">
					</li>
					<li data-slide-to="1" data-target="#carousel-346228">
					</li>
					<li data-slide-to="2" data-target="#carousel-346228" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="/resources/images/gsh/peninsula3.jpg" style="height:300px; width:100%;"/>
						<div class="carousel-caption">
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="/resources/images/gsh/peninsula2.jpg" style="height:300px; width:100%;"/>
						<div class="carousel-caption">
						</div>
					</div>
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="/resources/images/gsh/peninsula1.jpg" style="height:300px; width:100%;"/>
						<div class="carousel-caption">
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-346228" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-346228" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="colo-md-4">
					<div style="padding:15px;float:left;">
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
		
		<!-- 영화 줄거리 시작 -->
<!-- 			<div class="movie-summary" id="movieInfo"> -->
<!--             	<div class="summary" style="margin-top:10px; margin-bottom:10px;text-align:center;"><strong>영화 내용</strong></div> -->
<!--             	<div class="text" style=text-align:center;>영화 내용</div> -->
<!--     		</div> -->
    	<!-- 영화 줄거리 끝 -->
		

	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
