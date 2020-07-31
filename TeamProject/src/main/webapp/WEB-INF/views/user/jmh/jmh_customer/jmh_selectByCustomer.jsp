<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>

<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(function () {
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
									<a class="nav-link" href="#tab1" data-toggle="tab" >FAQ</a>
								</li>
								<li class="nav-item">
									<a class="nav-link active show" href="#tab2" data-toggle="tab" style="background-color:#f6931d;color:#fff;">공지사항</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane" id="tab1">
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
								<div class="tab-pane active" id="tab2">
									<div class="row">
										<div class="col-md-12">
											<form role="form">
												<div class="form-group">
													<label for="board_title"></label>
													<input type="text" class="form-control" id="board_title" value="${jmhNoticeVo.board_title}"readonly/>
												</div>
												<div class="form-group">
													<pre>${jmhNoticeVo.board_content}</pre>
												</div>
											</form>
											<a href="/customer/customerPage" role="button" class="btn" style="color:#fff;">목록</a>
										</div>
									</div>
								</div>
								<!--  공지사항 END-->
							</div>
						</div>
					</div>
				</div>
				<!--  TAB END -->
			</div>
		</div>
</section>
<!--/ End Contact -->
<%@ include file="../../../include/footer.jsp"%>
</body>
</html>