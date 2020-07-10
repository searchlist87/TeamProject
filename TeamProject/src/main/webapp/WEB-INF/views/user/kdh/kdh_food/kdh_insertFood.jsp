<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>
<!-- 해더 부분 -->
<%@include file="../../../include/header.jsp" %>

<!-- 바디 부분 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/kdh/food/insertFood" method="post">
				<div class="form-group">
					<label for="foodName">상품명</label>
					<input type="text" class="form-control" id="foodName" name="foodName" />
				</div>
				<div class="form-group">
					<label for="foodMoney">상품금액</label>
					<input type="text" class="form-control" id="foodMoney" name="foodMoney"/>
				</div>
				<div class="form-group">
					<label for="foodCount">상품수량</label>
					<input type="text" class="form-control" id="foodCount" name="foodCount"/>
				</div>
				<div class="form-group">
					<label for="foodMoney">상품이미지</label>
					<textarea readonly></textarea>
				</div>
				<a id="btnImage" class="btn btn-primary">사진가져오기</a>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<!--/ 바디 부분 -->

<!-- 푸터 부분 -->
<%@ include file="../../../include/footer.jsp" %>


