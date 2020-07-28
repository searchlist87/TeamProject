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

.table td {
	vertical-align:middle;
}

.table thead th {
	vertical-align:middle;
}

</style>
<script>
$(function () {
	$("#costomer_manage > dd").css("display","block");
	$("#costomer_manage > dt").css("color","red");
	$("#costomer_manage > dd").eq(0).css("color","blue");
	
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
									<h4 class="title" >회원정보 관리</h4>
								</div>	
								<div style="margin-top:50px;"></div>
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:10px;"></th>
											<th style="width:70px;">아이디</th>
											<th style="width:150px;">이름</th>
											<th style="width:70px;">성별</th>
											<th style="width:150px;">이메일</th> 
											<th style="width:70px;">생일</th>
											<th style="width:100px;">휴대폰</th>
											<th style="width:150px;">주소</th>
											<th style="width:70px;">사용금액</th>
											<th style="width:70px;">총 포인트</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
									<!--  1:1문의 조회 -->
									<c:forEach items="${jmhUserVo}" var="userVo">
										<tr style="height:50px;">
											<td class="userTd">${userVo.user_num}</td>
											<td class="userTd">${userVo.user_id}</td>
											<td class="userTd">${userVo.user_name}</td>
											<td class="userTd">${userVo.user_gender}</td>
											<td class="userTd">${userVo.user_email}</td>
											<td class="userTd">${userVo.user_birth}</td>
											<td class="userTd">${userVo.user_phone}</td>
											<td class="userTd">${userVo.user_address}</td>
											<td class="userTd">${userVo.user_total_money}</td>
											<td class="userTd">${userVo.user_point}</td>
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