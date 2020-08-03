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
<script src="/resources/js/jmh_js/jmh_js.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x6srghvj2m"></script>
<style>

  .divEvent {  
  	float : left; 
  	margin-right:50px; 
  	margin-bottom:50px;
  }  

.page-item {
	float:left;
}
.page-link {
	width:30px;
	float:left;
}
 
</style>
<script>
$(function() {
	
	$("#searchNiceSelect").find(".nice-select").remove();
	$("#selectSearch").removeAttr("style");
	
	// 현재 시간 및 날짜
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 월
	var day = date.getDate(); // 일
	
	var date1 = year + "-" + month + "-" + day;
	// pastEventBtn 지난이벤트
	$("#pastEventBtn").click(function (e) {
		e.preventDefault();
		
		location.href="/event/pastEventList?event_end_date="+date1;
	});
	
	$("#searchBtn").click(function (e) {
		e.preventDefault();
		var searchType = $("#selectSearch option:selected").val();
		var keyword = $("#keyword").val();
		console.log("keyword : "+ keyword);
		if (keyword == null || keyword == "") {
			alert("검색 키워드를 확인해주세요.");
			return false;
			
		}
		$("#frmPage > input[name=searchType]").val(searchType);
		$("#frmPage > input[name=keyword]").val(keyword);
		
		$("#frmPage").attr("action", "/event/eventList");
		$("#frmPage").submit();
	});
	return false;
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능(a:링크) 막기
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").attr("action", "/event/eventList");
		$("#frmPage").submit();
	});
	
});


</script>
<%@ include file="../include/formPage.jsp" %>
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
				<div style="float:right;" id="searchNiceSelect">
					<div style="padding:10px;float:left;height:50px;">
						<select id="selectSearch" name="searchType"> 
							<option selected="selected" value="ename">이벤트명</option>
						</select>
					</div>
					<input type="text" name="keyword" id="keyword" value="${jmhPagingDto.keyword}"/>
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
		
		
		<!--페이징-->
			<div class="row">
				<div class="col-md-5">
				</div>
				<div class="col-md-7">
					<nav>
 						<ul class="pagination">
						<!-- 이전 -->
 							<c:if test="${jmhPagingDto.startPage != 1}">
 								<li class="page-item"><a class="page-link" href="${jmhPagingDto.start_page - 1}">&laquo;</a></li>
 							</c:if>
						<!-- 페이지 넘버링 -->
 							<c:forEach begin="${jmhPagingDto.startPage}" end="${jmhPagingDto.endPage}" var="v">
								<li class="page-item
 									<c:if test="${jmhPagingDto.page == v }">
 										active
 									</c:if>
 									"
 								>
 									<a class="page-link" href="${v}">${v}</a>
 								</li>
 							</c:forEach>
						<!-- 다음 -->
 							<c:if test="${jmhPagingDto.endPage < jmhPagingDto.totalPage}">
 								<li class="page-item"><a class="page-link" href="${jmhPagingDto.endPage + 1}">&raquo;</a></li>
 							</c:if>
 						</ul>
 					</nav>
				</div>
			</div>
		<!--  페이징 끝 -->
</section>

</body>
<!--/ End Blog Single -->
	<%@ include file="../../../include/footer.jsp"%>
</html>