<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">
<!--  tag_and_styleSheet include -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/user/jmh/jmh_modal/modal.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
<style>
#theater_count {
	padding-right: 20px;
}
 .divEvent { 
 	float : left; 
 } 
 .content_padding {
 	padding-right: 20px;
 }
 .timeCss {
 	float:left;
 	margin:20px;
 }
 .marginCss {
 	margin-left:100px;
 }
 
 .timeCss > ul > li {
 	text-align:center;
 }
 .product {
 	margin-left:20px;
 	margin-top : 20px;
 }
 .information_css {
 	color:white;
 	padding-left:5px;
 }
</style>
<script>
$(function() {
	
	var date = new Date();
	var month = date.getMonth() + 1; // 월
	var day = date.getDate(); // 일
	var dayint = date.getDay(); // 요일 0~6
	
	var dayArray = new Array("일","월","화","수","목","금","토");
	// 월 설정
	$("#monthText").text(month);
	$(".cloneUl").find("label").eq(1).text(dayArray[dayint]);
	var dayintIndex = dayint;
	for(var i = 0; i < 21; i++) {
		var cloneTimeDiv = $(".cloneUl:first").clone();
		
		
		// -- 날짜 --
		cloneTimeDiv.find("label").eq(0).text(day + i);
		if(dayintIndex > 6) {
			dayintIndex = 0;
		}
		// --요일--
		// 토요일 글꼴색상 수정
		if(dayintIndex == 6) {
			cloneTimeDiv.find("label").eq(1).css("color","blue");
		}
		// 일요일 글꼴색상 수정
		if(dayintIndex == 0) {
			cloneTimeDiv.find("label").eq(1).css("color","red");
		}
		cloneTimeDiv.find("label").eq(1).text(dayArray[dayintIndex]);
		dayintIndex ++;
		//$("#cloneTimeDiv").append(cloneTimeDiv);		
	}
	//$(".cloneUl").eq(0).css("visibility", "hidden");
	
	console.log(cloneTimeDiv);
});
</script>


