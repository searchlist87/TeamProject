<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				
				<hr>
				
					<div class="row">
		<div class="col-md-12">
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
	</div>
	
	<hr>
	
						<!-- 영화 정보 시작 -->
							<div class="detail_top_wrap">
						<div class="poster_info">
							<img src="/resources/images/gsh/peninsula.jpg" style="width:150px;height:auto;" alt="영화이름">
						</div>
						<div class="tit_info">
							<span class="ic_grade gr_15">15세이상관람가</span>
								<strong>영화이름</strong>
						</div>
							<ul class="detail_info1">
								<li class="sub_info1" style="cursor: pointer;">
									<em>평점</em><strong><em>점수</em></strong>
										
								</li>
							</ul>
							<ul class="detail_info2">
								<li class="sub_info1"><em>장르</em><strong><em>액션, 드라마</em>
									<em>개봉날짜</em><em class="time_info">115분</em></strong>
								</li>
								<li class="sub_info2">
									<em>감독</em><strong class="line_type"><a href="#">감독이름</a></strong>
								</li>
								<li class="sub_info3">
									<em>출연</em><strong class="line_type"><a href="#">영화배우1</a>, <a href="#">영화배우2</a>, 
									<a href="#">영화배우3</a>, <a href="#">영화배우4</a>, <a href="#">영화배우5</a></strong>
								</li>
							</ul>
						<div class="movie_detail_aside_menu">
							<ul>
								<li class="area_reserve"><a href="#" class="btn_col1 ty7 rnd">
								예매하기->해당영화 구매페이지 이동</a>
								</li>
							</ul>
						</div>
					</div>
				<!-- 영화 정보 끝 -->
				
				
				
<%-- #{나이등급} --%>
<%-- #{영화이름} --%>
<%-- #{영화점수} --%>
<%-- #{장르} --%>
<%-- #{개봉일} --%>
<%-- #{상영시간} --%>
<%-- #{영화감독} --%>
<%-- #{출연배우} --%>
				
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
