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
<script>
$(function () {
	
	var modifyIndex = 0;
	$("#modifyBtn").click(function (e) {
		e.preventDefault();
		console.log(modifyIndex);
		if (modifyIndex == 0) {
			alert("수정할 내용을 입력 후 수정버튼을 클릭해주세요.");
			$("#board_title").removeAttr("readonly");
			$("#board_content").removeAttr("readonly");
			modifyIndex = 1;
		} else if (modifyIndex == 1) {
			// null 값 체크
			var board_title = $("#board_title").val();
			var board_content = $("#board_content").text();
			if (board_title == null || board_title == "") {
				alert("제목을 입력해주세요.");
				$("#board_title").focus();
				return;
			}
			if (board_content == null || board_content == "") {
				alert("내용을 입력해주세요.");
				$("#board_content").focus();
				return;
			}
			
			$("#modifyForm").submit();
		}
		
		
		
	});
});
</script>
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
							<form class="form" method="post" action="/mypage/modifyQuestion" id="modifyForm">
								<input type="hidden" name="board_code" value="${jmhBoardVo.board_code}"/>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="board_title">제목<span>*</span></label>
											<input name="board_title" id="board_title" type="text" readonly value="${jmhBoardVo.board_title}">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="board_content">내용<span>*</span></label>
											<textarea cols="10" name="board_content" id="board_content" readonly>${jmhBoardVo.board_content}</textarea>
										</div>
									</div>
									<!-- ------- 답변 보이기 ---------------->
									<c:if test="${jmhReplyVo != null}">
									<div class="col-12">
										<div class="form-group">
											<label for="reply_content">답변<span>*</span></label>
											<span style="margin-left:50px;">${jmhReplyVo.reply_date}</span>
											<textarea cols="10" name="reply_content" id="reply_content" readonly>${jmhReplyVo.reply_content}</textarea>
										</div>
									</div>
									</c:if>
									<!-- ------- 답변 보이기 end ---------------->
									<div class="col-12" style="margin-top:20px;">
										<div class="form-group button">
											<button type="button" class="btn" style="color:#fff;" id="modifyBtn">수정</button>
											<a href="/mypage/deleteQuestion?board_code=${jmhBoardVo.board_code}" class="btn" style="color:#fff;">삭제</a>
											<a href="/mypage/questionList" class="btn" style="color:#fff;">목록</a>
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