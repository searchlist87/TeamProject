<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.eventTitle:hover {
		color:red;
	}
</style>
<script>
$(function () {
	$("#event_manage > dd").css("display","block");
	$("#event_manage > dt").css("color","red");
	$("#event_manage > dd").eq(0).css("color","blue");
	
	$("#searchBtn").click(function () {
		var searchType = $("#selectSearch option:selected").val();
		var keyword = $("#keyword").val();
		if (keyword == null || keyword == "") {
			alert("검색 키워드를 확인해주세요.");
			return false;
			
		}
		location.href="/admin/admin_event_list?searchType=" + searchType + "&keyword=" + keyword;
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능(a:링크) 막기
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
});
</script>

<body class="js">
<%@ include file="../user/jmh/include/formPage.jsp" %>
<!-- 해더 부분 -->
<%@include file="../include/admin_header.jsp" %>
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
		
			<div class="container" style="padding:0px;">
			
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;">
									<h4 class="title" >이벤트관리_이벤트조회</h4>
								</div>	
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">
										
									<div class="single-shorter" style="vertical-align:middle;">
										<label>검색 :</label>
										<select id="selectSearch">
											<option selected="selected" value="ename">이벤트명</option>
										</select>
									</div>

									<input type="text" name="keyword" id="keyword"/>
									<button class="btn" id="searchBtn">검색</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<div style="padding-bottom:20px;">
									<h6 style="color:green;">* 이벤트 주제를 클릭하면 상세페이지로 이동합니다.</h6>
								</div>
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:70px;">순서</th>
											<th>이벤트 주제</th>
											<th style="width:400px;">이벤트 기간</th> 
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
									<!--  이벤트 조회 -->
									<c:forEach items="${list}" var="vo">
										<tr style="height:50px;">
											<td>${vo.event_code}</td>
											<td><a href="/admin/admin_event_selectEvent?event_code=${vo.event_code}" class="eventTitle">${vo.event_title}</a></td>
											<td>${vo.event_start_date} ~ ${vo.event_end_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
<%@ include file="../include/footer.jsp" %>
</html>