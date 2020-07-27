<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<!-- Jquery -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.0.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/gsh_js/gsh_js.js"></script>

<style>
.span_strong {
	width: 312px;
	margin: 10px auto;
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
</style>

<script>
	//클릭 되는거 확인함
	// 		console.log("가장 위 클릭됨");

	// 페이지 시작 시 리뷰 목록 나타내기
	$(function() {

		function getReviewList() {
			var url = "/gsh/movie/reviewList/${movieDto.movie_code}";
			$.get(url, function(rData) {
				// 			console.log(rData);
				$.each(rData, function() {
					var clone_tr = $("#commentTable > tbody > tr:eq(0)")
							.clone();
					// this - rData에 들어있는 각각의 객체
					// 각 줄에 대한 값 -> this.
					var review_num = this.review_num;
					var user_id = this.user_id;
					var review_content = this.review_content;
					var review_score = this.review_score;
					// 날짜 표시를 위한 dateString
					// dateString을 쓰기 위해서 js/gsh_js/gsh_js.js를 추가함
					var review_date = dateString(this.review_date);

					clone_tr.find("td").eq(0).text(review_num).addClass(
							"review_num");
					clone_tr.find("td").eq(1).text(user_id);
					clone_tr.find("td").eq(2).text(review_content);
					clone_tr.find("td").eq(3).text(review_score);
					clone_tr.find("td").eq(4).text(review_date);

					// 숨어있는 줄을 복사해서
					clone_tr.css("display", "");
					// class를 부여하고 값을 변경해서 붙인다
					clone_tr.addClass("clone_tr");
					$("#commentTable > tbody").append(clone_tr);
				});
			});
		}

		$(".nice-select").remove();
		$("#review_score").removeAttr("style");
		$("#review_score_modify").removeAttr("style");

		// 댓글작성 버튼
		$("#btnCommentWrite").click(function() {
			var movie_code = "${movieDto.movie_code}";
			var review_content = $("#review_content").val();
			console.log(movie_code);
			console.log(review_content);

			// required는 submit에만 적용되므로 추가했음
			if (review_content == "" || review_content == null) {
				alert("내용을 작성해주세요.");
				$("#review_content").focus();
				return false;
			}

			var review_score = $("#review_score").val();

			var sendData = {

				"movie_code" : movie_code,
				"review_content" : review_content,
				"review_score" : review_score
			};

			var url = "/gsh/movie/write_review";
			$.post(url, sendData, function(rData) {
				console.log(rData);
				// 값이 제대로 들어있다면  success 표시
				// success값이 나온다면 다음 단계 진행
				if (rData == "success") {
					alert("등록 되었습니다.");
					$("#commentTable tr.clone_tr").remove();
					// 내용 작성하고 작성 누르면 내용이 그대로 남아있는걸 지우는 기능
					$("#review_content").val('');
					getReviewList();
				}
			});
		});

		// 댓글 수정 버튼
		// 		$('.btnModify').click(function() {
		$("#commentTable > tbody").on(
				"click",
				".btnModify",
				function() {

					var review_num = $(this).parent().parent().find("td").eq(0)
							.text();
					var review_content = $(this).parent().parent().find("td")
							.eq(2).text();
					var review_score = $(this).parent().parent().find("td").eq(
							3).text();

					$("#review_num").val(review_num);

					$("#modal_review_content").val(review_content);
					$("#review_score_modify").val(review_score);
					$("#modal-997340").trigger("click");
				});

		// 댓글 수정하고 저장하기
		$("#btnModifyModal").click(function() {
			var review_content = $("#modal_review_content").val();
			var review_score = $("#review_score_modify option:selected").val();
			var review_num = $("#review_num").val();
			var sendData = {

				"review_num" : review_num,
				"review_content" : review_content,
				"review_score" : review_score
			};
			var url = "/gsh/movie/reviewModify";
			$.get(url, sendData, function(rData) {
// 				저장 버튼 누를시 팝업창 띄워서 변경알려줌
// 				console.log("수정 저장");
				alert("내용이 변경 되었습니다.");
// 				$("#").trigger("click");
// 				opener.parent.location.reload();
// 				window.close();
			});
		});

		// 댓글 삭제 버튼
		// 여러개 사용시에는 id가 아닌 class를 부여해서 사용
		// # -> .
		$("#commentTable > tbody").on("click", ".btnDelete", function() {
// 			삭제 버튼 기능 활성화 확인
			console.log("삭제 버튼 클릭");
			var that = $(this);
			console.log(that);
// 			var review_num = $(this);
// 			console.log(this);
// 					var url = "/gsh/movie/reviewList${reviewVo.review_num}/" + review_num;
// 					$.ajax({
// 						"type" : "delete",
// 						"url" : url,
// 						"dataType" : "text",
// 						"headers" : {
// 							"Content-Type" : "application/json",
// 							"X-HTTP-Method-Override" : "delete"
// 						},
// 						"success" : function(rData) {
// 							console.log(rData);
// 							$("#btnDelete").trigger("click");
// 						}
// 					});
		});

		// 리뷰 목록 얻어오기
		getReviewList();

	});
</script>
<input type="hidden" id="review_num">
<body>
	<%-- ${subImageList} --%>
	<div class="container-fluid">

		<!-- 모달 창 부분 시작 -->
		<div class="row">
			<div class="col-md-12">
				<a id="modal-997340" href="#modal-container-997340" role="button"
					class="btn" data-toggle="modal" style="visibility: hidden;">Launch
					demo modal </a>

				<div class="modal fade" id="modal-container-997340" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					style="padding: 20px;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">

								<!-- 수정 버튼(modal) 클릭 시 나타나는 수정 창 시작 -->

								<div class="row">
									<div class="col-md-12" style="padding: 50px;">
										<form role="form">

											<div class="form-group">
												<label>리뷰 내용</label> <input type="text" class="form-control"
													id="modal_review_content" />
											</div>

											<div class="form-group">
												<label>평점</label> <select id="review_score_modify"
													name="review_score_modify">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
											</div>

											<button type="button" class="btn btn-primary" id="btnModifyModal">저장</button>
											<button type="button" class="btn btn-secondary"	data-dismiss="modal">닫기</button>
										</form>
									</div>
								</div>

								<!--  버튼(modal) 클릭 시 나타나는 수정 창 끝 -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 창 부분 끝 -->





		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="margin-top: 50px; margin-bottom: 50px;"></div>
			<div class="col-md-2"></div>
		</div>

		<!-- 영화 배너 이미지 끝 -->

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-4">
						<div style="padding: 15px; float: left; margin-bottom: 50px;">
							<img
								src="/upload/displayFile?fileName=${movieDto.movie_main_image}"
								style="height: auto;" alt="영화이름">
						</div>
					</div>
					<div class="colo-md-8">
						<table class="table">
							<tbody>
								<tr>
									<th>관람등급</th>
									<td><img
										src="/resources/images/jmh/movie_grade_${movieDto.movie_grade}.png" /></td>
								</tr>
								<tr>
									<th>영화이름</th>
									<td>${movieDto.movie_name}</td>
								</tr>
								<tr>
									<th>평점</th>
									<td><c:forEach begin="1" end="${movieDto.review_score}">
									★
								</c:forEach></td>
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
									<th colspan="2"><button type="button"
											class="btn btn-primary">예매하기</button></th>
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

				<div class="row">
					<%-- 			<c:forEach items="${subImageList}" var="str" varStatus="status"> --%>
					<c:forEach begin="0" end="3" var="i">

						<div class="col-md-3" style="margin: 50px auto;">

							<div class="span_strong">스틸컷 - ${i}</div>
							<img class="img-thumbnail"
								src="/upload/displayFile?fileName=${subImageList[i]}"
								alt="영화스틸컷">
						</div>
					</c:forEach>
				</div>

			</div>
			<!-- 영화 스틸컷 끝 -->
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<!-- 영화 내용 시작 -->

					<div class="movieContent " style="margin-bottom: 20px;">
						<h2>시놉시스</h2>
						<br>

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

					<div
						style="margin-top: 50px; margin-bottom: 50px; margin-left: 100px;">
						<h2>예고편</h2>
						<br>
						<video
							src="/upload/displayFile?fileName=${movieDto.movie_preview}"
							controls style="width: 1260px; height: auto;"></video>
					</div>
				</div>
			</div>
			<!-- 영화 예고편 끝 -->

			<!-- 한줄 감상평 1 시작 -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">

						<div class="row" style="margin: 10px 0">
							<div class="col-md-10">
								<input type="text" class="form-control"
									placeholder="감상평을 남겨주세요." maxlength="60" id="review_content" />
							</div>
							<div class="col-md-1">
								<span>평점 : </span> <select id="review_score">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5" selected>5</option>
								</select>
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-sm btn-danger"
									id="btnCommentWrite">작성</button>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<table id="commentTable" class="table">
									<thead>
										<tr style="background-color: #ccc;">
											<th>리뷰 번호</th>
											<th>작성자 아이디</th>
											<th>리뷰 내용</th>
											<th>평점</th>
											<th>작성일</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>

									<tbody class="tbody">
										<tr style="display: none;">
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td><button type="button" class="btn btn-sx btnModify">수정</button></td>
											<td><button type="button" class="btn btn-sx btnDelete">삭제</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
					<div class="col-md-1"></div>
				</div>
			</div>

			<!-- 한줄 감상평 1 끝 -->


		</div>
		<div class="col-md-2"></div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
