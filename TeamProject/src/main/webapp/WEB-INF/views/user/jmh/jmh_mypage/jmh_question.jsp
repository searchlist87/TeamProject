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
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
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
								<h4>1:1 문의</h4>
								<h3>1:1 문의하기</h3>
							</div>
							<form class="form" method="post" action="/mypage/registerQuestion">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="board_title">제목<span>*</span></label>
											<input name="board_title" id="board_title" type="text" required>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="board_content">내용<span>*</span></label>
											<textarea cols="10" name="board_content" required></textarea>
										</div>
									</div>
									<div class="col-12" style="margin-top:20px;">
										<div class="form-group button">
											<button type="submit" class="btn" style="color:#fff;">등록</button>
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