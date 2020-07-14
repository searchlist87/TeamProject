<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<script>
$(function() {
	
	$("#mailForm").submit(function() {
		$("#btnFindPw").attr("disabled", true);
	});
});
</script>
<body class="loginBody">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form id="mailForm" action="/sgh/user/sendMail" method="get">
				<input type="hidden" name="to" value="${sghFindDto.user_email}">
				<input type="hidden" name="user_id" value="${sghFindDto.user_id}">
				<div class="container-fluid" style="margin-top: 100px; margin-bottom: 30px; border: 1px solid black;">
					<div style="text-align: center; margin-bottom: 20px;">
						<h1>비밀번호 찾기</h1>
					</div>
					<div style="text-align: center; margin-bottom: 10px; margin-top: 10px;">
						${sghFindDto.user_id}
					</div>
					<h5 style="text-align: center;">해당 아이디의 이메일로 새 비밀번호를 전송하시겠습니까?</h5>
				</div>
				<div style="text-align: center; margin-bottom: 20px;">
					<button type="submit" id="btnFindPw" class="btn btn-sm">확인</button>
					<a href="/sgh/user/findPw" class="btn btn-sm" style="color: white;">뒤로</a>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>