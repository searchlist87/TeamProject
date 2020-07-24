<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style>
.subul {
	padding-left : 30px;
	margin-top : 10px;
	font-size : 15px;
	border : 1px dotted #ccc;
}
</style>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.0.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script>
<!-- 주소 창에서 주소 받을때 지정하기 -->
function jusoCallBack(roadFullAddr){
	$("#user_address").val(roadFullAddr);
	var address = $("#user_address").val();
}


$(function() {
	
	
	// 수정 버튼
	$("#modifyBtn").click(function () {
		
		// 사용할 span 만들기
		var span = $("#checkDiv").clone().removeAttr("style");
		span.css("color", "red");
		
		//비밀번호
		var pw = $("#user_pw").val();
		var pw2 = $("#user_pw1").val();
		
		
		// 비밀번호를 입력 안했을 경우
		if(pw == null || pw == "") {
			$(".pwSpan").remove();
			span.addClass("pwSpan").text("비밀번호는 필수사항 입니다.");
			$("#user_pw").focus();
			$("#user_pw").after(span);
			return false;
		}
		$(".pwSpan").remove();
		if(pw2 == null || pw2 == "") {
			$(".pwSpan1").remove();
			span.addClass("pwSpan1").text("비밀번호 확인은 필수사항 입니다.");
			$("#user_pw1").focus();
			$("#user_pw1").after(span);
			return false;
		}
		$(".pwSpan1").remove();
		
		var pwLength = pw.length;
		if(!(8 <= pwLength && pwLength <= 15)) {
			$(".pwSpan2").remove();
			span.addClass("pwSpan2").text("비밀번호의 길이는 8에서 15글자 사이 입니다.");
			$("#user_pw").focus();
			$("#user_pw").after(span);
			return false;
		}
		$(".pwSpan2").remove();
		
// 		비밀번호와 비밀번호 확인이 같은지 체크
		if(pw != pw2) {
			span.addClass("pwSpan3").text("비밀번호가 서로 다릅니다. 다시 확인해주세요.");
			$("#user_pw").focus();
			$("#user_pw1").after(span);
			return false;
		}
		$(".pwSpan3").remove();
		
		// 이름 확인
		var name = $("#user_name").val();
		var nameLength = name.length;
		if(!(nameLength <= 10)) {
			span.addClass("nameSpan").text("이름은 10글자 안까지만 가능합니다.");
			$("#user_name").focus();
			$("#user_name").after(span);
			return false;
		}
		$(".nameSpan").remove();
		if(name == null || name == "") {
			span.addClass("nameSpan").text("이름은 필수사항 입니다.");
			$("#user_name").focus();
			$("#user_name").after(span);
			return false;
		}
		$(".nameSpan").remove();
		
		// 이메일 확인
		var email = $("#user_email").val();
		if(email == null || email == "") {
			span.addClass("emailSpan").text("이메일은 필수사항 입니다.");
			$("#user_email").focus();
			$("#user_email").after(span);
			return false;
		}
		$(".emailSpan").remove();
		
		var user_birth = $("#user_birth").val();
		var birthLimit = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if(!birthLimit.test(user_birth)) {
			$(".birthSpan").remove();
			span.addClass("birthSpan").text("생년월일은 - 제외하고 숫자로만 8글자 입력 가능합니다.");
			$("#user_birth").focus();
			$("#user_birth").after(span);
			return false;
		}
		$(".birthSpan").remove();
		// 전화번호 확인
		var user_phone = $("#user_phone").val();
		var phone_limit = /^\d{3}\d{3,4}\d{4}$/;
		if(!phone_limit.test(user_phone)) {
			$(".phoneSpan").remove();
			span.addClass("phoneSpan").text("휴대전화는 01012345678 형식 입니다.");
			$("#user_phone").focus();
			$("#user_phone").after(span);
			return false;
		}
		$(".phoneSpan").remove();
		if(user_phone == null || user_phone == "") {
			$(".phoneSpan").remove();
			span.addClass("phoneSpan").text("휴대전화는 필수사항 입니다.");
			$("#user_phone").focus();
			$("#user_phone").after(span);
			return false;
		}
		$(".phoneSpan").remove();
		// 주소 확인
		var address = $("#user_address").val();
		if(address == null || address == "") {
			$(".addressSpan").remove();
			span.addClass("addressSpan").text("주소는 필수사항 입니다.");
			$("#user_address").focus();
			$("#user_address").after(span);
			return false;
		}
		$(".addressSpan").remove();
		
		var checked = $("input:checkbox[name=sms_checkBox]").is(":checked");
		if(checked == false) {
			$("#user_sms_check").val("N");
		} else if(checked == true) {
			$("#user_sms_check").val("Y");
		}
		$("#modifyForm").submit();
	});
	
	// 주소 검색 창 띄우기 popup는 webapp 아래에 위치함
	$("#addressSearch").click(function() {
		var pop = window.open("/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	});
	
});
</script>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body class="js">  
<div id="checkDiv" style="visibility: hidden;"></div>
<div class="container" style="left:100px;margin-top:100px;">
		<h2>My page_마이페이지</h2>
</div>
<!-- Start Contact -->
<section id="contact-us" class="contact-us section" style="padding:50px;">
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="../include/mypage_side_menu.jsp"%>
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
								<h4>My 정보관리</h4>
								<h3>회원 정보 수정</h3>
							</div>
							<form class="form" method="post" action="/mypage/modify" id="modifyForm">
								<input type="hidden" name="user_sms_check" id="user_sms_check"/>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="user_id">아이디(변경불가)<span>*</span></label>
											<input name="user_id" id="user_id" type="text" value="${mypageVo.user_id}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_pw">비밀번호<span>*</span></label>
											<input name="user_pw" id="user_pw" type="password" required placeholder="8~15자리 입력해주세요.">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_pw1">비밀번호 확인<span>*</span></label>
											<input name="user_pw1" id="user_pw1" type="password" required placeholder="8~15자리 입력해주세요.">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_name">이름<span>*</span></label>
											<input name="user_name" id="user_name" type="text" value="${mypageVo.user_name}" required>
										</div>
									</div>
									<div class="col-12">
										<div>
											<label for="user_gender" style="padding-right:5px;">성별<span style="color:#ff2c18;">* </span></label>
											
											<input name="user_gender" type="radio" value="M"
											<c:if test="${mypageVo.user_gender == 'M'}">checked</c:if>
											>남
											<input name="user_gender" type="radio" value="F"
											<c:if test="${mypageVo.user_gender == 'F'}">checked</c:if>
											>여
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_email">이메일<span>*</span></label>
											<input name="user_email" id="user_email" type="email" value="${mypageVo.user_email}" required>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_birth">생년월일<span>*</span></label>
											<input name="user_birth" id="user_birth" type="text" value="${mypageVo.user_birth}" required placeholder="ex>19861212">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_phone">전화번호<span>*</span></label>
											<input name="user_phone" id="user_phone" type="text" value="${mypageVo.user_phone}" required placeholder="ex>01012345678">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_address" style="margin-right:20px;">주소<span>*</span></label>
											<button type="button" id="addressSearch" class="btn-success">주소검색 </button>
											<input name="user_address" id="user_address" type="text" value="${mypageVo.user_address}" required>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_total_money">총 사용금액<span>*</span></label>
											<input name="user_total_money" id="user_total_money" type="text" value="${mypageVo.user_total_money}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_point">포인트<span>*</span></label>
											<input name="user_point" id="user_point" type="text" value="${mypageVo.user_point}" readonly>
										</div>
									</div>
									
									<div class="col-12">
										<div>
											<label for="user_sms_check" style="margin-bottom:5px;">SMS 수신여부<span style="color:#ff2c18;">*</span></label>
											
												<input type="checkbox" style="width:20px;height:20px;" name="sms_checkBox" id="sms_checkBox"
												<c:if test="${mypageVo.user_sms_check == 'Y'}">
												value="Y" checked
												</c:if>
												>
												
										</div>
									</div>
															
									<div class="col-12" style="margin-top:20px;">
										<div class="form-group button">
											<button type="button" class="btn" id="modifyBtn">수정하기</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
</section>
<!--/ End Contact -->
<%@ include file="../../../include/footer.jsp"%>
</body>
</html>