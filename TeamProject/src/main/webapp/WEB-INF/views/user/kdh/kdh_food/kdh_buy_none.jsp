<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>

<style>
	a {
		margin-left: 10px;
	}
	input {
		width: 30%;
	}
</style>

<body class="loginBody">
<div class="container-fluid" style="margin-top: 100px; margin-bottom: 100px;">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="text-align: center;">
			<h4 style="margin-bottom: 20px;">장바구니가 비어있습니다.</h4>
			<a href="http://localhost" class="btn" style="color: white;">주문하기</a>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>
<%@ include file="../../../include/footer.jsp" %>