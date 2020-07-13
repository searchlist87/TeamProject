<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<!-- tag_and_styleSheet 인크루드 -->
<%@ include file="/WEB-INF/views/include/tag_and_styleSheet.jsp"%>

</head>
<body class="js">
	
<!-- 해더 부분 -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
						
								<!-- 왼쪽 배너 시작 -->
									<div class="single-widget range">
										<h3 class="title">영화 종류</h3>
										<div class="price-filter">
											<div class="price-filter-inner">
												<div id="slider-range"></div>
													<div class="price_slider_amount">
												</div>
											</div>
										</div>
										<ul class="check-box-list">
											<li>
												<label class="checkbox-inline" for="1">베스트</label>
											</li>
											<li>
												<label class="checkbox-inline" for="2">신작</label>
											</li>
											<li>
												<label class="checkbox-inline" for="3">상영작</label>
											</li>
										</ul>
									</div>
								<!-- 왼쪽 배너 끝 -->

<!-- 								Single Widget -->
<!-- 								<div class="single-widget recent-post"> -->
<!-- 									<h3 class="title">Recent post</h3> -->
<!-- 									Single Post -->
<!-- 									<div class="single-post first"> -->
<!-- 										<div class="image"> -->
<!-- 											<img src="https://via.placeholder.com/75x75" alt="#"> -->
<!-- 										</div> -->
<!-- 										<div class="content"> -->
<!-- 											<h5><a href="#">Girls Dress</a></h5> -->
<!-- 											<p class="price">$99.50</p> -->
<!-- 											<ul class="reviews"> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li><i class="ti-star"></i></li> -->
<!-- 												<li><i class="ti-star"></i></li> -->
<!-- 											</ul> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									End Single Post -->
<!-- 									Single Post -->
<!-- 									<div class="single-post first"> -->
<!-- 										<div class="image"> -->
<!-- 											<img src="https://via.placeholder.com/75x75" alt="#"> -->
<!-- 										</div> -->
<!-- 										<div class="content"> -->
<!-- 											<h5><a href="#">Women Clothings</a></h5> -->
<!-- 											<p class="price">$99.50</p> -->
<!-- 											<ul class="reviews"> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li><i class="ti-star"></i></li> -->
<!-- 											</ul> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									End Single Post -->
<!-- 									Single Post -->
<!-- 									<div class="single-post first"> -->
<!-- 										<div class="image"> -->
<!-- 											<img src="https://via.placeholder.com/75x75" alt="#"> -->
<!-- 										</div> -->
<!-- 										<div class="content"> -->
<!-- 											<h5><a href="#">Man Tshirt</a></h5> -->
<!-- 											<p class="price">$99.50</p> -->
<!-- 											<ul class="reviews"> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 												<li class="yellow"><i class="ti-star"></i></li> -->
<!-- 											</ul> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									End Single Post -->
<!-- 								</div> -->
<!-- 								/ End Single Widget -->
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
							
							<!-- 검색 부분 시작 -->
							
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				 
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="text" name="textfield" size="60"/> 
						<button class="btn btn-primary my-2 my-sm-0" type="submit">검색</button>
					</form>
				</div>
			</nav>
		</div>
	</div>
</div>
							
							<!-- 검색 부분 끝 -->
							
								<!-- Shop Top -->
<!-- 								<div class="shop-top"> -->
<!-- 									<div class="shop-shorter"> -->
<!-- 										<div class="single-shorter"> -->
<!-- 											<label>Show :</label> -->
<!-- 											<select> -->
<!-- 												<option selected="selected">09</option> -->
<!-- 												<option>15</option> -->
<!-- 												<option>25</option> -->
<!-- 												<option>30</option> -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 										<div class="single-shorter"> -->
<!-- 											<label>Sort By :</label> -->
<!-- 											<select> -->
<!-- 												<option selected="selected">Name</option> -->
<!-- 												<option>Price</option> -->
<!-- 												<option>Size</option> -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<ul class="view-mode"> -->
<!-- 										<li class="active"><a href="shop-grid.html"><i class="fa fa-th-large"></i></a></li> -->
<!-- 										<li><a href="shop-list.html"><i class="fa fa-th-list"></i></a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
								<!--/ End Shop Top -->
								
							</div>
						</div>
						<div class="row">
						
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie01.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Women Hot Collection</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie02.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Awesome Pink Show</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie03.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Awesome Bags Collection</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie04.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
											<span class="new">New</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Women Pant Collectons</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie05.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Awesome Bags Collection</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie06.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
											<span class="price-dec">30% Off</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Awesome Cap For Women</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie07.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Polo Dress For Women</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie08.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
											<span class="out-of-stock">Hot</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Black Sunglass For Women</a></h3>
										<div class="product-price">
											<span class="old">$60.00</span>
											<span>$50.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<!-- 이미지 교체시 아래 경로만 바꾸면 됨 -->
											<img class="default-img" src="/resources/images/gsh/movie09.jpg" alt="#">
											<img class="hover-img" src="" alt="#">
											<span class="new">New</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Women Pant Collectons</a></h3>
										<div class="product-price">
											<span>$29.00</span>
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
		
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>