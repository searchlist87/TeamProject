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
	
	$(".nice-select").remove();
	$("#selectSearch").removeAttr("style");
	
	// 현재 시간 및 날짜
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 월
	var day = date.getDate(); // 일
	
	
	
	// pastEventBtn 지난이벤트
	$("#pastEventBtn").click(function (e) {
		e.preventDefault();
		var date = year + "-" + month + "-" + day;
		location.href="/event/pastEventList?event_end_date="+date;
	});
	
	$("#searchBtn").click(function (e) {
		e.preventDefault();
		var searchType = $("#selectSearch option:selected").val();
		var keyword = $("#keyword").val();
		if (keyword == null || keyword == "") {
			alert("검색 키워드를 확인해주세요.");
			return false;
			
		}
		location.href="/event/eventList?searchType=" + searchType + "&keyword=" + keyword;
	});
	
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
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 blog-meta" style="margin-bottom:20px;">
				<h2>진행 이벤트</h2>
				<div style="float:right;">
					<div style="padding:10px;float:left;height:50px;">
						<select id="selectSearch"> 
							<option selected="selected" value="ename">이벤트명</option>
						</select>
					</div>
					<input type="text" name="keyword" id="keyword" value="${searchMap.keyword}"/>
					<a href="/event/eventList" role="button" class="btn" style="color:#fff;background-color:#2328bb;" id="searchBtn">검색</a>
					
					<a href="/event/pastEventList" role="button" class="btn" style="color:#fff;" id="pastEventBtn">지난이벤트 보기</a>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="padding-left:100px;">
				<div class="blog-meta" id="cloneDiv">
					<c:forEach items="${list}" var="eventVo">
					<div class="image divEvent">
					<span style="margin-bottom:10px;"><strong>${eventVo.event_title}</strong></span>
						<ul>
							<li>
								<a href="/event/selectEvent?event_code=${eventVo.event_code}">
									<img src="/upload/displayFile?fileName=${eventVo.event_thumb_image}" style="width:300px; height:180px;"/>
								</a>
							</li>
							<li class="fa-stack-1x">${eventVo.event_start_date}~${eventVo.event_end_date}</li>
						</ul>
						<br/>
					</div>
					</c:forEach>
				</div>	
			</div>
			<div class="col-md-2"></div>
			
		</div> <!--  end 이벤트 -->
	
</section>

</body>
<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</html>