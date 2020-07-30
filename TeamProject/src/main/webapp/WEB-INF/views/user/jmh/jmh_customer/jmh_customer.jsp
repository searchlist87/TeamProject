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
	$(".card-body").attr("display", "none");
	
	//content 나오게
	var index = 0;
	$(".link").click(function (e) {
		e.preventDefault();
		var that = $(this).parent().parent().parent().find("div:last");
		if (index == 0) {
			that.css("display", "block");
			$(this).find("img").attr("src","/resources/images/jmh/pointer_top.png");
			index = 1;
		} else if(index == 1) {
			that.css("display", "none");
			$(this).find("img").attr("src","/resources/images/jmh/pointer.png");
			index = 0;
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
									<a class="nav-link show" href="#tab1" data-toggle="tab" style="background-color:#f6931d;color:#fff;">FAQ</a>
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
<%-- 													<textarea rows="5" readonly>${faqVo.faq_content}</textarea> --%>
													<pre>${faqVo.faq_content}</pre>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<!--  메뉴 end-->
								</div>
								<div class="tab-pane" id="tab2">
									<div class="row">
										<div class="col-md-12">
											<table class="table">
												<thead>
													<tr>
														<th>1</th>
														<th>1</th>
														<th>1</th>
														<th>1</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>1</td>
														<td>1</td>
														<td>1</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
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