<body class="js">
	<section class="hero-slider">
		<!-- Single Slider -->
		<div style="background-color: black;">
			<div>
				<!--  메인이미지랑 같게 -->
				<img src="/resources/images/main2.jpg"
					style="height: 100%; width: 100%;" />
			</div>
		</div>
		<!--/ End Single Slider -->
	</section>
	<!-- Start Blog Single -->
	<section class="blog-single section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="blog-single-main">
						<div class="row">
							<div class="col-12">
								<!--  메인이미지 가져오기 -->
								<div class="image">
									<img src="https://via.placeholder.com/950x460" alt="#">
								</div>
								<div class="blog-detail">
									<h1 class="blog-title fa-4x">울산 삼산점</h1>
									<div class="blog-meta">
										<span><i class="fa fa-film"> 총 영화관 수 :</i></span> 
										<span id="theater_count">15관</span> 
										<span><i class="fa fa-user"> 총 좌석수 :</i></span> 
										<span id="seat_count">155석</span>
									</div>
									<!--  각종 안내 -->
									<div class="blog-meta">
										<p>울산광역시 남구 삼산동(영화관주소)</p><br/>
										<span class="content_padding">
											<a id="modal-458336" href="#modal-container-458336" role="button" class="btn" data-toggle="modal">
												<img src="/resources/images/jmh/bus.png" /><label class="information_css">대중교통안내</label>
											</a>
										</span> 
										<span class="content_padding">
											<a id="modal-458337" href="#modal-container-458337" role="button" class="btn" data-toggle="modal">
												<img src="/resources/images/jmh/parking.png" /><label class="information_css">주차 안내</label> 
											</a>
										</span> 
										<span class="content_padding">
											<a id="modal-458338" href="#modal-container-458338" role="button" class="btn" data-toggle="modal">
												<img src="/resources/images/jmh/map.png" /><label class="information_css">지도 안내</label> 
											</a>
										</span>
									</div>
									<div class="content">
										<h2 class="blog-title">이벤트</h2>
									</div>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-12">
					<div class="main-sidebar">
					<!--  검색창 -->
						<!-- Single Widget -->
						<div class="single-widget search">
							<div class="form">
								<input type="text" placeholder="검색할 영화관 입력"> <a
									class="button" href="#"><i class="fa fa-search"></i></a>
							</div>
						</div>
						<!--/ End Single Widget -->
						<!-- 오른쪽 side bar 안내 -->
						<div class="single-widget category">
							<h3 class="title">영화관 안내</h3>
							<ul class="categor-list">
								<li><a href="#">울산 삼산점</a></li>
								<li><a href="#">울산 성남동점</a></li>
								<li><a href="#">서울 강남점</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		<div>
		<!--  이벤트창 -->
		<div class="row">
			<div class="blog-meta">
				<div class="image divEvent">
					<ul>
						<li><a href="#"><img src="/resources/images/jmh/eventSampleImage.jpg" alt="#" class="content_padding"/></a></li>
						<li class="fa-stack-1x">이벤트주제</li>
					</ul>
					<br/>
				</div>
				<div class="image divEvent">
					<ul>
						<li><a href="#"><img src="/resources/images/jmh/eventSampleImage.jpg" alt="#" class="content_padding"/></a></li>
						<li class="fa-stack-1x">이벤트주제 </li>
					</ul>
				</div>
				<div class="image divEvent">
					<ul>
						<li><a href="#"><img src="/resources/images/jmh/eventSampleImage.jpg" alt="#" class="content_padding"/></a></li>
						<li class="fa-stack-1x">이벤트주제 </li>
					</ul>
				</div>
			</div>
		</div> <!--  end 이벤트 -->
		<!--  상영시간표 안내 -->
		<div class="row">
			<h2 class="blog-title">상영시간표</h2>
		</div>	
		<div class="row">
			<div>
				<div class="marginCss">
					<label id="monthText">7</label>월
				</div>
			</div>
		</div>	
		<div class="row blog-meta">
			<div class="marginCss"> 
				
				
				<div class="timeCss" style="float:left;transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;" id="cloneTimeDiv" > 
					<ul style="float:left;margin-right:30px;" class="cloneUl">
						<li><a href="#" style="cursor:pointer;"><label class="fa-2x">1</label></a></li>
						<li><label>1</label></li>
					</ul>
				</div>
				<div class="timeCss" style="float:left;transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;" id="cloneTimeDiv" > 
					<ul style="float:left;margin-right:30px;" class="cloneUl">
						<li><a href="#" style="cursor:pointer;"><label class="fa-2x">1</label></a></li>
						<li><label>1</label></li>
					</ul>
				</div>
				<div class="timeCss" style="float:left;transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;" id="cloneTimeDiv" > 
					<ul style="float:left;margin-right:30px;" class="cloneUl">
						<li><a href="#" style="cursor:pointer;"><label class="fa-2x">1</label></a></li>
						<li style="float:left;"><label>1</label></li>
					</ul>
				</div>
				<div class="timeCss" style="float:left;transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 800px;" id="cloneTimeDiv" > 
					<ul style="float:left;margin-right:30px;" class="cloneUl">
						<li><a href="#" style="cursor:pointer;"><label class="fa-2x">1</label></a></li>
						<li style="float:left;"><label>1</label></li>
					</ul>
				</div>
				
			</div>
			<div style="float:left;padding:10px; padding-right:10px;">
					<button type="button"><img src="/resources/images/jmh/point_left.png"/></button>
				</div>
				<div style="float:left;padding:10px;">
					<button type="button"><img src="/resources/images/jmh/point_right.PNG"/></button>
				</div>
		</div>	
		<!--  관람등급 안내 -->
		<div class="row" style="background-color:#f8f8f8;">
			<img src="/resources/images/jmh/movie_grade.png"/>
			<a id="modal-458339" href="#modal-container-458339" role="button"  data-toggle="modal"><img src="/resources/images/jmh/movie_grade_info.png"/></a>
		</div>
		<!--  end 관람등급 안내 -->
		
		<!-- 상영회차 및 시간안내 -->
		<!--  영화 하나 시작 -->
		<div class="row" style="margin-top:30px;">
			<img src="/resources/images/jmh/movie_grade_12.PNG"/>
			<span class="fa-2x" style="padding-top:15px;">#살아있다</span>
		</div>
		<div class="row">
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
		</div>
		<!--  영화 하나 끝 -->
		<!--  영화 하나 시작 -->
		<div class="row" style="margin-top:30px;">
			<img src="/resources/images/jmh/movie_grade_12.PNG"/>
			<span class="fa-2x" style="padding-top:15px;">#살아있다</span>
		</div>
		<div class="row">
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
			<ul style="width:200px; text-align:center;">
				<li class="product" style="border:3px solid #A6A6A6;border-radius: 1em;">
					<dl>
						<dt style="display:none;">상영시간</dt>
						<dd>
							<span class="fa fa-3x" style="padding-top:10px;">10:00</span>
						</dd>
						<dt style="display:none;">잔여석</dt>
						<dd style="float:left;padding-left:15px;">
							<strong>82</strong>  / 109
						</dd>
						<dt style="display:none;">상영관</dt>
						<dd>6관</dd>
					</dl>
				</li>
			</ul>
		</div>
		<!--  영화 하나 끝 -->
	</div>
</div><!--  end container -->
</section>
<div class="row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
			<div class="carousel slide" id="carousel-529126">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-529126">
					</li>
					<li data-slide-to="1" data-target="#carousel-529126">
					</li>
					<li data-slide-to="2" data-target="#carousel-529126" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-529126" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-529126" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</body>
<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</html>