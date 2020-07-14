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
<div class="container-fluid" style="margin-top: 100px; margin-bottom: 100px;">
	<div style="text-align: center; margin-bottom: 20px;"><h1>Login</h1></div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/sgh/user/loginRun" method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호"/>
				</div>
				<div>
					<button type="submit" class="btn btn-sm">
						로그인
					</button>
					<a href="/sgh/user/findId">아이디 찾기</a> <!-- 이메일 보내기 -->
					<a href="/sgh/user/findPw">비밀번호 찾기</a> <!-- 이메일 보내기 -->
					<a href="/sgh/user/joinForm">회원가입</a>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>