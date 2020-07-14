<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<script>
$(function() {
	
	$("#btnFindPw").submit(function() {
		var user_id = $("input:radio[name='user_id']:checked").val();
		if(user_id == null || user_id == "") {
			alert("찾으실 아이디를 선택해주세요.");
			return false;
		}
	});
});
</script>
<body class="loginBody">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form action="/sgh/user/sendMail" method="get">
				<input type="hidden" name="to" value="${user_email}">
				<div class="container-fluid" style="margin-top: 100px; margin-bottom: 30px; border: 1px solid black;">
					<div style="text-align: center; margin-bottom: 20px;">
						<h1>아이디 찾기</h1>
					</div>
					<c:forEach items="${list}" var="SghFindDto">
						<div style="text-align: center; margin-bottom: 10px; margin-top: 10px;">
							<input type="radio" name="user_id" style="margin-right: 10px;" value="${SghFindDto.user_id}">${SghFindDto.user_id}
						</div>
					</c:forEach>
					<h5 style="text-align: center;">조회하신 아이디를 찾았습니다.<br/>이메일로 새 비밀번호를 전송하시겠습니까?</h5>
				</div>
				<div style="text-align: center; margin-bottom: 20px;">
					<button type="submit" id="btnFindPw" class="btn btn-sm">비밀번호 찾기</button>
					<a href="/sgh/user/findId" class="btn btn-sm" style="color: white;">뒤로</a>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>