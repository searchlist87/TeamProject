<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>

<script>
$(function() {
	$("select").css("display", "block");
	$(".nice-select").remove();
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
			<div class="carousel slide" id="carousel-629096">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-629096" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-629096">
					</li>
					<li data-slide-to="2" data-target="#carousel-629096">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-629096" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-629096" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
		</div>
		<div class="col-md-4">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" style="background-color: #ccc;" action="/sgh/member/joinRun" method="post">
				<div class="form-group">
					<label for="user_id">
						아이디
					</label>
					<input type="text" class="form-control" id="user_id" name="user_id"/>
				</div>
				<div class="form-group">
					<label for="user_pw">
						비밀번호
					</label>
					<input type="password" class="form-control" id="user_pw" name="user_pw" />
				</div>
				<div class="form-group">
					<label for="user_name">
						이름
					</label>
					<input type="text" class="form-control" id="user_name" name="user_name" />
				</div>
				<div class="form-group">
					<label for="user_gender">
						성별
					</label><br/>
					<input type="radio" id="user_gender" name="user_gender" value="M">남자 
					<input type="radio" id="user_gender" name="user_gender" value="F">여자
				</div>
				<div class="form-group">
					<label for="user_email">
						이메일
					</label>
					<input type="email" class="form-control" id="user_email" name="user_email" />
				</div>
				<div class="form-group">
				<div>
					<label for="user_birth">
						생일
					</label>
					</div>
					<select style="float: left;">
						<c:forEach begin="1900" end="2020" var="year">
							<option value="${year}">${year}년</option>
						</c:forEach>
					</select>
					<select style="float: left;">
						<c:forEach begin="1" end="12" var="month">
							<option value="${month}">${month}월</option>
						</c:forEach>
					</select>
					<select style="float: left;">
						<c:forEach begin="1" end="31" var="date">
							<option value="${date}">${date}일</option>
						</c:forEach>
					</select>
					<br/>
				</div>
				<div class="form-group">
					<label for="user_phone">
						휴대폰
					</label>
					<input type="text" class="form-control" id="user_phone" name="user_phone" />
				</div>
				<div class="form-group">
					<label for="user_address">
						주소
					</label>
					<input type="text" class="form-control" id="user_address" name="user_address" />
				</div>
				<div class="form-group">
					<label for="user_sms_check">
						메일수신여부
					</label><br/>
					<input type="radio" id="user_sms_check" name="user_sms_check" value="Y"/>수신
					<input type="radio" id="user_sms_check" name="user_sms_check" value="N"/>수신안함
				</div>
				<div>
					<button type="submit" class="btn btn-sm btn-primary">
						회원가입
					</button>
				</div>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@ include file="../../../include/footer.jsp" %>