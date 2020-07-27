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
<script src="../../../include/bootstrap.jsp"></script>
<script>
$(function () {
	var mMsg = "${modifyMsg}";
	console.log(mMsg);
	
});

</script>
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body class="js">  
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
								<h3>회원 정보 관리</h3>
							</div>
							<form class="form" method="post" action="/mypage/modify">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="user_id">아이디<span>*</span></label>
											<input name="user_id" id="user_id" type="text" value="${mypageVo.user_id}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_pw">패스워드<span>*</span></label>
											<input name="user_pw" id="user_pw" type="text" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_name">이름<span>*</span></label>
											<input name="user_name" id="user_name" type="text" value="${mypageVo.user_name}" readonly>
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
											<input name="user_email" id="user_email" type="email" value="${mypageVo.user_email}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_birth">생년월일<span>*</span></label>
											<input name="user_birth" id="user_birth" type="text" value="${mypageVo.user_birth}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_phone">전화번호<span>*</span></label>
											<input name="user_phone" id="user_phone" type="text" value="${mypageVo.user_phone}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_address" style="margin-right:20px;">주소<span>*</span></label>
											<input name="user_address" id="user_address" type="text" value="${mypageVo.user_address}" readonly>
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
											
												<input type="checkbox" style="width:20px;height:20px;" 
												<c:if test="${mypageVo.user_sms_check == 'Y'}">
												checked
												</c:if>
												>
										</div>
									</div>
															
									<div class="col-12" style="margin-top:20px;">
										<div class="form-group button">
											<a href="/mypage/modify" class="btn" style="color:#fff;">회원 정보수정</a>
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