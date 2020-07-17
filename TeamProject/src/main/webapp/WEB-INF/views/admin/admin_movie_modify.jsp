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
	
	.fileLabel {
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
	$("#movie_manage > dd").eq(0).css("color","blue"); 
	
	
	$("#modifyForm").submit(function () {
		// 개봉일 형식 확인(2020-07-07)
		var movie_open_date = $("#movie_open_date").val();
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		if(!date_pattern.test(movie_open_date)) {
			$("#movie_open_date").parent().find("span").remove();
			html = "<span style='color:red;'>개봉일 형식을 확인해주세요.</span>";
			$("#movie_open_date").parent().append(html);
			return false;
		}
		$("#movie_open_date").parent().find("span").remove();
		
		// 총시간(0~999)
		var movie_total_time = $("#movie_total_time").val();
		if (movie_total_time < 0 || movie_total_time > 999) {
			$("#movie_total_time").parent().find("span").remove();
			html = "<span style='color:red;'>총시간을 확인해주세요.</span>";
			$("#movie_total_time").parent().append(html);
			return false;
		} 
		$("#movie_total_time").parent().find("span").remove();
		
		// 메인 파일 담기
		var upDiv1 = $("#main_image_div > div");
		upDiv1.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='movie_main_image' value='"+filename+"'/>";
			$("#modifyForm").prepend(hiddenInput);
		});
		
		// 서브 파일 담기
		var upDiv2 = $("#movie_sub_image_div > div");
		upDiv2.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='movie_sub_image["+index+"]' value='"+filename+"'/>";
			$("#modifyForm").prepend(hiddenInput);
		});
		
		// 동영상 파일 담기
		var upDiv3 = $("#movie_preview_text > div");
		upDiv3.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='movie_preview' value='"+filename+"'/>";
			$("#modifyForm").prepend(hiddenInput);
		});
// 		return false;
	});
	
	// 기존 메인이미지 지우기
	$(".attach-main-del").click(function (e) {
		e.preventDefault();
		$("#movie_main_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
			}
		});
	});
	
	// 기존 sub_이미지 지우기
	$(".attach-sub-del").click(function (e) {
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
				removeDiv.remove();
			}
		});
	});
	
	// 기존 동영상 지우기
	$(".attach-preview-del").click(function (e) {
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
				removeDiv.remove();
			}
		});
	});
	
});
// 파일 데이터 미리보기 - 1개
function loadImage(value) {
	$("#main_image_div > div").remove();
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
			var slashIndex = rData.lastIndexOf("/");
			var front = rData.substring(0, slashIndex + 1);
			var rear = rData.substring(slashIndex + 1);
			var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
			var thumbnailName = front + "sm_" + rear;
			var html = "<div data-fileName='" + rData + "'>";
			html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/>";
			html += "<a href='"+rData+"' class='attach-del'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
			html += "</div>";
			
			$("#main_image_div").append(html);
			$("#movie_main_image_text").text(originalFilename);
		}
	});
	
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del", function(e) {
		e.preventDefault();
		$("#movie_main_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
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
				html += "<a href='"+rData+"' class='attach-del1'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
				html += "</div>";
				$("#movie_sub_image_div").append(html);
			}
		});	
		
// 		$("#movie_sub_image_text").text("파일 " + (rearLength+tempLength) + "개");
		
	});
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del1", function(e) {
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
				removeDiv.remove();
			}
		});
	});
}


