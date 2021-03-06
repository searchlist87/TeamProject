<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<style>
	.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
}

</style>
<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>

  <!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>

</head>
<body class="js">

<!-- 해더 부분 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

	<!-- 영화 메인 사진 시작 -->
	<section class="hero-slider">
		<!-- Single Slider -->
		<div style="background-color:black;">
			<div>
			<img src="/resources/images/main2.jpg" style="height:100%; width:100%;"/>  
			</div>
		</div>
		<!--/ End Single Slider -->
	</section>
	<!-- 영화 메인 사진 끝 -->
	
		<div></div>
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top" style="border-bottom: 1px solid #ddd;margin-bottom:20px;">
									<div class="shop-shorter">
										<div class="single-shorter">
											<h3 style="margin-left:450px;">TOTAL MOVIE</h3>
										</div>
									</div>
								</div>
								<!-- End Shop Top -->
							</div>
						</div>
						<div class="row" style="padding-left:20px;">
							
				<c:forEach items="${list}" var="vo">
				
					<div class="col-md-3" style="margin-bottom:30px;text-align:center;">
						<a href="/gsh/movie/movieInfo?movie_code=${vo.movie_code}">
							<span><img src="/upload/displayFile?fileName=${vo.movie_main_image}" style="width:184px;height:262.84px;border-radius: 2%;"></span><br>
							<span><img src="/resources/images/jmh/movie_grade_${vo.movie_grade}.png" width="30">${vo.movie_name}</span>
							<br>
							<c:choose>
								<c:when test="${vo.review_score < 1}">
								<span style="color: blue;">평점 없음</span>
								</c:when>
								<c:otherwise>
								
								<c:choose>
									<c:when test="${vo.review_score < 3}">
									<span style="color: red;">
									</c:when>
									<c:otherwise>
									<span style="color: green;">
									</c:otherwise>
								
								</c:choose>
								평점 :
								<c:forEach begin="1" end="${vo.review_score}">
							 	★
							 	
							 	</c:forEach> (${vo.review_score})점</span>
								</c:otherwise>
							</c:choose>
							 
							
							 
							</span>
						</a>
					</div>
				</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>
		
<!-- 페이징 시작 -->
<div class="row"  style="text-align:center;">
	<div class="col-md-4"></div>
		<div class="col-md-8 text-center" style="text-align:center;">
			<nav style="text-align:center;">
				<ul class="pagination text-center" style="text-align:center;">
				
<!-- 				이전 버튼 -->
				<c:if test ="${gshPagingDto.startPage != 1}">
					<li class="page-item" style="width:60px;"  style="float:left;">
				    	<a class="page-link" href="/gsh/movie/movieView?startPage=${gshPagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>

<!-- 			 	페이징 넘버링 -->
			 	<c:forEach begin="${gshPagingDto.startPage}" end="${gshPagingDto.endPage}" var="v">
				    <li id="pageNumber" class="page-item"  style="width:30px; float:left;">
				    	<a class="page-link" href="/gsh/movie/movieView?page=${v}">${v}</a>
				    </li>
				</c:forEach>    	
				
<!-- 				다음 버튼 -->
				  <c:if test="${gshPagingDto.endPage < gshPagingDto.totalPage}">
				    <li class="page-item" style="width:60px; float:left;">
				    	<a class="page-link" href="/gsh/movie/movieView?endPage=${gshPagingDto.endPage + 1}">다음</a>
				    </li>
				   </c:if>
				</ul>
			</nav>
		</div>
	<div class="col-md-4"></div>
	<div class="col-md-12" style="margin-bottom: 100px;"></div>	
</div>
<!-- 페이징 끝 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>