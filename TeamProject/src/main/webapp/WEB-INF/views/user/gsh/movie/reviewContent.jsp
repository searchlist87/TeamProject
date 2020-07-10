<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>

<%@include file="/WEB-INF/views/include/header.jsp" %>

	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>

			<form name="review_content">
			
				<div class="form-group">
					<label for="exampleInputEmail1">리뷰 번호</label>
					<input type="text" class="form-control" readonly/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">제목</label>
					<input type="text" class="form-control" readonly/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">작성자	</label>
					<input type="text" class="form-control" readonly/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">내용</label>
					<textarea class="form-control" readonly></textarea>
				</div>
			
				<a href="" class="btn btn">리뷰 목록</a>
				<a href="" class="btn btn">수정</a>
				<a href="" class="btn btn">삭제</a>
			</form>
			
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>