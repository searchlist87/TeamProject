<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
<!--  tag_and_styleSheet include -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/user/jmh/jmh_modal/modal.jsp"%>
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
					<label>7월</label>
				</div>
			</div>
		</div>	
		<div class="row blog-meta">
			<div class="marginCss">
				<div class="timeCss">
					<a href="#"><img src="/resources/images/jmh/point_left.png" style="rotate:180;"/></a>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>8</strong></a></li>
						<li><label>오늘</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>9</strong></a></li>
						<li><label>목</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>10</strong></a></li>
						<li><label>금</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul style="color:#6799FF;">
						<li><a href=""><strong>11</strong></a></li>
						<li><label>토</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul style="color:#F15F5F;">
						<li><a href=""><strong>12</strong></a></li>
						<li><label>일</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>13</strong></a></li>
						<li><label>월</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>14</strong></a></li>
						<li><label>화</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>15</strong></a></li>
						<li><label>수</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>16</strong></a></li>
						<li><label>목</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>17</strong></a></li>
						<li><label>금</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>15</strong></a></li>
						<li><label>수</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>16</strong></a></li>
						<li><label>목</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>17</strong></a></li>
						<li><label>금</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<ul>
						<li><a href=""><strong>17</strong></a></li>
						<li><label>금</label></li>
					</ul>
				</div>
				<div class="timeCss">
					<a href="#"><img src="/resources/images/jmh/point_right.PNG" style="rotate:180;"/></a>
				</div>
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
	<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</body>
</html>