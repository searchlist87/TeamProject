<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>

<style>
	body {
		text-align: center;
	}
	a {
		margin-left: 10px;
	}
	input {
		width: 30%;
	}
</style>
<script src="/resources/css/button_css.css"></script>
<body class="loginBody">
<div class="container-fluid" style="margin-top: 100px; margin-bottom: 100px;">
	<div style="text-align: center; margin-bottom: 20px;"><h1>존재하지 않는 계정 입니다.</h1></div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<a href="/sgh/user/loginForm" class="btn_black btn-lg" style="color : white; margin-top: 10px;">로그인</a>
			<a href="/ " class="btn_black btn-lg" style="color : white; margin-top: 10px;">메인화면</a>
			<a href="/sgh/user/findId" class="btn_black btn-lg" style="color : white; margin-top: 10px;">아이디 찾기</a>
			<a href="/sgh/user/findPw" class="btn_black btn-lg" style="color : white; margin-top: 10px;">비밀번호 찾기</a>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>