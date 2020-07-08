<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<style>
	.font {
		font-size: 30px;
	}
</style>

<script>
$(function() {
	$("#linkUlsan").click(function(e) {
		$(".remove").remove();
		e.preventDefault();
		var section = $("#link").clone().addClass("remove");
		$("#link").after(section);
	});
	
	$("#section").on("click", ".remove", function(e) {
		e.preventDefault();
		console.log("클릭됌");
		var url = "/sgh/book/location";
		var h1 = "gdgd";
		var sendData = {
				"hi" : h1
		};
		
		$.getJSON(url, sendData, function(rData) {
			console.log(rData);
		});
	});
});
</script>
		<!-- Product Style -->
		<section id="section" class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div id="link" class="col-lg-2 col-md-2 col-2">
						<div class="shop-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">상영 지역</h3>
								<ul class="categor-list">
									<li><a href="#" id="linkUlsan" class="font">울산</a></li>
									<li><a href="#" id="linkSeoul" class="font">서울</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

<a href="/templet/checkout" class="btn btn-success">예매</a>

<%@ include file="../../../include/footer.jsp" %>