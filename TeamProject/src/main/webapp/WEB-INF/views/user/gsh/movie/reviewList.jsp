<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>

<!-- 해더 부분 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- Controller에서 작성한 목록이 나오는지 시험 -->
<%-- ${list } --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<h1>　　　</h1></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
	
		<div class="row">
		<div class="col-md-2"></div>
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
					 <a href="/gsh/movie/review_write_form" class="btn btn">리뷰 작성</a>
				</div>
			</form>
			
			<table class="table">
						<thead>
							<tr>
								<th>리뷰 번호</th>
								<th>영화 코드</th>
								<th>아이디</th>
								<th>평점</th>
								<th>리뷰 내용</th>
								<th>리뷰 작성일</th>
							</tr>
						</thead>
				
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<th>${vo.review_num}</th>
							<th><a href="/gsh/movie/reviewContent">${vo.movie_code}</a></th>
							<th>${vo.user_id}</th>
							<th>${vo.review_score}</th>
							<th>${vo.review_content}</th>
							<th>${vo.review_date}</th>
						</tr>
					</c:forEach>
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
