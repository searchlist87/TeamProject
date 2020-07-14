<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
</head>
<!-- Jquery -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.0.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<!--  admin.js -->
	<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
	.movie_grade {
		margin-left:20px;
	}
	
	.movie_grade_span {
		margin-left:10px;
	}
	
	#fileLabel {
		width:80px;
		height:30px;
		border:1px solid #767676;
		border-top-right-radius:3px;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
		border-bottom-right-radius:3px;
		text-align:center;
		background-color:#efefef;
		padding-top:2px;
	}
	
	
	


</style>
<script>
$(function () {
	$("#movie_manage > dd").css("display","block");
	$("#movie_manage > dt").css("color","red");
	$("#movie_manage > dd").eq(1).css("color","blue");
});

// 파일 데이터 미리보기 - 1개
function loadImage(value) {
	$("#movie_main_image").prop("disabled","true");
 	// 파일 추가하기
	var file = value.files[0];
	
	var formData = new FormData(); // <form> 작성
	formData.append("file", file); // <input type="file"> : 파일 선택
	var url = "/upload/uploadAjax";
	$.ajax({
		"processData" : false,  // text 파일
		"contentType" : false,	// text 파일
		"type" : "post",
		"url" : url,
		"data" : formData,
		"success" : function(rData) {
			console.log(rData);
			var slashIndex = rData.lastIndexOf("/");
			var front = rData.substring(0, slashIndex + 1);
			var rear = rData.substring(slashIndex + 1);
			var thumbnailName = front + "sm_" + rear;
			var html = "<div data-fileName='" + rData + "'>";
			html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/><br/>";
			html += "<a href='"+rData+"' class='attach-del'><span class='pull-right'>x</span></a>";
			html += "</div>";
			
			console.log(html);
			
			$("#main_image_div").append(html);
		}
	});
	
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del", function(e) {
		e.preventDefault();
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				$("#movie_main_image").val("");
				removeDiv.remove();
				$("#movie_main_image").removeAttr("disabled");
			}
		});
	});
}

//파일 데이터 미리보기 - 여러개
function loadSubImage(value) {
	$("#movie_sub_image_div > img").remove();
	var files = value.files;
	var filesArr = Array.prototype.slice.call(files);
	var fileIndex = 0;
	var length = filesArr.length;
	
	filesArr.forEach(function(f) { 
		
		// 파일 추가하기
		var file = value.files[fileIndex];
		fileIndex ++;
		var formData = new FormData(); // <form> 작성
		formData.append("file", file); // <input type="file"> : 파일 선택
		var url = "/upload/uploadAjax";
		$.ajax({
			"processData" : false,  // text 파일
			"contentType" : false,	// text 파일
			"type" : "post",
			"url" : url,
			"data" : formData,
			"success" : function(rData) {
				var slashIndex = rData.lastIndexOf("/");
				var front = rData.substring(0, slashIndex + 1);
				var rear = rData.substring(slashIndex + 1);
				var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
				var thumbnailName = front + "sm_" + rear;
				var html = "<div data-fileName='" + rData + "'>";
				html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/><br/>";
				html += "<span>"+originalFilename+"</span>";
				html += "<a href='"+rData+"' class='attach-del'><span class='pull-right'>x</span></a>";
				html += "</div>";
				$("#movie_sub_image_div").append(html);
			}
		});	
		$("#movie_sub_image_text").text("파일있음");
		var tempLength = 0;
		// 이미지 지우기
		$("#registForm").on("click", ".attach-del", function(e) {
			tempLength ++;
			e.preventDefault();
			var removeDiv = $(this).parent();
			var fileName = $(this).attr("href");
			var url = "/upload/deleteFile";
			var sendData = {"fileName" : fileName};
			$.ajax({
				"type" : "get",
				"url" : url,
				"data" : sendData,
				"success" : function(rData) {
					var check = length-tempLength;
					if(check == 0) {
						tempLength = 0;
						length = 0;
					}
					
					removeDiv.remove();
				}
			});
		});
	});
	
}

</script>
<body class="js">
<!-- 해더 부분 -->
<%@include file="../include/admin_header.jsp" %>
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
				<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;margin-bottom:20px;">
									<h4 class="title" >영화관리_영화등록</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_movie_register" method="post" id="registForm">
									<div class="form-group">
										<label for="movie_name">영화이름</label>
										<input type=text class="form-control" id="movie_name" name="movie_name"  />
									</div>
									<div class="form-group">
										<label for="movie_genre">영화장르</label>
										<input type="text" class="form-control" id="movie_genre" name="movie_genre"  placeholder="로맨스 / 호러 / 스릴러 / 등"/>
									</div>
									<div class="form-group">
										<label for="movie_director">영화감독</label>
										<input type="text" class="form-control" id="movie_director" name="movie_director" />
									</div>
									<div class="form-group">
										<label for="movie_actor">등장인물</label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" />
									</div>
									<div class="form-group">
										<label for="movie_grade">영화등급 :</label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade" checked/><span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"/><span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"/><span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"/><span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date">개봉일</label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date" placeholder="ex)2020-07-07"/>
									</div>
									<div class="form-group">
										<label for="movie_total_time">총시간</label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" placeholder="ex)180분->180"/>
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;">영화 메인이미지 : </label>
										<input type="file" class="movie_main_image" id="movie_main_image" onchange="loadImage(this);"/>
										<div id="main_image_div"></div>
									</div>
									<div class="form-group">
										<label for="movie_sub_image" style="margin-right:10px;">영화 상세사진 : </label>
										<input type="file" class="movie_sub_image" id="movie_sub_image" multiple onchange="loadSubImage(this);" style="display:none;" accept-charset="UTF-8"/>
										<label for="movie_sub_image" id="fileLabel" >파일 선택</label>
										<span id="movie_sub_image_text">선택된 파일 없음</span>
										<div id="movie_sub_image_div"></div>
									</div>
									<br/>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;">영화 예고편 : </label>
										<input type="file" class="movie_preview" id="movie_preview" />
									</div>
									<button type="submit" class="btn btn-primary" id="btnSubmit">등록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>