<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>

<style>
	a {
		margin-left: 10px;
	}
	input {
		width: 30%;
	}
</style>

<script>
	var result = "${result}";
	if(result == true) {
		alert("회원가입에 성공하셨습니다. 로그인 해주세요.");
	}
	
	var loginResult = "${loginResult}";
	if(loginResult == 'false') {
		alert("로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요.");
	}
</script>
<body class="loginBody">
<div class="container-fluid" style="margin-top: 200px; margin-bottom: 100px;">
	<div style="text-align: center; margin-bottom: 200px;"><h1>결제해주셔서 감사합니다.</h1></div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>