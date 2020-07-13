<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>



<script>
<!-- 주소 창에서 주소 받을때 지정하기 -->
function jusoCallBack(roadFullAddr){
	$("#user_address").val(roadFullAddr);
}

$(function() {
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	// 아이디 중복 에이잭스 요청
	$("#btnIdDupCheck").click(function() {
		var user_id = $("#user_id").val();
		var url = "/sgh/user/userIdDupCheck";
		var sendData = {
			"user_id" : user_id	
		};
		
		$.get(url, sendData, function(rData) {
			if(rData == 'true') {
				// 사용 가능
				$("#idDupResult").text("사용 가능한 아이디 입니다.").css("color", "blue");
			} else {
				// 사용 불가능
				$("#idDupResult").text("사용 불가능한 아이디 입니다.").css("color", "red");
				$("#idDupCheckResult").text("false");
			}
		});
	});
	
	// 주소 검색 창 띄우기 popup는 webapp 아래에 위치함
	$("#addressSearch").click(function() {
		var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	});
	
	$("#btnSubmit").click(function() {
		$(".idSpan").remove();
		$(".nameSpan").remove();
		$(".pwSpan").remove();
		$(".emailSpan").remove();
		$(".phoneSpan").remove();
		$(".addressSpan").remove();
		
		// 사용할 span 만들기
		var span = $("#checkDiv").clone().removeAttr("style");
		span.css("color", "red");
		
		// 아이디 확인
		var result = $("#idDupCheckResult").text();
		var user_id = $("#user_id").val();
		if(user_id == null || user_id == "") {
			span.addClass("idSpan").text("아이디는 필수사항 입니다.");
			$("#user_id").focus();
			$("#user_id").after(span);
			return false;
		}
// 		아이디 사용이 불가능한데 회원가입을 눌렀을 경우
		if(result == 'false') {
			$("#user_id").focus();
			return false;
		}
		
		//비밀번호
		var pw = $("#user_pw").val();
		var pw2 = $("#user_pw2").val();
		// 비밀번호를 입력 안했을 경우
		if(pw == null || pw == "" || pw2 == null || pw2 == "") {
			span.addClass("pwSpan").text("비밀번호는 필수사항 입니다.");
			$("#user_pw").focus();
			$("#user_pw2").after(span);
			return false;
		}
// 		비밀번호와 비밀번호 확인이 같은지 체크
		if(pw != pw2) {
			span.addClass("pwSpan").text("비밀번호가 서로 다릅니다. 다시 확인해주세요.");
			$("#user_pw").focus();
			$("#user_pw2").after(span);
			return false;
		}
		// 이름 입력 됐는지 확인
		var name = $("#user_name").val();
		if(name == null || name == "") {
			span.addClass("nameSpan").text("이름은 필수사항 입니다.");
			$("#user_name").focus();
			$("#user_name").after(span);
			return false;
		}
		// 이메일 확인
		var email = $("#user_email").val();
		console.log("email : " + email);
		if(email == null || email == "") {
			span.addClass("emailSpan").text("이메일은 필수사항 입니다.");
			$("#user_email").focus();
			$("#user_email").after(span);
			return false;
		}
		// 전화번호 확인
		var user_phone = $("#user_phone").val();
		if(email == null || email == "") {
			span.addClass("phoneSpan").text("휴대전화는 필수사항 입니다.");
			$("#user_phone").focus();
			$("#user_phone").after(span);
			return false;
		}
		// 주소 확인
		var address = $("#user_address").val();
		if(address == null || address == "") {
			span.addClass("addressSpan").text("주소는 필수사항 입니다.");
			$("#user_address").focus();
			$("#user_address").after(span);
			return false;
		}
		// 생년월일 합쳐서 hidden에 담아 보내기
		var year = $("#user_year option:selected").val();
		var month = $("#user_month option:selected").val();
		var date = $("#user_date option:selected").val();
		var birth = year + month + date;
		$("#user_birth").val(birth);
		
		return false;
	});
});
</script>

<div id="checkDiv" style="visibility: hidden;"></div>
<div id="idDupCheckResult" style="visibility: hidden;"></div>

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
				<div class="form-group">
					<button type="button" id="btnIdDupCheck" class="btn-sm">중복 확인</button>
					<span id="idDupResult">아이디 중복 확인</span>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호"/>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="user_pw2" name="user_pw2" placeholder="비밀번호 재확인"/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름"/>
				</div>
				<div class="form-group">
					<label for="user_gender">
						성별
					</label><br/>
					<input type="radio" name="user_gender" value="M" checked>남자 
					<input type="radio" name="user_gender" value="F">여자
				</div>
				<div class="form-group">
					<input type="email" class="form-control" id="user_email" name="user_email" placeholder="이메일"/>
				</div>
				<div class="form-group">
				<div>
					<label>
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
					<button id="addressSearch" type="button">주소 검색</button>
				</div>
				<div class="form-group">
					<label for="user_sms_check">
						메일수신여부
					</label><br/>
					<input type="radio" name="user_sms_check" value="Y" checked/>수신
					<input type="radio" name="user_sms_check" value="N"/>수신안함
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