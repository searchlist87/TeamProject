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
	console.log("roadFullAddr : " + roadFullAddr);
	var address = $("#user_address").val();
	console.log("address :" + address);
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
	
	// 아이디 중복 에이잭스 요청
	$("#btnIdDupCheck").click(function() {
		var user_id = $("#user_id").val();
		var idLength = user_id.length;
		var url = "/sgh/user/userIdDupCheck";
		var sendData = {
			"user_id" : user_id	
		};
		
		$.get(url, sendData, function(rData) {
			// 아이디 글자수 체크
			for(var v = 0; v < idLength; v++) {
				var idCode = user_id.charCodeAt(v);
				if(v < 2) {
					if(!(97 <= idCode && idCode <= 122)) {
						$("#idDupResult").text("첫글자와 두번째 글자는 영어 소문자만 입력 가능합니다.").css("color", "red");
						$("#idDupCheckResult").text("false");
						return;
					}
				}
				
				if(!(97 <= idCode && idCode <= 122 || 48 <= idCode && idCode <= 57)) {
					$("#idDupResult").text("잘못된 문자를 입력 가능합니다. 영어 소문자, 숫자 외에 입력한 문자가 있는지 확인해주세요.").css("color", "red");
					$("#idDupCheckResult").text("false");
					return;
				}
			}
			
			if(rData == 'true' && 4 <= idLength && idLength <= 12) {
				// 사용 가능
				$("#idDupResult").text("사용 가능한 아이디 입니다.").css("color", "blue");
				$("#idDupCheckResult").text("true");
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
	
	// 메일 ajax 인증 요청하기
	$("#btnEmail").click(function() {
		var user_email = $("#user_email").val();
		var url = "/sgh/user/emailCheck";
		var sendData = {
				"user_email" : user_email
		}
		$.get(url, sendData, function(rData) {
			emailCheckNum = rData;
			$("#email_check").removeAttr("readonly");
		});
	});
	
	// 메일 인증 확인
	$("#btn_email_check").click(function() {
		var userCheckNum = $("#email_check").val();
		$(".emailCheck").remove();
		if(emailCheckNum == userCheckNum) {
			var span = "<div><span style='color:blue' class='emailCheck'>인증되었습니다.</span></div>";
			$("#email_check").after(span);
			$("#emailCheckResult").val("true");
		} else {
			var span = "<div><span style='color:red' class='emailCheck'>인증에 실패하였습니다.</span></div>";
			$("#email_check").after(span);
			$("#emailCheckResult").val("false");
		}
		var emailCheckResult = $("#emailCheckResult").val();
	});
	
	// 전송할 때 조건 체크하기
	$("#btnSubmit").click(function() {
		var address = $("#user_address").val();
		console.log("address :" + address);
		$(".idSpan").remove();
		$(".nameSpan").remove();
		$(".pwSpan").remove();
		$(".emailSpan").remove();
		$(".birthSpan").remove();
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
			span.addClass("idSpan").text("불가능한 아이디 입니다. 다시 한번 확인해주세요.");
			$("#user_id").focus();
			$("#user_id").after(span);
			return false;
		}
		
		//비밀번호
		var pw = $("#user_pw").val();
		var pw2 = $("#user_pw2").val();
		var pwLength = pw.length;
		console.log("pwLength :" + pwLength);
		if(!(8 <= pwLength && pwLength <= 15)) {
			span.addClass("pwSpan").text("비밀번호의 길이는 8에서 15글자 사이 입니다.");
			$("#user_pw").focus();
			$("#user_pw2").after(span);
			return false;
		}
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
		
		// 이름 확인
		var name = $("#user_name").val();
		var nameLength = name.length;
		if(!(nameLength <= 10)) {
			span.addClass("nameSpan").text("이름은 10글자 안까지만 가능합니다.");
			$("#user_name").focus();
			$("#user_name").after(span);
			return false;
		}
		if(name == null || name == "") {
			span.addClass("nameSpan").text("이름은 필수사항 입니다.");
			$("#user_name").focus();
			$("#user_name").after(span);
			return false;
		}
		
		// 이메일 확인
		var email = $("#user_email").val();
		if(email == null || email == "") {
			span.addClass("emailSpan").text("이메일은 필수사항 입니다.");
			$("#user_email").focus();
			$("#email_check").after(span);
			return false;
		}
		// 이메일 인증
		var emailCheckResult = $("#emailCheckResult").val();
		if(emailCheckResult != "true") {
			span.addClass("emailSpan").text("이메일은 인증이 안되었습니다. 인증을 하시고 시도해주세요.");
			$("#user_email").focus();
			$("#email_check").after(span);
			return false;
		}
		
		var user_birth = $("#user_birth").val();
		var birthLimit = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if(!birthLimit.test(user_birth)) {
			span.addClass("birthSpan").text("생년월일은 - 제외하고 숫자로만 8글자 입력 가능합니다.");
			$("#user_birth").focus();
			$("#user_birth").after(span);
			return false;
		}
		
		// 전화번호 확인
		var user_phone = $("#user_phone").val();
		var phone_limit = /^\d{3}\d{3,4}\d{4}$/;
		if(!phone_limit.test(user_phone)) {
			span.addClass("phoneSpan").text("휴대전화는 01012345678 형식 입니다.");
			$("#user_phone").focus();
			$("#user_phone").after(span);
			return false;
		}
		if(user_phone == null || user_phone == "") {
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
	});
});
</script>

<div id="checkDiv" style="visibility: hidden;"></div>
<div id="idDupCheckResult" style="visibility: hidden;"></div>
<div id="emailCheckResult" style="visibility: hidden;"></div>

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
				<div class="form-group">
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디"/>
					<button type="button" id="btnIdDupCheck" class="btn-sm">중복 확인</button>
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
					<input type="email" class="form-control" id="email_check" name="email_check" maxlength="40" placeholder="인증번호" readonly/>
					<button id="btn_email_check" type="button" class="btn-sm">인증코드 확인</button>
					<button id="btnEmail" type="button" class="btn-sm">메일 인증 보내기</button>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_birth" name="user_birth"  placeholder="태어난 년도 ex : 19900101">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="전화번호"/>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_address" name="user_address" placeholder="주소" readonly/>
					<button id="addressSearch" type="button" class="btn-sm">주소 검색</button>
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