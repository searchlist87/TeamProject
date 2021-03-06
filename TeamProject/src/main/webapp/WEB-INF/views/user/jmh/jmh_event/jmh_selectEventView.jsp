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
	<script src="/resources/js/jmh_js/jmh_js.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x6srghvj2m"></script>
<style>
  .divEvent {  
  	float : left; 
  	margin-right:50px; 
  	margin-bottom:50px;
  }  
 
</style>
<script>
$(function() {
	
	// 현재 시간 및 날짜
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 월
	var day = date.getDate(); // 일
	var dayint = date.getDay(); // 요일 0~6
//  현재 달의 일 수 구하기
	var dateCount = new Date(year, month, 0).getDate();
	
	var dayArray = new Array("일","월","화","수","목","금","토");
	
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
		<!--  이벤트창 -->
		<div class="row" style="text-align:center;">
			<div class="col-md-2"></div>
			<div class="col-md-8 blog-meta" style="margin-bottom:20px;">
				<img src="/upload/displayFile?fileName=${eventVo.event_content_image}"/>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align:center;">
				<a href="/event/eventList" role="button" class="btn" style="color:#fff;">목록</a>
			</div>
			<div class="col-md-2"></div>
			
		</div> <!--  end 이벤트 -->
	
</section>

</body>
<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</html>