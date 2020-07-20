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

		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<!-- 영화 스틸컷 시작 -->
			
			<div class="slide_wrap slide_movie_detail_trailer">
				<div class="owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="margin-bottom:50px;">
							<div class="owl-item active"
								style="width: 320px; margin-right: 20px;">
								<div class="item" id="movie_image">
								<!-- tbl_movie_image  -->
								<!-- movie_sub_image -->
									<em><img src="/upload/displayFile?fileName=${movieDto.movie_sub_image}" alt="반도"></em>
									<strong>스틸컷</strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 영화 스틸컷 끝 -->
			
			<!-- 영화 내용 시작 -->
				<div class="movieContent " style="margin-bottom:20px;">
					<h2>시놉시스</h2><br>
					
						<div>
							<span>${movieDto.movie_content}</span>
						</div>
				</div>
			<!-- 영화 내용 끝 -->
			


		<!-- 영화 예고편 시작 -->
				
			<div style="margin-top:50px;margin-bottom:50px;">
				<h2>예고편</h2>
				<video src="/upload/displayFile?fileName=${movieDto.movie_preview}" controls style="width:1260px; height:auto;"></video>
			</div>
			
		<!-- 영화 예고편 끝 -->	
		
			<!-- 한줄 감상평 시작 -->
			
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<h3>한줄 감상평</h3><br>
					
					<table class="table">
						<thead>
							<tr>
								<th>리뷰 번호</th>
								<th>아이디</th>
								<th>평점</th>
								<th>리뷰 내용</th>
								<th>리뷰 작성일</th>
							</tr>
						</thead>
						
						
						<tbody>
							<tr>
								<td>1</td>
								<td>Default</td>
								<td>
									<select>
										<option value="1"></option>
										<option value="2"></option>
										<option value="3"></option>
										<option value="4"></option>
										<option value="5"></option>
									</select>
								</td>
								<td>
									<input type="text" class="form-control" maxlength="200" placeholder="감상평을 적어주세요." required/>
								</td>
								<td>Default</td>
							</tr>
						</tbody>
						
					</table>
					</div>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</div>
				
			<!-- 한줄 감상평 끝 -->
			
		<div class="col-md-2"></div>
		
		<!-- 영화 줄거리 시작 -->
<!-- 			<div class="movie-summary" id="movieInfo"> -->
<!--             	<div class="summary" style="margin-top:10px; margin-bottom:10px;text-align:center;"><strong>영화 내용</strong></div> -->
<!--             	<div class="text" style=text-align:center;>영화내용</div> -->
<!--     		</div> -->
    	<!-- 영화 줄거리 끝 -->
		

	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
