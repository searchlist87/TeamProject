<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="zxx">
<head>
<!--  tag_and_styleSheet include -->
<%@ include file="../include/tag_and_styleSheet.jsp"%>
<%@ include file="../include/bootstrap.jsp" %>
</head>
<!--  header include -->
<%@include file="../include/header.jsp"%>
<script>
$(function() {
	var result = "${result}";
	if(result == "false") {
		console.log("찍힘");
		alert("잘못된 등급의 접근 입니다.");
		return false;
	}
	
	var movie_payment_result = "${movie_payment_result}";
	if(movie_payment_result == "true") {
		alert("구매해주셔서 감사합니다.");
		return false;
	}
	
	//회원 탈퇴 처리 후 결과
	var secessionMsg = "${secessionMsg}";
	if(secessionMsg == "success") {
		alert("회원 탈퇴 되었습니다.");
	}
});
function zoomIn(event) {
	event.target.style.transform = "scale(1.2)";
    event.target.style.zIndex = 1;
    event.target.style.transition = "all 0.5s";
}

function zoomOut(event) {
	event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.5s";
}
</script>
<body class="js">

	<!-- Slider Area -->
	<section class="hero-slider">
		<!-- Single Slider -->
		<div style="background-color:black;">
			<div>
			<img src="/resources/images/main2.jpg" style="height:100%; width:100%;"/>  
			</div>
		</div>
		<!--/ End Single Slider -->
	</section>
	<!--/ End Slider Area -->
	
	<!-- Start Small Banner  -->
	<section class="small-banner section">
	<div class="row">
		<div class="col-12">
			<div class="section-title">
				<h2>Movie BEST 3</h2>
			</div>
		</div>
	</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-3"></div>
			<!--  영화 best3 작업 -->
				<!-- Single Banner  -->
				<div class="col-6" style="margin-left:45px;">
				<c:forEach items="${jmhMovieBest3Vo}" var="jmhMovieBest3Vo">
					<ul class="single-banner" style="float:left;">
						<li style="margin-right:50px;"><a href="/gsh/movie/movieInfo?movie_code=${jmhMovieBest3Vo.movie_code}"><img src="/upload/displayFile?fileName=${jmhMovieBest3Vo.movie_main_image}" alt="${jmhMovieBest3Vo.movie_main_image}" style="width:250px; height:350px;"></a></li>
					</ul>
				</c:forEach>
				</div> 
				<!-- /End Single Banner  -->
				<div class="col-3"></div>
			</div>
		</div>
	</section>
	
	<!-- Start Most Popular -->
	<div class="product-area most-popular section">
        <div class="container">
            <div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>New Movie</h2>
					</div>
				</div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="owl-carousel popular-slider">
						<!-- Start Single Product -->
						<!--  신상 영화 나오는 곳 -->
						<c:forEach items="${jmhMovieVo}" var="movieVo">
						<div class="single-product">
							<div class="product-img">  
								<a href="/gsh/movie/movieInfo?movie_code=${movieVo.movie_code}">
									<img class="default-img" src="/upload/displayFile?fileName=${movieVo.movie_main_image}" alt="${movieVo.movie_main_image}" 
									onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
<!-- 									<img class="hover-img" src="" alt=""> -->
									<span class="out-of-stock" style="background-color:#f6931d;">New</span>
								</a>
							</div>
							<div class="product-content">
								<span style="float:left;"><img src="/resources/images/jmh/movie_grade_${movieVo.movie_grade}.png" style="width:30px;height:30px;"/></span>
								<h6 style="padding-top:5px;">${movieVo.movie_name}</h6>
								
							</div>
						</div>
						</c:forEach>
						<!-- End Single Product -->
						<!--  신상 영화 끝나는 곳 -->
						
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--  footer include -->
<%@ include file="../include/footer.jsp"%>
</body>
</html>