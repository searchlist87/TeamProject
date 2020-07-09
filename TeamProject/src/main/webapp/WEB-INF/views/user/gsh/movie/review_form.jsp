<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		　
			<h3>리뷰를 작성 해주세요.</h3>
			　
			<form role="form">
			
				<div class="form-group">
					<label for="exampleInputEmail1">제목</label>
					<input type="email" class="form-control" id="exampleInputEmail1" required/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">내용</label>
					<textarea class="form-control" id="exampleInputPassword1" required></textarea>
				</div>
				
				<div class="form-group">
					<label for="exampleInputFile">첨부할 파일</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
				</div>
				
				<a href="" class="btn btn">리뷰 작성</a>
				
			</form>
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>		

<%@ include file="/WEB-INF/views/include/footer.jsp" %>