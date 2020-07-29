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
	.movie_title:hover {
		color:red;
	}
.page-item {
	float:left;
}
.page-link {
	width:30px;
	float:left;
}

.link_hover:hover {
	color:red;
}
</style>
<script>
$(function () {
	$("#board_manage > dd").css("display","block");
	$("#board_manage > dt").css("color","red");
	$("#board_manage > dd").eq(2).css("color","blue");
	
	
// 	$("#selectSearch").change(function () {
		
// 		var searchType = $("#selectSearch option:selected").val();
// 		if (searchType == 'noReply') {
// 			$("#keyword").css("visibility", "hidden");
// 		} else {
// 			$("#keyword").css("visibility", "visible");
// 		}
// 	});
	
	$("#searchBtn").click(function () {
		var searchType = $("#selectSearch option:selected").val();
		if (searchType == 'noReply') {
		} else {
			var keyword = $("#keyword").val();
			if (keyword == null || keyword == "") {
				alert("검색 키워드를 확인해주세요.");
				$("#keyword").focus();
				return false;
				
			}
		}
		$("#frmPage > input[name=searchType]").val(searchType);
		$("#frmPage > input[name=keyword]").val(keyword);
		$("#frmPage").attr("action","/admin/admin_questionList");
		$("#frmPage").submit();
	});
	
	$("#listBtn").click(function () {
		location.href="/admin/admin_questionList";
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능(a:링크) 막기
		var page = $(this).attr("href").trim();
		$("#frmPage").attr("action","/admin/admin_questionList");
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
									<h4 class="title" >1:1 문의 관리</h4>
								</div>	
								<div style="margin-top:50px;"></div>
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">
										
									<div class="single-shorter" style="vertical-align:middle;">
										<label>검색 :</label>
										<select id="selectSearch">
											<option selected="selected" value="user_id">아이디</option>
											<option value="noReply">무답변</option>
										</select>
									</div>

									<input type="text" name="keyword" id="keyword"/>
									<button class="btn" id="searchBtn">검색</button>
									<button class="btn" id="listBtn">목록</button>
								</div>	
								<!--  검색 끝 -->
								
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:70px;">순서</th>
											<th style="width:70px;">아이디</th>
											<th style="width:100px;">제목</th>
											<th style="width:130px;">문의 작성일</th>
											<th style="width:130px;">답변 상태</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
									<!--  1:1문의 조회 -->
									<c:forEach items="${jmhBoardVo}" var="boardVo">
										<tr style="height:50px;">
											<td style="vertical-align:middle;">${boardVo.board_code}</td>
											<td>${boardVo.user_id}</td>
											<td style="vertical-align:middle;"><a class="link_hover" href="/admin/admin_selectQuestion?board_code=${boardVo.board_code}&user_id=${boardVo.user_id}">${boardVo.board_title}</a></td>
											<td style="vertical-align:middle;">${boardVo.board_date}</td>
											<td style="vertical-align:middle;">
											<c:choose>
												<c:when test="${boardVo.count == 0}"><span>없음</span></c:when>
												<c:otherwise><span style="color:red;" class="replyOk">있음</span></c:otherwise>
											</c:choose></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
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
					</div>
				</div>
			</div>
		</section>
</body>
<%@ include file="../include/footer.jsp" %>
</html>