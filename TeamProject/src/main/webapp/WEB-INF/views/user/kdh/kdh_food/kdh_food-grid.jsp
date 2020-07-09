<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<style>
	.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
}

</style>
<!-- tag_and_styleSheet 인크루드 -->
<%@include file = "../../../include/tag_and_styleSheet.jsp" %>

</head>
<body class="js">
	
<!-- 해더 부분 -->
<%@include file="../../../include/header.jsp" %>

	<!-- 음식 메인 사진 -->
	<div class="foodMain" style="background-color:black">
		<div style="background-color:black" class="container">
			<div class="row">
				<div class="col-12" style="text-align: center;">
					<div>
						<img src="/resources/images/kdh/팝콘.png" style="height:400px; width:70%;"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ 음식 메인 사진 -->
	
		<div></div>
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
								<!-- Single Widget -->
								<div class="single-widget category">
									<h3 class="title">카테고리</h3>
									<ul class="categor-list">
										<li><a href="#">팝콘</a></li>
										<li><a href="#">음료</a></li>
										<li><a href="#">패키지</a></li>
										<li><a href="#">굿즈</a></li>
									</ul>
								</div>
								<!--/ End Single Widget -->
								
								<!-- Single Widget -->
								<div class="single-widget recent-post">
									<h3 class="title">최신 상품</h3>
									<!-- Single Post -->
									<div class="single-post first">
										<div class="image">
											<img src="https://via.placeholder.com/75x75" alt="#">
										</div>
										<div class="content">
											<h5><a href="#">갈릭 팝콘(L)</a></h5>
											<p class="price">6,000원</p>
											<ul class="reviews">
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li><i class="ti-star"></i></li>
												<li><i class="ti-star"></i></li>
											</ul>
										</div>
									</div>
									<!-- End Single Post -->
									<!-- Single Post -->
									<div class="single-post first">
										<div class="image">
											<img src="https://via.placeholder.com/75x75" alt="#">
										</div>
										<div class="content">
											<h5><a href="#">복숭아 아이스티</a></h5>
											<p class="price">3,000원</p>
											<ul class="reviews">
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li><i class="ti-star"></i></li>
											</ul>
										</div>
									</div>
									<!-- End Single Post -->
									<!-- Single Post -->
									<div class="single-post first">
										<div class="image">
											<img src="https://via.placeholder.com/75x75" alt="#">
										</div>
										<div class="content">
											<h5><a href="#">레몬 아이스티</a></h5>
											<p class="price">3,500원</p>
											<ul class="reviews">
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
											</ul>
										</div>
									</div>
									<!-- End Single Post -->
								</div>
								<!--/ End Single Widget -->
								
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top">
									<div class="shop-shorter">
										<div class="single-shorter">
											<label>Show :</label>
											<select>
												<option>09</option>
												<option selected="selected">15</option>
												<option>25</option>
												<option>30</option>
											</select>
										</div>
										<div class="single-shorter">
											<label>Sort By :</label>
											<select>
												<option selected="selected">Name</option>
												<option>Price</option>
												<option>Size</option>
											</select>
										</div>
									</div>
									<ul class="view-mode">
										<li class="active"><a href="shop-grid.html"><i class="fa fa-th-large"></i></a></li>
										<li><a href="shop-list.html"><i class="fa fa-th-list"></i></a></li>
									</ul>
								</div>
								<!--/ End Shop Top -->
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/honeyPopCon">
											<img class="default-img" src="/resources/images/kdh/카라멜.jpg" style="height:300px" alt="캬라멜 팝콘">
											<span class="out-of-stock">Hot</span>
										</a>
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/honeyPopCon">캬라멜 팝콘</a></h3>
										<div class="product-price">
											<span>6,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/garicPopCon">
											<img class="default-img" src="/resources/images/kdh/갈릭.jpg" style="height:300px" alt="갈릭 팝콘">
											<span class="new">New</span>
										</a>
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/garicPopCon">갈릭 팝콘</a></h3>
										<div class="product-price">
											<span>6,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/basicPopCon">
											<img class="default-img" src="/resources/images/kdh/기본.jpg" style="height:300px" alt="기본 팝콘">
										</a>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">베이직 팝콘</a></h3>
										<div class="product-price">
											<span>5,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/cola">
											<img class="default-img" src="/resources/images/kdh/콜라컵.jpg" style="height:300px" alt="콜라 이미지">
											<span class="out-of-stock">Hot</span>
										</a>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">콜라</a></h3>
										<div class="product-price">
											<span>3,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/saida">
											<img class="default-img" src="/resources/images/kdh/콜라컵.jpg" style="height:300px" alt="사이다 이미지">
										</a>
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/saida">사이다</a></h3>
										<div class="product-price">
											<span>3,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/peachIcedtea">
											<img class="default-img" src="/resources/images/kdh/복숭아.jpg" style="height:300px" alt="복숭아 아이스티 이미지">
											<span class="new">New</span>
										</a>
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/peachIcedtea">복숭아 아이스티</a></h3>
										<div class="product-price">
											<span>4,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/lemonIcedtea">
											<img class="default-img" src="/resources/images/kdh/레몬.png" style="height:300px" alt="레몬 아이스티 이미지">
											<span class="new">New</span>
										</a>
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/lemonIcedtea">레몬 아이스티</a></h3>
										<div class="product-price">
											<span>4,000원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/hotDog">
											<img class="default-img" src="/resources/images/kdh/핫도그.jpg" style="height:300px" alt="핫도그 이미지">
										</a>
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/hotDog">핫도그</a></h3>
										<div class="product-price">
											<span>3,500원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/nacho">
											<img class="default-img" src="/resources/images/kdh/나초6.png" style="height:300px" alt="#">
											<span class="new">New</span>
										</a>
										
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/nacho">나초</a></h3>
										<div class="product-price">
											<span>3,500원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/nacho2">
											<img class="default-img" src="/resources/images/kdh/나초6.png" style="height:300px" alt="#">
											<span class="new">New</span>
										</a>
										
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/nacho2">나초2</a></h3>
										<div class="product-price">
											<span>3,500원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/nacho3">
											<img class="default-img" src="/resources/images/kdh/나초6.png" style="height:300px" alt="#">
											<span class="new">New</span>
										</a>
										
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/nacho3">나초3</a></h3>
										<div class="product-price">
											<span>3,500원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="/kdh/food/nacho4">
											<img class="default-img" src="/resources/images/kdh/나초6.png" style="height:300px" alt="#">
											<span class="new">New</span>
										</a>
										
									</div>
									<div class="product-content">
										<h3><a href="/kdh/food/nacho4">나초4</a></h3>
										<div class="product-price">
											<span>3,500원</span>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Product Style 1  -->	
		
		
		
		<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
						</div>
						<div class="modal-body">
							<div class="row no-gutters">
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
									<!-- Product Slider -->
										<div class="product-gallery">
											<div class="quickview-slider-active">
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
											</div>
										</div>
									<!-- End Product slider -->
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
									<div class="quickview-content">
										<h2>Flared Shift Dress</h2>
										<div class="quickview-ratting-review">
											<div class="quickview-ratting-wrap">
												<div class="quickview-ratting">
													<i class="yellow fa fa-star"></i>
													<i class="yellow fa fa-star"></i>
													<i class="yellow fa fa-star"></i>
													<i class="yellow fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<a href="#"> (1 customer review)</a>
											</div>
											<div class="quickview-stock">
												<span><i class="fa fa-check-circle-o"></i> in stock</span>
											</div>
										</div>
										<h3>$29.00</h3>
										<div class="quickview-peragraph">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
										</div>
										<div class="size">
											<div class="row">
												<div class="col-lg-6 col-12">
													<h5 class="title">Size</h5>
													<select>
														<option selected="selected">s</option>
														<option>m</option>
														<option>l</option>
														<option>xl</option>
													</select>
												</div>
												<div class="col-lg-6 col-12">
													<h5 class="title">Color</h5>
													<select>
														<option selected="selected">orange</option>
														<option>purple</option>
														<option>black</option>
														<option>pink</option>
													</select>
												</div>
											</div>
										</div>
										<div class="quantity">
											<!-- Input Order -->
											<div class="input-group">
												<div class="button minus">
													<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
														<i class="ti-minus"></i>
													</button>
												</div>
												<input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
												<div class="button plus">
													<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
														<i class="ti-plus"></i>
													</button>
												</div>
											</div>
											<!--/ End Input Order -->
										</div>
										<div class="add-to-cart">
											<a href="#" class="btn">Add to cart</a>
											<a href="#" class="btn min"><i class="ti-heart"></i></a>
											<a href="#" class="btn min"><i class="fa fa-compress"></i></a>
										</div>
										<div class="default-social">
											<h4 class="share-now">Share:</h4>
											<ul>
												<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
												<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
												<li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
												<li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal end -->
		
<%@ include file="../../../include/footer.jsp" %>
</body>
</html>