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

	<!-- 영화 메인 사진 -->
	<div class="foodMain" style="background-color:black">
		<div style="background-color:black" class="container">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div>
						<img src="/resources/images/gsh/peninsula.jpg" style="height:300px; width:100%;"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ 영화 메인 사진 -->
		<div></div>
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">카테고리</h3>
								<ul class="categor-list">
									<li><a href="#">베스트</a></li>
									<li><a href="#">신작</a></li>
									<li><a href="#">상영작</a></li>
								</ul>
							</div>
							<!--/ End Single Widget -->
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top" style="border-bottom: 1px solid #ddd;margin-bottom:20px;">
									<div class="shop-shorter">
										<div class="single-shorter">
											<h3>전체</h3>
										</div>
									</div>
<!-- 									<ul class="view-mode"> -->
<!-- 										<li class="active"><a href="shop-grid.html"><i class="fa fa-th-large"></i></a></li> -->
<!-- 										<li><a href="shop-list.html"><i class="fa fa-th-list"></i></a></li> -->
<!-- 									</ul> -->
								</div>
								<!--/ End Shop Top -->
							</div>
						</div>
						<div class="row" style="padding-left:20px;">
						
						<!-- 영화 이미지 -->
<!-- 						2020/7/16/fc4a73ad-2b07-483c-b208-9ab6d063bd00-main.jpg -->
<!-- 						2020/7/16/fdc652a5-9227-41c3-bc13-6230749a815a-main.jpg -->
<!-- 						2020/7/16/e1a47c4e-9384-4553-ab96-bfc16342a596-main.jpg -->
<!-- 						2020/7/16/b8d617e8-c834-4fc0-a509-3f3677766155-main.jpg -->
<!-- 						2020/7/16/6d8435fc-9613-4b92-bf7f-ca15676d7252-main.jpg -->
<!-- 						2020/7/16/1821590e-6ff2-4ecf-abd6-8c8de07d4d40-main.jpg -->
<!-- 						2020/7/16/aada08a4-8c72-46eb-a1e0-64a809d4ca57-main.jpg -->
<!-- 						2020/7/16/cfeb140c-892c-4dff-9bb1-3074f70a3cca-main.jpg -->
							
				<c:forEach items="${list}" var="vo">
					<div class="col-md-3" style="margin-bottom:30px;text-align:center;">
						<a href="/gsh/movie/movieInfo">
							<h3>
								<span><img src="/upload/displayFile?fileName=${vo.movie_main_image}" style="width:100px;height:auto;"></span>
							</h3>
							<span><img src="/resources/images/jmh/movie_grade_${vo.movie_grade}.png" width="30">${vo.movie_name}</span>
						
						</a>
					</div>
				</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		
		
<!-- 페이징 -->
<!-- <div class="row"  style="text-align:center;"> -->
<!-- 	<div class="col-md-4"></div> -->
<!-- 		<div class="col-md-8 text-center" style="text-align:center;"> -->
<!-- 			<nav style="text-align:center;"> -->
<!-- 				<ul class="pagination text-center" style="text-align:center;"> -->
				
<!-- 				이전 버튼 -->
<%-- 				<c:if test ="${pagingDto.startPage != 1}"> --%>
<!-- 					<li class="page-item" style="width:60px;"  style="float:left;"> -->
<%-- 				    	<a class="page-link" href="${pagingDto.startPage - 1}">이전</a> --%>
<!-- 					</li> -->
<%-- 				</c:if> --%>

<!-- 			 	페이징 넘버링 -->
<%-- 			 	<c:forEach begin="${pagingDto.startPage}" end="${pagingDto.endPage}" var="v"> --%>
<!-- 				    <li id="pageNumber" class="page-item"  style="width:30px; float:left;"> -->
<%-- 				    	<a class="page-link" href="${v}">${v}</a> --%>
<!-- 				    </li> -->
<%-- 				</c:forEach>    	 --%>
				
<!-- 				다음 버튼 -->
<%-- 				  <c:if test="${pagingDto.endPage < pagingDto.totalPage}"> --%>
<!-- 				    <li class="page-item" style="width:60px; float:left;"> -->
<%-- 				    	<a class="page-link" href="${pagingDto.endPage + 1}">다음</a> --%>
<!-- 				    </li> -->
<%-- 				   </c:if> --%>
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	<div class="col-md-4"></div> -->
<!-- 	<div class="col-md-12" style="margin-bottom: 100px;"></div>	 -->
<!-- </div> -->
<!-- /페이징 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>