<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<!--  admin.js -->
	<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
.fileLabel {
		width:80px;
		height:30px;
		border:1px solid #767676;
		border-top-right-radius:3px;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
		border-bottom-right-radius:3px;
		text-align:center;
		background-color:#efefef;
		padding-top:2px;
	}
</style>
<script>
$(function () {
	$("#board_manage > dd").css("display","block");
	$("#board_manage > dt").css("color","red");
	$("#board_manage > dd").eq(4).css("color","blue");
	
	// 답변 등록
	$("#replyRegisterBtn").click(function (e) {
		e.preventDefault();
		
		var url = $(this).attr("href");
		$("#registForm").submit();
	});
	
	// 답변 수정
	$("#replyModifyBtn").click(function (e) {
		e.preventDefault();
		
		var url = $(this).attr("href");
		$("#registForm").attr("action", url);
		$("#registForm").submit();
	});
	
});

</script>
<body class="js">
<!-- 해더 부분 -->
<%@include file="../include/admin_header.jsp" %>
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;margin-bottom:20px;">
									<h4 class="title" >1:1 문의 관리_ 문의 조회</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_registerReply" method="post" id="registForm">
								<input type="hidden" name="board_code" value="${jmhBoardVo.board_code}" />
									<div class="form-group">
										<label for="user_id"><strong>아이디</strong></label>
										<input type=text class="form-control" id="user_id" name="user_id" value="${jmhBoardVo.user_id}" readonly/>
									</div>
									<div class="form-group">
										<label for="board_title"><strong>제목</strong></label>
										<input type=text class="form-control" id="board_title" name="board_title" value="${jmhBoardVo.board_title}" readonly/>
									</div>
									<div class="form-group">
										<label for="board_content"><strong>내용</strong></label>
										<textarea rows="5" id="board_content" name="board_content" readonly>${jmhBoardVo.board_content}</textarea>
									</div>
									<div class="form-group">
										<label for="board_date"><strong>문의 등록일</strong></label>
										<input type="text" class="form-control" id="board_date" name="board_date" value="${jmhBoardVo.board_date}" readonly/>
									</div>
									<div class="form-group">
										<label for="reply_content"><strong>답변</strong></label>
										<textarea rows="5" id="reply_content" name="reply_content">${jmhReplyVo.reply_content}</textarea>
										<span>답변 등록일 : ${jmhReplyVo.reply_date}</span>
									</div>
									<c:if test="${jmhReplyVo == null}">
										<a href="/admin/admin_registerReply" role="button" class="btn" style="color:#fff;" id="replyRegisterBtn">등록</a>
									</c:if>
									<c:if test="${jmhReplyVo != null}">
										<a href="/admin/admin_modifyReply" role="button" class="btn" style="color:#fff;" id="replyModifyBtn">수정</a>
									</c:if>
									<a href="/admin/admin_questionList" role="button" class="btn" style="color:#fff;">목록</a>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>