<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<script>
$(function() {
	var result = "${result}";
	console.log("result :" + result);
	if(result == 'false') {
		alert("이름이나 이메일이 잘못 입력 되었습니다. 다시 확인해주세요.");
	}
});
</script>
<body class="loginBody">
<div class="container-fluid" style="margin-top: 100px; margin-bottom: 100px;">
	<div style="text-align: center; margin-bottom: 20px;"><h1>비밀번호 찾기</h1></div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/sgh/user/findPwRun" method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디"/>
				</div>
				<div>
					<button type="submit" class="btn btn-sm">
						확인
					</button>
					<a href="/sgh/user/loginForm" class="btn btn-sm" style="color:white;">취소</a> <!-- 이메일 보내기 -->
				</div>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>