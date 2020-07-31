<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>

<style>
	button {
		background: orange;
		color: white;
	}
	strong {
		color: red;
	}
</style>

<script>
<!-- 주소 창에서 주소 받을때 지정하기 -->
function jusoCallBack(roadFullAddr){
	$("#user_address").val(roadFullAddr);
	var address = $("#user_address").val();
}

$(function() {
	
	var result = "${result}";
	var emailCheckNum;
	if(result == 'false') {
		alret("회원가입에 실패하셨습니다. 다시 확인해주세요.");
	}
	
	// 템플릿에서 나오는 select 막기
	$("select").css("display", "block");
	$(".nice-select").remove();
	
	// 아이디 포커스 벗어날때 이벤트 확인
	$("#user_id").blur(function() {
		$(".id_clone").remove();
		var user_id = $(this).val();
		var resultMessage = $("#resultMessage").clone().addClass("id_clone");
		
		// 아이디 조건 체크
		var id_rgx = /^[a-z0-9]{5,14}/;
		if(!id_rgx.test(user_id)) {
			var message = "아이디는 5~14자, 영어 소문자와 숫자로만 구성해주세요.";
			resultMessage.find("strong").text(message);
			$(this).after(resultMessage);
			$("#id_result").val("false");
			return false;
		}
		
		var url = "/sgh/user/userIdDupCheck";
		var sendData = {
				"user_id" : user_id
		};
		// 에이잭스로 아이디 중복 체크 요청
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if(rData == "true") {
				var message = "사용 가능한 계정 입니다.";
				resultMessage.find("strong").text(message).css("color", "blue");
				$("#user_id").after(resultMessage);
				$("#id_result").val("true");
				return false;
			}
			var message = "이미 존재하거나 탈퇴한 계정 입니다.";
			resultMessage.find("strong").text(message);
			$("#user_id").after(resultMessage);
			$("#id_result").val("false");
			return false;
		});
	});
	
	// 첫번째 비밀번호 체크
	$("#user_pw").blur(function() {
		$(".pw_clone").remove();
		var user_pw = $(this).val();
		var resultMessage = $("#resultMessage").clone().addClass("pw_clone");
		
		// 비밀번호 조건 체크
		var pw_rgx = /^[a-z0-9]{6,20}$/;
		if(!pw_rgx.test(user_pw)) {
			var message = "비밀번호는 6~20자 영어 소문자와 숫자로만 이루어져야합니다.";
			resultMessage.find("strong").text(message);
			$("#user_pw2").after(resultMessage);
			$("#pw_result").val("false");
			return false;
		}
	});
	
	// 비밀번호 재확인
	$("#user_pw2").blur(function() {
		$(".pw_clone").remove();
		var user_pw = $("#user_pw").val();
		var user_pw2 = $(this).val();
		var resultMessage = $("#resultMessage").clone().addClass("pw_clone");
		
		if(user_pw == "" || user_pw == null || user_pw2 == "" || user_pw2 == null) {
			var message = "비밀번호를 입력해주세요.";
			resultMessage.find("strong").text(message);
			$(this).after(resultMessage);
			$("#pw_result").val("false");
			return;
		}
		
		if(user_pw != user_pw2) {
			var message = "비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
			resultMessage.find("strong").text(message);
			$(this).after(resultMessage);
			$("#pw_result").val("false");
			return;
		}
		
		var message = "사용 가능한 비밀번호 입니다.";
		resultMessage.find("strong").text(message).css("color", "blue");
		$(this).after(resultMessage);
		$("#pw_result").val("true");
	});
	
	// 이름 확인
	$("#user_name").blur(function() {
		$(".name_clone").remove();
		var user_name = $(this).val();
		var resultMessage = $("#resultMessage").clone().addClass("name_clone");
		
		var name_rgx = /^[가-힣a-zA-Z]{1,20}$/;
		if(!name_rgx.test(user_name)) {
			var message = "이름은 1~20자 한글과 영문자만 가능합니다.";
			resultMessage.find("strong").text(message);
			$(this).after(resultMessage);
			$("#name_result").val("false");
			return false;
		}
		var message = "사용 가능한 이름 입니다.";
		resultMessage.find("strong").text(message).css("color", "blue");
		$(this).after(resultMessage);
		$("#name_result").val("true");
	});
	
	
	// 주소 검색 창 띄우기 popup는 webapp 아래에 위치함
	$("#addressSearch").click(function() {
		var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	});
	
	// 메일 ajax 인증 요청하기
	$("#btnEmail").click(function() {
		$(".send_email_clone").remove();
		var user_email = $("#user_email").val();
		var url = "/sgh/user/emailCheck";
		var sendData = {
				"user_email" : user_email
		}
		$.get(url, sendData, function(rData) {
			emailCheckNum = rData;
			$("#email_check").removeAttr("readonly");
			var resultMessage = $("#resultMessage").clone().addClass("send_email_clone");
			var message = "이메일이 성공적으로 보내졌습니다. 확인해주세요.";
			resultMessage.find("strong").text(message).css("color", "green");
			$("#email_check").after(resultMessage);
		});
	});
	
	// 메일 인증 확인
	$("#btn_email_check").click(function() {
		$(".send_email_clone").remove();
		$(".emailCheck").remove();
		var userCheckNum = $("#email_check").val();
		if(emailCheckNum == userCheckNum) {
			var resultMessage = $("#resultMessage").clone().addClass("send_email_clone");
			var message = "인증되었습니다.";
			resultMessage.find("strong").text(message).css("color", "blue");
			$("#email_check").after(resultMessage);
			$("#email_result").val("true");
		} else {
			var resultMessage = $("#resultMessage").clone().addClass("send_email_clone");
			var message = "이메일이 인증에 실패하였습니다. 다시 확인해주세요.";
			resultMessage.find("strong").text(message).css("color", "red");
			$("#email_check").after(resultMessage);
			$("#email_result").val("false");
		}
	});
	
	// 생년 월일 체크
	$("#yy").blur(function() {
		$(".birth_clone").remove();
		var yy = $(this).val();
		var yy_rgx = /^[0-9]{1,4}$/;
		var resultMessage = $("#resultMessage").clone().addClass("birth_clone");
		
		if(!yy_rgx.test(yy)) {
			var message = "태어난 년도는 4자 숫자만 가능합니다.";
			resultMessage.find("strong").text(message);
			$("#dd").after(resultMessage);
			$("#yy_result").val("false");
			return false;
		}
		var message = "생년월일을 빈칸 없이 입력해주세요.";
		resultMessage.find("strong").text(message);
		$("#dd").after(resultMessage);
		$("#yy_result").val("true");
		
		var yy_result = $("#yy_result").val();
		var mm_result = $("#mm_result").val();
		var dd_result = $("#dd_result").val();
		
		if(yy_result == "true" && mm_result == "true" && dd_result == "true") {
			$(".birth_clone").remove();
			var message = "확인되었습니다.";
			resultMessage.find("strong").text(message).css("color", "blue");
			$("#birth").after(resultMessage);
			$("#birth_result").val("true");
			return false;
		}
		$("#birth_result").val("false");
	});
	
	// 월 체크
	$("#mm").change(function() {
		$(".birth_clone").remove();
		var mm = $("#mm option:selected").val();
		var resultMessage = $("#resultMessage").clone().addClass("birth_clone");
		if(mm == 'not') {
			var message = "태어난 일을 선택해주세요.";
			resultMessage.find("strong").text(message);
			$("#dd").after(resultMessage);
			$("#mm_result").val("false");
			return false;
		}
		var message = "생년월일을 빈칸 없이 입력해주세요.";
		resultMessage.find("strong").text(message);
		$("#dd").after(resultMessage);
		$("#mm_result").val("true");
		
		var yy_result = $("#yy_result").val();
		var mm_result = $("#mm_result").val();
		var dd_result = $("#dd_result").val();
		
		if(yy_result == "true" && mm_result == "true" && dd_result == "true") {
			$(".birth_clone").remove();
			var message = "확인되었습니다.";
			resultMessage.find("strong").text(message).css("color", "blue");
			$("#birth").after(resultMessage);
			$("#birth_result").val("true");
			return false;
		}
		$("#birth_result").val("false");
	});
	
	// 일 체크
	$("#dd").blur(function() {
		$(".birth_clone").remove();
		var dd = $(this).val();
		var dd_rgx = /^[0-9]{2,2}$/;
		var resultMessage = $("#resultMessage").clone().addClass("birth_clone");
		if(!dd_rgx.test(dd)) {
			var message = "태어난 일은 2자 숫자로만 입력 가능합니다.";
			resultMessage.find("strong").text(message);
			$(this).after(resultMessage);
			$("#dd_result").val("false");
			return false;
		}
		var message = "생년월일을 빈칸 없이 입력해주세요.";
		resultMessage.find("strong").text(message);
		$(this).after(resultMessage);
		$("#dd_result").val("true");
		
		var yy_result = $("#yy_result").val();
		var mm_result = $("#mm_result").val();
		var dd_result = $("#dd_result").val();
		
		if(yy_result == "true" && mm_result == "true" && dd_result == "true") {
			$(".birth_clone").remove();
			var message = "확인되었습니다.";
			resultMessage.find("strong").text(message).css("color", "blue");
			$("#birth").after(resultMessage);
			$("#birth_result").val("true");
			return false;
		}
		$("#birth_result").val("false");
	});
	
	// 휴대전화
	$("#user_phone").blur(function() {
		$(".phone_clone").remove();
		var phone_number = $(this).val();
		var phone_rgx  = /^\d{3}\d{3,4}\d{4}$/;
		var resultMessage = $("#resultMessage").clone().addClass("phone_clone");
		if(!phone_rgx.test(phone_number)) {
			var message = "양식에 맞춰 전화번호를 입력해주세요.";
			resultMessage.find("strong").text(message);
			$(this).after(resultMessage);
			$("#phone_result").val("false");
			return false;
		}
		var message = "확인되었습니다.";
		resultMessage.find("strong").text(message).css("color", "blue");
		$(this).after(resultMessage);
		$("#phone_result").val("true");
	});
	
	// 회원가입 전송이 될 때
	$("#joinForm").submit(function() {
		var user_address = $("#user_address").val();
		var address_length = user_address.length;
		if(address_length != 0) {
			$("#address_result").val("true");
		} else {
			$("#address_result").val("false");
		}
		
		var yy = $("#yy").val();
		var mm = $("#mm option:selected").val();
		var dd = $("#dd").val();
		var yymmdd = yy + mm + dd;
		$("#user_birth").val(yymmdd);
		
		var id_result = $("#id_result").val();
		var pw_result = $("#pw_result").val();
		var name_result = $("#name_result").val();
		var email_result = $("#email_result").val();
		var birth_result = $("#birth_result").val();
		var address_result = $("#address_result").val();
		var phone_result = $("#phone_result").val();
		
		if(id_result != 'true' || pw_result != 'true' || name_result != 'true' || email_result != 'true' ||
		   birth_result != 'true' || address_result != 'true'|| phone_result != 'true') {
			window.alert("잘못된 항목이 있습니다. 다시 확인해주세요.");
			return false;
		}
	});
	
	$("#btnCancle").click(function() {
		location.href="/sgh/user/loginForm";
	});
});
</script>
<input type="hidden" id="id_result">
<input type="hidden" id="pw_result">
<input type="hidden" id="name_result">
<input type="hidden" id="email_result">
<input type="hidden" id="yy_result">
<input type="hidden" id="mm_result">
<input type="hidden" id="dd_result">
<input type="hidden" id="birth_result">
<input type="hidden" id="address_result">
<input type="hidden" id="phone_result">
<div id="resultMessage"><span><strong></strong></span></div>
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
					<span id="idDupResult"></span>
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
					<input type="email" class="form-control" id="user_email" name="user_email" maxlength="40" placeholder="이메일"/>
					<input type="text" class="form-control" id="email_check" name="email_check" maxlength="40" placeholder="인증번호" readonly/>
					<button id="btn_email_check" type="button" class="btn-sm btn_orange">인증코드 확인</button>
					<button id="btnEmail" type="button" class="btn-sm btn_orange">메일 인증 보내기</button>
				</div>
				<div class="form-group">
					<label for="yy_birthday">생년월일<br/></label>
					<div id="birth">
						<input type="text" id="yy" placeholder="년(4자)" style="float: left;">
						<select id="mm" style="float: left; height: 32px;">
							<option value="not" selected>월</option>
							<c:forEach begin="1" end="12" var="mm">
								<option value="<c:if test="${mm < 10}">0</c:if>${mm}">${mm}월</option>
							</c:forEach>
						</select>
						<input type="text" id="dd" placeholder="일 ex:02, 11">
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="01012345678 식으로 작성해주세요."/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_address" name="user_address" placeholder="주소" readonly/>
					<button id="addressSearch" type="button" class="btn-sm btn_orange">주소 검색</button>
				</div>
				<div class="form-group">
					<label for="user_sms_check">
						메일수신여부
					</label><br/>
					<input type="radio" name="user_sms_check" value="Y" checked/>수신
					<input type="radio" name="user_sms_check" value="N"/>수신안함
				</div>
				<div style="margin-bottom: 30px;">
					<button id="btnSubmit" type="submit" class="btn-lg btn_black">
						회원가입
					</button>
					<button id="btnCancle" type="button" class="btn-lg btn_black">
						취소
					</button>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		
		</div>
	</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>