// 예고편 동영상 올리기
function previewUpload(value) {
	$("#movie_preview").prop("disabled","true");
	$("#tempDiv").remove();
	var file = value.files[0];
	var fileSize = Math.floor(file.size/(1024*1024));
	console.log("fileSize:" + fileSize + "MB");
	
	if(fileSize > 10) {
		console.log("사이즈오류");
		
		var html = "<div id='tempDiv'>";
		html += "<span style='color:red;'>파일사이즈가 맞지않습니다.</span>";
		html += "</div>";
		$("#movie_preview_text").append(html);
		$("#movie_preview").removeAttr("disabled");
		return false;
	}
	var formData = new FormData(); // <form> 작성
	formData.append("file", file); // <input type="file"> : 파일 선택
	var url = "/upload/previewUploadAjax";
	$.ajax({
		"processData" : false,  // text 파일
		"contentType" : false,	// text 파일
		"type" : "post",
		"url" : url,
		"data" : formData,
		"success" : function(rData) {
			var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
			var text = "파일명: "+ originalFilename + " Size:" + fileSize;
			var html = "<div data-fileName='" + rData + "'>";
			html += "<span style='margin-left:100px;width:100px;'>파일사이즈: "+fileSize+"MB</span>";
			html += "<a href='"+rData+"' class='attach-del2'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
			html += "</div>";
			
			$("#movie_preview_text").append(html);
			$("#movie_preview_span").text(originalFilename);
		}
	});
	
	// 이미지 지우기
	$("#registForm").on("click", ".attach-del2", function(e) {
		e.preventDefault();
		$("#movie_preview_span").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
				$("#movie_preview").removeAttr("disabled");
			}
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
									<h4 class="title" >영화관리_영화수정</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_movie_modify" method="post" id="modifyForm">
									<input type="hidden" value="${jmhMovieVo.movie_code}" name="movie_code"/>
									<div class="form-group">
										<label for="movie_name"><strong>영화이름</strong></label>
										<input type=text class="form-control" id="movie_name" name="movie_name" required value="${jmhMovieVo.movie_name}"/>
									</div>
									<div class="form-group">
										<label for="movie_genre"><strong>영화장르</strong></label>
										<input type="text" class="form-control" id="movie_genre" name="movie_genre"  placeholder="로맨스 / 호러 / 스릴러 / 등" required value="${jmhMovieVo.movie_genre}"/>
									</div>
									<div class="form-group">
										<label for="movie_director"><strong>영화감독</strong></label> 
										<input type="text" class="form-control" id="movie_director" name="movie_director" required value="${jmhMovieVo.movie_director}"/>
									</div>
									<div class="form-group">
										<label for="movie_actor"><strong>등장인물</strong></label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" required value="${jmhMovieVo.movie_actor}"/>
									</div>
									<div class="form-group">
										<label for="movie_grade"><strong>영화등급 :</strong></label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade" 
										<c:if test="${jmhMovieVo.movie_grade == 'all'}">
										checked
										</c:if>
										/>
										<span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"
										<c:if test="${jmhMovieVo.movie_grade == '12'}">
										checked
										</c:if>
										/><span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"
										<c:if test="${jmhMovieVo.movie_grade == '15'}">
										checked
										</c:if>
										/><span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"
										<c:if test="${jmhMovieVo.movie_grade == '19'}">
										checked
										</c:if>
										/><span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date"><strong>개봉일</strong></label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date" placeholder="ex)2020-07-07" required value="${jmhMovieVo.movie_open_date}"/>
									</div>
									<div class="form-group">
										<label for="movie_total_time"><strong>총시간(분)</strong></label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" placeholder="ex)180분->180" required value="${jmhMovieVo.movie_total_time}"/>
									</div>
									<div class="form-group">
										<label for="movie_content"><strong>영화정보</strong></label>
										<textarea rows="5" id="movie_content" name="movie_content">${jmhMovieVo.movie_content}</textarea>
									</div>
									<div> 
										<span style="color:blue;">* 이미지& 동영상 파일 크기는 10MB 미만만 가능합니다.</span>
										<span style="color:red;">( 파일명에 '#', [], {}, 등 특수문자는 제외시켜주세요.)</span>
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;"><strong>영화 메인이미지 : </strong></label>
										<input type="file" class="movie_main_image" id="movie_main_image" onchange="loadImage(this);" accept="image/*" style="display:none;" disabled/>
										<label for="movie_main_image" class="fileLabel" >파일 선택</label>
										<span id="movie_main_image_text"></span>
										<div id="main_image_div" style="width:300px;height:auto;">
											<div data-fileName="${jmhMovieVo.movie_main_image}">
<%-- 												<input type="hidden" name="movie_main_image" value="${jmhMovieVo.movie_main_image}"/> --%>
												<img src="/upload/displayFile?fileName=${jmhMovieVo.movie_main_image}" width="150px;"/>
												<a href="${jmhMovieVo.movie_main_image}" class="attach-main-del"><span class="pull-right" style="color:red;">[삭제]</span></a>
											</div>
											
										</div>
									</div>
									<div class="form-group"> 
										<label for="movie_sub_image" style="margin-right:10px;"><strong>영화 상세사진 : </strong></label>
										<input type="file" class="movie_sub_image" id="movie_sub_image" multiple onchange="loadSubImage(this);" style="display:none;" accept="image/*"/>
										<label for="movie_sub_image" class="fileLabel" >파일 선택</label>
										<span id="movie_sub_image_text"></span>
										<div id="movie_sub_image_div" style="width:300px;height:auto;">
										<c:forEach items="${jmhMovieImageVo}" var="imageVo">
				
											<div data-fileName="${imageVo.movie_sub_image}">
<%-- 											<input type="hidden" value="${imageVo.movie_sub_image}" name="movie_sub_image" /> --%>
												<img src="/upload/displayFile?fileName=${imageVo.movie_sub_image}" width="225px;"/>
												<a href="${imageVo.movie_sub_image}" class="attach-sub-del"><span class="pull-right" style="color:red;">[삭제]</span></a>
											</div>
										</c:forEach>	
										</div>
									</div>
									<br/>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;"><strong>영화 예고편 : </strong></label>
										<input type="file" class="movie_preview" id="movie_preview" accept="video/*" onchange="previewUpload(this);" style="display:none;" disabled/>
										<label for="movie_preview" class="fileLabel" >파일 선택</label>
										<span id="movie_preview_span"></span>
										<div id="movie_preview_text" style="width:250px;height:auto;">
											<div data-fileName="${jmhMovieVo.movie_preview}">
<%-- 											<input type="hidden" value="${jmhMovieVo.movie_preview}" name="movie_preview" /> --%>
											<video src="/upload/displayFile?fileName=${jmhMovieVo.movie_preview}" width="300px;" controls></video>
											<a href="${jmhMovieVo.movie_preview}" class="attach-preview-del"><span class="pull-right" style="color:red;">[삭제]</span></a>
											</div>
										</div>
									</div>
									<button type="submit" class="btn btn-primary" id="btnModify">수정</button>
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