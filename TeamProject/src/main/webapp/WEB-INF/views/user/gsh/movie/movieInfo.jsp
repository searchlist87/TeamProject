<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file = "/WEB-INF/views/include/tag_and_styleSheet.jsp" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

    <!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>

<script>
// 페이지 시작 시 리뷰 목록 나타내기
$(function() {
		// 클릭 되는거 확인함
// 		console.log("가장 위 클릭됨");
		
		// 댓글작성 버튼
		$("#btnCommentWrite").click(function() {
			console.log("댓글버튼");
			var movie_code = "${movieDto.movie_code}";
			var review_content = $("#review_content").val();
			var review_score = $("#review_score").val();
			
			console.log("movie_code :" + movie_code);
			console.log("review_content :" + review_content);
			console.log("review_score :" + review_score);
			
			var sendData = {
					"movie_code" : movie_code,
					"review_content" : review_content,
					"review_score" 	: review_score
			};
			console.log	(sendData);
			
			var url = "/gsh/movie/movieAjax";
			$.get(url, sendData, function(rData) {
				console.log(rData);
				// 값이 제대로 들어있다면  success 표시
				// success값이 나온다면 다음 단계 진행
				if (rData == "success") {
					$("#commentTable tr.cl_tr").remove();
					$.each(rData, function() {
						console.log("rData:" + rData);
						var tbody = $(".tbody").clone();
						var tr = tbody.find("tr");
	 					tr.eq(0).text(this.user_id);
						td.eq(1).text(this.review_content);
						td.eq(2).text(this.review_score);
	 					td.eq(3).text(sysdate);
						td.eq(4).text("").append("<button class='btn btn-sm btn-warning btnReviewModify' data-movie_code='"+this.movie_code+"'>수정</button>");
						td.eq(5).text("").append("<button class='btn btn-sm btn-danger btnReviewDelete'  data-movie_code='"+this.movie_code+"'>삭제</button>");
						$("#commentTable").append(tr);
					});
				}
			});
			/*
			$.ajax({
				"type" : "get",
				"url" : url,
				"dataType" : "text",
				"data" : JSON.stringify(sendData),
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				"success" : function(rData) {
					console.log(rData);
					$("#btnComment").trigger("click");
				}
			});
			*/

		
	});
		
		// 목록 버튼
		$("#btnCommentUpdate").click(function() {
			console.log("클릭됨");
			var movie_code = "${movieDto.movie_code}";
			location.href="/gsh/movie/movieInfo?movie_code=" + movie_code;
		});
		
		// 리뷰 수정 기능
// 		$("#commentTable").on("click", ".btnReviewModify", function() {
// 			var cno = $(this).attr("data-cno");
// 			$("#btnReviewModify").attr("data-cno", cno);
// 			var td  = $(this).parent().parent().find("td");
// 			var content = td.eq(1).text();
// 			var score = td.eq(2).text();
// 			$("#modal_content").val(content);
// 			$("#modal_writer").val(writer);
// 			$("#modal-505484").trigger("click");
// 		});
});
</script>

<body>
<%-- ${subImageList} --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-top:50px;margin-bottom:50px;"></div>
		<div class="col-md-2"></div>
	</div>
	
	<!-- 영화 배너 이미지 끝 -->
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
					<div style="padding:15px;float:left; margin-bottom:50px;">
						<img src="/upload/displayFile?fileName=${movieDto.movie_main_image}" style="height:auto;" alt="영화이름">
					</div>
				</div>
				<div class="colo-md-8">
					<table class="table">
						<tbody>
							<tr>
								<th>관람등급</th>
								<td><img src="/resources/images/jmh/movie_grade_${movieDto.movie_grade}.png"/></td>
							</tr>
							<tr>
								<th>영화이름</th>
								<td>${movieDto.movie_name}</td>
							</tr>
							<tr>
								<th>평점</th>
								<td>
								<c:forEach begin="1" end="${movieDto.review_score}">
									★
								</c:forEach>
								
								</td>
							</tr>
							<tr>
								<th>장르</th>
								<td>${movieDto.movie_genre}</td>
							</tr>
							<tr>
								<th>감독</th>
								<td>${movieDto.movie_director}</td>
							</tr>
							<tr>
								<th>출연</th>
								<td>${movieDto.movie_actor}</td>
							</tr>
							<tr>
								<th colspan="2"><button type="button" class="btn btn-primary">예매하기</button></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>

		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<!-- 영화 스틸컷 시작 -->
			
			<div class="slide_wrap slide_movie_detail_trailer">
				<div class="owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="margin-bottom:50px;">
							<div class="owl-item active"
								style="width: 320px; margin-right: 20px;">
									<c:forEach items="${subImageList}" var="str" varStatus="status">
										<strong>스틸컷 - ${status.count}</strong>
										<img src="/upload/displayFile?fileName=${str}" alt="영화스틸컷">
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 영화 스틸컷 끝 -->
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<!-- 영화 내용 시작 -->
				
				<div class="movieContent " style="margin-bottom:20px;">
					<h2>시놉시스</h2><br>
					
						<div>
							<span>${movieDto.movie_content}</span>
						</div>
				</div>
			<!-- 영화 내용 끝 -->
			</div>
			<div class="col-md-2"></div>
			


		<!-- 영화 예고편 시작 -->
		</div>	
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
				
			<div style="margin-top:50px;margin-bottom:50px;margin-left:100px;">
				<h2>예고편</h2><br>
				<video src="/upload/displayFile?fileName=${movieDto.movie_preview}" controls style="width:1260px; height:auto;"></video>
			</div>
		</div>
		</div> 
		<!-- 영화 예고편 끝 -->	
		
			<!-- 한줄 감상평 1 시작 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">

	<div class="row" style="margin: 10px 0">
		<div class="col-md-9">
			<input type="text" class="form-control" placeholder="감상평을 남겨주세요." maxlength="100" id="review_content" required/>
		</div>
		<div class="col-md-1">
			<select id="review_score">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</div>
		<div class="col-md-1">
			<button type="button" class="btn btn-sm btn-danger" id="btnCommentWrite">작성</button>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-danger" id="btnCommentUpdate">갱신</button>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<table id="commentTable" class="table">
				<tr style="background-color: #ccc;">
					<td>작성자 아이디</td>
					<td>리뷰 내용</td>
					<td>평점</td>
					<td>작성일</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				
			<tbody class="tbody">	
				<c:forEach items="${reviewList}" var="vo">
				<tr>
					<th>${vo.user_id}</th>
					<th>${vo.review_content}</th>
					<th>${vo.review_score}</th>
					<th>${vo.review_date}</th>
					<th><button id="btnUpdate" type="button">수정</button></th>
					<th><button id="btnDelete" type="button">삭제</button></th>
				</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>

		</div>
		<div class="col-md-1">
		</div>
	</div>
</div>

<!-- 한줄 감상평 1 끝 -->
			
			
		</div>
		<div class="col-md-2"></div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
