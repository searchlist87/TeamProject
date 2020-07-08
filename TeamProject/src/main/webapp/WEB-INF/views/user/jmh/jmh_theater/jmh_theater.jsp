<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
<!--  tag_and_styleSheet include -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
#theater_count {
	padding-right: 20px;
}
 .divEvent { 
 	float : left; 
 } 
 .eventEmage {
 	padding-right: 10px;
 }
</style>
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
									<h2 class="blog-title">울산 삼산점</h2>
									<div class="blog-meta">
										<span><i class="fa fa-user">총 영화관 수 :</i></span> 
										<span id="theater_count">15관</span> 
										<span><i class="fa fa-user">총 좌석수 :</i></span> 
										<span id="seat_count">155석</span>
									</div>
									<!--  각종 안내 -->
									<div class="content">
										<p>울산광역시 남구 삼산동</p>
										<span class=""><img src="/resources/images/jmh/bus.png" />대중교통안내</span> 
										<span><img src="/resources/images/jmh/parking.png" />주차 안내</span> 
										<span><img src="/resources/images/jmh/map.png" />지도 안내</span>
									</div>
									<hr />
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
			<div class="image divEvent">
				<ul>
					<li><img src="/resources/images/jmh/eventSampleImage.jpg" alt="#" class="eventEmage"/></li>
					<li><a href="#">이벤트1</a> </li>
				</ul>
			</div>
			<div class="image divEvent">
				<ul>
					<li><img src="/resources/images/jmh/eventSampleImage.jpg" alt="#" class="eventEmage"/></li>
					<li><a href="#">이벤트</a> </li>
				</ul>
			</div>
			<div class="image divEvent">
				<ul>
					<li><img src="/resources/images/jmh/eventSampleImage.jpg" alt="#" class="eventEmage"/></li>
					<li><a href="#">이벤트1</a> </li>
				</ul>
			</div>
		</div> <!--  end 이벤트 -->
		<!--  상영시간표 안내 -->
		<div>
		
		</div>
	</div>
</div><!--  end container -->
</section>
	<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</body>
</html>