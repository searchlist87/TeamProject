<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<script>
$(function () {
	var msg = "${msg}"
	if (msg == "success") {
		alert("리뷰 삭제 성공")
	}
	
	// 리뷰 삭제 버튼
	$("#btnDelete").click(function() {
		
	});
	
});
</script>

	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>


		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form name="review_content">
			
				<div class="form-group">
					<label for="exampleInputEmail1">작성자	</label>
					<input type="text" class="form-control" readonly/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">내용</label>
					<textarea class="form-control" readonly></textarea>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">평점</label>
					<input type="text" class="form-control" readonly/>
				</div>
			
				<a href="/gsh/movie/reviewList" class="btn btn">리뷰 목록</a>
				<a href="/gsh/movie/review_modify_form" class="btn btn">수정</a>
				<a href="/gsh/movie/reviewList" class="btn btn" id="btnDeleteReview">삭제</a>
			</form>
			</div>
</div>	
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>