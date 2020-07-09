<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>

<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						Email address
					</label>
					<input type="email" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						Password
					</label>
					<input type="password" class="form-control" id="exampleInputPassword1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">
						File input
					</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div>
				<button type="submit" class="btn btn-primary">작성 완료</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>