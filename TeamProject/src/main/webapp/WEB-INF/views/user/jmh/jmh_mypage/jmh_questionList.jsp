<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.link_hover:hover {
	color:red;
}
</style>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<script>
$(function () {
	var rMsg = "${rMsg}";
	console.log(rMsg);
	if (rMsg == "success") {
		alert("1:1 문의가 등록되었습니다.");
	}
	
});
</script>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body class="js"> 

<div class="container" style="left:100px;margin-top:100px;">
		<h2>My page_마이페이지</h2>
</div>
<!-- Start Contact -->
<section id="contact-us" class="contact-us section" style="padding:50px;">
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="../include/mypage_side_menu.jsp"%>
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
								<h4>1:1 문의</h4>
								<h3>1:1 문의 내역</h3>
							</div>
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>문의번호</th>
												<th>제목</th>
												<th>문의날짜</th>
												<th>답변상태</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${jmhBoardVo}" var="boardVo">
											<tr>
												<td>${boardVo.board_code}</td>
												<td><a href="/mypage/selectQuestion?board_code=${boardVo.board_code}" class="link_hover">${boardVo.board_title}</a></td>
												<td>${boardVo.board_date}</td>
												<td>
												<c:choose>
													<c:when test="${boardVo.count == 0}"><span>없음</span></c:when>
													<c:otherwise><span style="color:red;">있음</span></c:otherwise>
												</c:choose>
												</td>
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