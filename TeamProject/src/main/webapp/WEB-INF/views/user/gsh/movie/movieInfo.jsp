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
	// 리뷰 작성 확인 버튼
$(function() {
		// 클릭 되는거 확인함
// 		console.log("클릭됨");
		
		// 댓글작성 버튼
		$("#btnCommentWrite").click(function() {
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
				if (rData == "success") {
					$("#commentTable tr.cl_tr").remove();
					$.each(rData, function() {
						var tr = $("#commentTable tr:first").clone();
						tr.addClass("cl_tr");
						var td = tr.find("td");
//	 					td.eq(0).text(this.user_id);
						td.eq(1).text(this.review_content);
						td.eq(2).text(this.review_score);
//	 					td.eq(3).text(sysdate);
						td.eq(4).text("").append("<button class='btn btn-sm btn-warning btnReviewModify' data-cno='"+this.cno+"'>수정</button>");
						td.eq(5).text("").append("<button class='btn btn-sm btn-danger btnReviewDelete'  data-cno='"+this.cno+"'>삭제</button>");
						$("#commentTable").append(tr);
					});
				}
				/*
				$("#commentTable tr.cl_tr").remove();
				$.each(rData, function() {
					var tr = $("#commentTable tr:first").clone();
					tr.addClass("cl_tr");
					var td = tr.find("td");
// 					td.eq(0).text(this.user_id);
					td.eq(1).text(this.review_content);
					td.eq(2).text(this.review_score);
// 					td.eq(3).text(sysdate);
					td.eq(4).text("").append("<button class='btn btn-sm btn-warning btnReviewModify' data-cno='"+this.cno+"'>수정</button>");
					td.eq(5).text("").append("<button class='btn btn-sm btn-danger btnReviewDelete'  data-cno='"+this.cno+"'>삭제</button>");
					$("#commentTable").append(tr);
				});
				*/
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
								<th>${list}관람등급</th>
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
		<div class="col-md-10">
			<input type="text" class="form-control" placeholder="댓글내용" id="review_content">
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
			<button type="button" class="btn btn-sm btn-danger" id="btnCommentWrite">완료</button>
		</div>
	</div>
	
	<div class="row">
		<div style="display : none" class="col-md-12">
			<table id="commentTable" class="table">
				<tr style="background-color: #ccc;">
					<th>작성자 아이디</th>
					<th>리뷰 내용</th>
					<th>평점</th>
					<th>작성일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				
			<tbody>	
<%-- 				<c:forEach items="${list}" var="vo"> --%>
				<tr>
					<td>${vo.user_id}</td>
					<td>${vo.review_content}</td>
					<td>${vo.review_score}</td>
					<td>${vo.sysdate}</td>
				</tr>
<%-- 				</c:forEach> --%>
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
			
<!-- 한줄 감상평 시작 -->

<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-1"></div> -->
<!-- 				<div class="col-md-10"> -->
<!-- 					<h3>한줄 감상평</h3><br> -->
					
<!-- 					<table class="table"> -->
<!-- 						<thead> -->
<!-- 							<tr> -->
<!-- 								<th>리뷰 번호</th>  -->
<!-- 								<th>영화 코드</th>  -->
<!-- 							<th>아이디</th> -->
<!-- 								<th>평점</th> -->
<!-- 								<th>리뷰 내용</th> -->
<!-- 							<th>리뷰 작성일</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
						
<!-- <!-- 						내용 값 변경 -->
<%-- 						<c:forEach items="${list}" var="vo"> --%>
<!-- 							<tr> -->
<%--  								<td>${vo.seq_review_num.nextval}</td> --%>
<%--  								<td>${vo.movie_code}</td> --%>
<%--  								<td>${vo.user_id}</td> --%>
<%-- 								<td>${vo.review_score} --%>
<!-- 									<select> -->
<!-- 										<option value="1"></option> -->
<!-- 										<option value="2"></option> -->
<!-- 										<option value="3"></option> -->
<!-- 										<option value="4"></option> -->
<!-- 										<option value="5"></option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<input type="text" class="form-control" maxlength="200" placeholder="감상평을 적어주세요." required/> -->
<!-- 									<button type="button" id="btnInput" class="btn btn-primary">입력</button> -->
<!-- 								</td> -->
<!--  								<td>Default</td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
						
<!-- 					</table> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-1"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- 한줄 감상평 끝 -->
			
		</div>
		<div class="col-md-2"></div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
