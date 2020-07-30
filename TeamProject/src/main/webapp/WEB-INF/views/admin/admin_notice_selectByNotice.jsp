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
.movie_grade {
	margin-left:20px;
}

.movie_grade_span {
	margin-left:10px;
}

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
	$("#board_manage > dd").eq(1).css("color","blue");
	
	//수정처리 완료 확인
	var mMsg = "${mMsg}";
	if(mMsg == "success") {
		alert("수정되었습니다.");
	}
		
	// 목록
	$("#btnList").click(function () {
		location.href="/admin/admin_notice_list";
	}); 
	
	// 삭제
	$("#btnDelete").click(function () {
		var board_code = "${jmhNoticeVo.board_code}";
		location.href="/admin/admin_notice_delete?board_code="+ board_code;
	});
	
	// 수정 버튼
	var index = 0;
	$("#btnModify").click(function (e) {
		e.preventDefault();
		if(index == 0) {
			alert("수정할 내용을 확인 후 수정하기 버튼을 클릭해주세요.");
			$("#btnModify").text("수정완료");
			$("#board_title").removeAttr("readonly");
			$("#board_content").removeAttr("readonly");
			index = 1;
		} else if(index == 1) {
			
			// title, content null 값 체크
			var board_title = $("#board_title").val();
			var board_content = $("#board_content").val();
			if(board_title == null || board_title == "") {
				$(".span1").remove();
				html = "<span style='color:red;' class='span1'>값을 입력해주세요.</span>"
				$("#titleDiv").append(html);
				return false;
			} else {
				$(".span1").remove();
			}
			
			if(board_content == null || board_content == "") {
				$(".span2").remove();
				html = "<span style='color:red;' class='span2'>값을 입력해주세요.</span>"
				$("#contentDiv").append(html);
				return false;
			} else {
				$(".span2").remove();
			}
			
			// 체크박스 체크
			var checked = $("input:checkbox[name=notice_checkbox]").is(":checked");
			if(checked == false) {
				$("#notice_check").val("N");
			} else if(checked == true) {
				$("#notice_check").val("Y");
			}
			$("#modifyForm").submit();
		}
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
									<h4 class="title" >게시판관리_공지사항 상세페이지</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_notice_modify" method="post" id="modifyForm">
								<input type="hidden" name="notice_check" id="notice_check"/>
								<input type="hidden" name="board_code" id="board_code" value="${jmhNoticeVo.board_code}"/>
									<div class="form-group" id="titleDiv">
										<label for="board_title"><strong>공지사항 주제</strong></label>
										<input type=text class="form-control" id="board_title" name="board_title" value="${jmhNoticeVo.board_title}" readonly/>
									</div>
									<div class="form-group" id="contentDiv">
										<label for="board_content"><strong>공지사항 내용</strong></label>
										<textarea rows="5" id="board_content" name="board_content" readonly>${jmhNoticeVo.board_content}</textarea>
									</div>
									<div class="form-group">
										<label for="notice_check" style="margin-bottom:5px;"><strong>필수공지 여부</strong></label>
										<input type="checkbox" style="width:20px;height:20px;" name="notice_checkbox"
												<c:if test="${jmhNoticeVo.notice_check == 'Y'}">
												checked
												</c:if>
												>
									</div>
									<button type="submit" class="btn btn-primary" id="btnModify">수정</button>
									<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
									<button type="button" class="btn btn-primary" id="btnList">목록</button>
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