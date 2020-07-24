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
<%@include file="../../../include/bootstrap.jsp" %>
<script>
$(function () {
	
	$("#secessionBtn").click(function (e) {
		e.preventDefault();
		var result = confirm('탈퇴하시면 정보를 되돌릴 수 없습니다. 탈퇴하시겠습니까?');

		if(result == true) {
			var url = $(this).attr("href");
			console.log(url); 
			location.href = url;
		} else {
			return false;
		}
		
	});
	
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
						<div class="form-main" style="height:500px;">
							<div class="title">
								<h4>My 정보관리</h4>
								<h3>회원 탈퇴</h3>
							</div>
							<form class="form" method="post" action="/mypage/modify">
								<div class="row">
									
									<div class="col-12">
										<div class="form-group">
										<span style="color:red;">탈퇴하시면 개인 정보를 복구 할 수 없습니다.</span></br>
										<span> 탈퇴하시겠습니까?</span>
										</div>
									</div>
									<div class="col-12" style="margin-top:20px;">
										<div class="form-group button">
											<a href="/mypage/secessionPost" class="btn" style="color:#fff;" id="secessionBtn">회원 탈퇴</a>
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