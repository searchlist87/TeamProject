<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>


<script>
$(function() {
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	$("#joinForm").submit(function() {
		var year = $("#user_year option:selected").val();
		var month = $("#user_month option:selected").val();
		var date = $("#user_date option:selected").val();
		var birth = year + month + date;
		$("#user_birth").val(birth);
	});
});
</script>

<body class="loginBody">
<div class="container-fluid">
	<div style="margin-top: 50px; margin-bottom: 50px;">
		<h1 style="text-align: center;">회원가입</h1>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form id="joinForm" role="form" action="/sgh/user/joinRun" method="post">
				<input type="hidden" id="user_birth" name="user_birth">
				<div class="form-group">
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디"/>
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<button type="button" id="idDupCheck" class="btn-sm">중복 확인</button> -->
<!-- 					<span id="idDupResult">아이디 중복 확인</span> -->
<!-- 				</div> -->
				<div class="form-group">
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호"/>
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<input type="password" class="form-control" id="user_pw2" name="user_pw2" placeholder="비밀번호 재확인"/> -->
<!-- 				</div> -->
				<div class="form-group">
					<input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름"/>
				</div>
				<div class="form-group">
					<label for="user_gender">
						성별
					</label><br/>
					<input type="radio" name="user_gender" value="M">남자 
					<input type="radio" name="user_gender" value="F">여자
				</div>
				<div class="form-group">
					<input type="email" class="form-control" id="user_email" name="user_email" placeholder="이메일"/>
				</div>
				<div class="form-group">
				<div>
					<label for="user_birth">
						생일
					</label>
					</div>
					<select style="float: left;" id="user_year">
						<c:forEach begin="1900" end="2020" var="year">
							<option value="${year}">${year}년</option>
						</c:forEach>
					</select>
					<select style="float: left;" id="user_month">
						<c:forEach begin="1" end="12" var="month">
							<option value="${month}">${month}월</option>
						</c:forEach>
					</select>
					<select style="float: left;" id="user_date">
						<c:forEach begin="1" end="31" var="date">
							<option value="${date}">${date}일</option>
						</c:forEach>
					</select>
					<br/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="전화번호"/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_address" name="user_address" placeholder="주소"/>
				</div>
				<div class="form-group">
					<label for="user_sms_check">
						메일수신여부
					</label><br/>
					<input type="radio" id="user_sms_check" name="user_sms_check" value="Y"/>수신
					<input type="radio" id="user_sms_check" name="user_sms_check" value="N"/>수신안함
				</div>
				<div style="margin-bottom: 30px;">
					<button id="btnSubmit" type="submit" class="btn btn-sm">
						회원가입
					</button>
					<a href="/sgh/user/loginForm" class="btn btn-sm" style="color: white;">취소</a>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		
		</div>
	</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>