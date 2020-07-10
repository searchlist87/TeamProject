<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>

	
<!-- 해더 부분 -->
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
			<h3>리뷰 게시판 입니다.</h3>
			　
			<form role="form">
				<div class="form-group">
				
				<select>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="title_content">제목+내용</option>
					<option value="user_id">작성자</option>
				</select>
				
				<input type="text" name="search_keyword" placeholder="게시판 검색">
					 <button type="submit" class="btn btn" >검색</button>
					  <!-- 글 작성 버튼 클릭 기능 실행 확인했음 -->
					 <a href="/gsh/movie/review_form" class="btn btn">리뷰 작성</a>
				</div>
			</form>
			
			<table class="table">
				<thead>
					<tr>
						<th>리뷰 번호</th>
						<th>영화 제목</th>
						<th>작성자</th>
						<th>평점</th>
						<th>작성일</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<th>리뷰 번호</th>
						<th>영화 제목</th>
						<th>작성자</th>
						<th>평점</th>
						<th>작성일</th>
					</tr>
				</tbody>
				
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>	
		
<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
