<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>

<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
.subul {
	padding-left : 30px;
	margin-top : 10px;
	font-size : 15px;
	border : 1px dotted #ccc;
}
.nav-link {
	font-size : 20px;
}

.card-header {
	background-color:#FFF;
}

 .card-body { 
 	background-color:#eee; 
 } 
</style>
<script>
$(function () {
	$(".card-body").css("display", "none");
	
	//content 나오게
	var index = 0;
	$(".link").click(function (e) {
		e.preventDefault();
		var that = $(this).parent().parent().parent().find("div:last");
		
		
		if(that.css("display") == "none") {
			that.css("display", "block");
			$(this).find("img").attr("src","/resources/images/jmh/pointer_top.png");
		} else if(that.css("display") == "block"){
			that.css("display", "none");
			$(this).find("img").attr("src","/resources/images/jmh/pointer.png");
		}
		
	});
	
	$(".nav-link").click(function () {
		$(".nav-link").css("background-color", "#fff")
		              .css("color", "black");
		$(this).css("color", "#fff")
		       .css("background-color", "#f6931d");
	});
});
</script>
<body class="js">  
<div class="container" style="left:100px;margin-top:100px;">
		<h2>고객센터</h2>
</div>
<!-- Start Contact -->
<section id="contact-us" class="contact-us section" style="padding:50px;">
	<div class="container">
			<div class="contact-head">
				<!--  TAB -->
				<div class="row form-main">
					<div class="col-md-12">
						<div class="tabbable" id="tabs-965434">
							<ul class="nav nav-tabs">
								<li class="nav-item">
									<a class="nav-link" href="#tab1" data-toggle="tab" style="background-color:#f6931d;color:#fff;">FAQ</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#tab2" data-toggle="tab">공지사항</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">
									<!--  FAQ 메뉴 -->
									<c:forEach items="${jmhFAQVo}" var="faqVo">
									<div class="row">
										<div class="col-md-12">
											<div class="card">
												<div style="position:relative;">
												<h5 class="card-header"><img src="/resources/images/jmh/q.png"/>${faqVo.faq_title}</h5>
												<span style="float:right;position:absolute;top:10px;left:970px;"><a href="" class="link"><img src="/resources/images/jmh/pointer.png"/></a></span>
												</div>
												<div class="card-body faq_content" style="display:none;">
													<pre>${faqVo.faq_content}</pre>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<!--  메뉴 end-->
								</div>
								<!--  공지사항 -->
								<div class="tab-pane" id="tab2">
									<div class="row">
										<div class="col-md-12">
											<table class="table">
												<thead>
													<tr>
														<th></th>
														<th style="padding-left:100px;">제목</th>
														<th style="padding-left:70px;">등록일</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${jmhNoticeVo}" var="noticeVo" varStatus="status">
													<tr>
														<td>${status.count}</td>
														<td 
														<c:if test="${noticeVo.notice_check == 'Y'}">
														style="color:red;"
														</c:if>
														><a href="/customer/customer_selectByCustomer?board_code=${noticeVo.board_code}">${noticeVo.board_title}</a></td>
														<td>${noticeVo.board_date}</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!--  공지사항 END-->
								<div style="margin-top:20px;">더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면? <span style="color:red;"><a href="/mypage/question">[ 1:1문의 바로가기 ]</a></span></div>
							</div>
						</div>
					</div>
				</div>
				<!--  TAB END -->
				
			</div>
			<div class="row form-main" style="margin-top:20px;">
					<div class="col-md-12">
						<span style="float:left;"><img src="/resources/images/jmh/customer.png" width="50px;" height="auto;"/></span>
						<h5 style="padding-top:20px;margin-left:70px;">허니박스 고객센터</h5>
					</div>
					<div class="col-md-12" style="margin-top:20px;">
						<h2 style="float:left;">1588 - </h2><h2 style="color:#179cea;"> 2345</h2>
					</div>
					<div class="col-md-12" style="margin-top:20px;">
						<span>평일 > 09:00 ~ 18:00</span><br/>
						<span>점심시간 > 12:00 ~ 13:00</span><br/>
						<span>업무 외 시간에는</span> <span style="color:red;">1:1 문의하기</span><span>를 이용해 주세요.</span>
					</div>
			</div>
		</div>
</section>
<!--/ End Contact -->
<%@ include file="../../../include/footer.jsp"%>
</body>
</html>