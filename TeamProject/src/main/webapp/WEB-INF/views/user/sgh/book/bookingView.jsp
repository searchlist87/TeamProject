<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<style>
	.font {
		font-size: 30px;
		padding-top: 20px;
		padding-bottom: 20px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2" style="padding-left: 40px">
			<ul class="nav main-menu menu navbar-nav">
				<li><a href="blog-single-sidebar.html" class="font">베스트</a></li>
				<br/>
				<li><a href="blog-single-sidebar.html" class="font">신작</a></li>
				<br/>
				<li><a href="blog-single-sidebar.html" class="font">상영작</a></li>
			</ul>
		</div>
		<div class="col-md-6">
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>

<a href="/templet/checkout" class="btn btn-success">예매</a>

<%@ include file="../../../include/footer.jsp" %>