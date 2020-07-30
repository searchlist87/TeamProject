<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style>
	.subul {
		padding-left : 30px;
		margin-top : 10px;
		font-size : 15px;
		border : 1px dotted #ccc;
	}
	thead tr th {
		text-align: center;
	}
	td {
		text-align: center;
	}
</style>
<script src="/resources/js/sgh_js/myScript.js"></script>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<script>
$(function() {
	$(".point_date").each(function() {
		var point_date = $(this).text();
		var str_date = dateString(point_date);
		$(this).text(str_date);
	});
});
</script>

<body class="js">  
<div class="container" style="left:100px;margin-top:100px;">
		<h2>My page_마이페이지</h2>
</div>
<!-- Start Contact -->
<section id="contact-us" class="contact-us section" style="padding:50px;">
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="/WEB-INF/views/user/jmh/include/mypage_side_menu.jsp"%>
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
								<h4>포인트 사용 내역</h4>
								<h3>포인트 사용 내역</h3>
							</div>
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>포인트</th>
												<th>사용날짜</th>
												<th>사용용도</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${point_list}" var="SghPointListVo">
											<tr>
												<td data-used-code="${SghPointListVo.point_used_num}">${SghPointListVo.used_point}P</td>
												<td class="point_date">${SghPointListVo.used_point_date}</td>
												<td>${SghPointListVo.point_used_name}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
<!--/ End Contact -->
<%@ include file="../../../include/footer.jsp"%>
</body>
</html>