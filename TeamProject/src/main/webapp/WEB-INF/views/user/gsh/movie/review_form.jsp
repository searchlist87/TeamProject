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
			　
			<form name="review_write">
			
				<div class="select-movie">
						<select style="display : 0">
							<option value="0">장르 선택</option>
							<option value="1">로맨스</option>
							<option value="2">액션</option>
							<option value="3">공포</option>
						</select>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">제목</label>
					<input type="text" class="form-control" placeholder="제목을 입력해 주세요." required/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">내용</label>
					<textarea class="form-control" maxlength="200" placeholder="최대 200자까지 작성 가능합니다." required></textarea>
				</div>
				
				<div class="form-group">
					<label for="exampleInputFile">첨부할 파일</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
				</div>
				
				<a href="작성 완료하고 이동할 페이지" class="btn btn">리뷰 작성</a>
				<a href="작성 취소하고 이동할 페이지" class="btn btn">작성 취소</a>
				<h1>　　　</h1>
			</form>
			
		</div>
		<div class="col-md-2">
		<h1>　</h1>
		</div>
	</div>
</div>		

<%@ include file="/WEB-INF/views/include/footer.jsp" %>