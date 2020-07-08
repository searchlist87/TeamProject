<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	.titlePadding {
		width : 100px;
 		text-align : center; 
	}
</style>
<!-- Header -->
<header class="header shop">
	<!-- Topbar -->
	<div class="topbar">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-12"></div>
				<div class="col-lg-8 col-md-12 col-12">
					<!-- Top Right -->
					<div class="right-content">
						<ul class="list-main">
							<li><i class="ti-user"></i> <a href="#">회원가입</a></li>
							<li><i class="ti-power-off"></i><a href="login.html#">로그인</a></li>
							<li><i class="ti-user"></i> <a href="#">내 정보</a></li>
							<li><i class="ti-user"></i> <a href="#">고객센터</a></li>
						</ul>
					</div>
					<!-- End Top Right -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Topbar -->
	<div class="middle-inner">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-2 col-12">
					<!-- Logo -->
					<div class="logo">
						<a href="/ "><img src="/resources/images/logo.jpg"
							alt="logo"></a> 
					</div>  
					<!--/ End Logo --> 
					<!-- Search Form -->
					<div class="search-top">
						<div class="top-search">
							<a href="#0"><i class="ti-search"></i></a>
						</div>
						<!-- Search Form -->
						<div class="search-top">
							<form class="search-form">
								<input type="text" placeholder="Search here..." name="search">
								<button value="search" type="submit">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
						<!--/ End Search Form -->
					</div>
					<!--/ End Search Form -->
					<div class="mobile-nav"></div>
				</div>
				<div class="col-lg-8 col-md-7 col-12">
					<div class="search-bar-top">
						<div class="search-bar">
							<select>
								<option selected="selected">장르선택</option>
								<option>로맨스</option>
								<option>액션</option>
								<option>공포</option>
							</select>
							<form>
								<input name="search" placeholder="영화제목을 입력해주세요."
									type="search">
								<button class="btnn">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-12">
					<div class="right-bar">
						<!-- Search Form -->
						<div class="sinlge-bar">
							<a href="#" class="single-icon"><i class="fa fa-heart-o"
								aria-hidden="true"></i></a>
						</div>
						<div class="sinlge-bar">
							<a href="#" class="single-icon"><i
								class="fa fa-user-circle-o" aria-hidden="true"></i></a>
						</div>
						<div class="sinlge-bar shopping">
							<a href="#" class="single-icon"><i class="ti-bag"></i> <span
								class="total-count">2</span></a>
							<!-- Shopping Item -->
							<div class="shopping-item">
								<div class="dropdown-cart-header">
									<span>2 Items</span> <a href="#">View Cart</a>
								</div>
								<ul class="shopping-list">
									<li><a href="#" class="remove" title="Remove this item"><i
											class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
											src="https://via.placeholder.com/70x70" alt="#"></a>
										<h4>
											<a href="#">Woman Ring</a>
										</h4>
										<p class="quantity">
											1x - <span class="amount">$99.00</span>
										</p></li>
									<li><a href="#" class="remove" title="Remove this item"><i
											class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
											src="https://via.placeholder.com/70x70" alt="#"></a>
										<h4>
											<a href="#">Woman Necklace</a>
										</h4>
										<p class="quantity">
											1x - <span class="amount">$35.00</span>
										</p></li>
								</ul>
								<div class="bottom">
									<div class="total">
										<span>Total</span> <span class="total-amount">$134.00</span>
									</div>
									<a href="checkout.html" class="btn animate">Checkout</a>
								</div>
							</div>
							<!--/ End Shopping Item -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header Inner -->
	<div class="header-inner">
		<div class="container">
			<div class="cat-nav-head">
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-9 col-12">
						<div class="menu-area">
							<!-- Main Menu -->
							<nav class="navbar navbar-expand-lg">
								<div class="navbar-collapse">
									<div class="nav-inner">
										<ul class="nav main-menu menu navbar-nav">
										<!-- 화면 위쪽에 나오는 Bar -->
											<li><a href="/templet/shop-grid" class="titlePadding">영화</a>
												<ul class="dropdown">
													<li><a href="blog-single-sidebar.html">베스트</a></li>
													<li><a href="blog-single-sidebar.html">신작</a></li>
													<li><a href="blog-single-sidebar.html">상영작</a></li>
												</ul>
											</li>
											<li><a href="/book/bookingView" class="titlePadding">예매</a>
												<ul class="dropdown">
													<li><a href="blog-single-sidebar.html">예매하기</a></li>
													<li><a href="blog-single-sidebar.html">상영 시간표</a></li>
												</ul>
											</li>
											<li><a href="/templet/blog-single-sidebar" class="titlePadding">영화관</a>
												<ul class="dropdown">
													<li><a href="blog-single-sidebar.html">서울</a></li>
													<li><a href="blog-single-sidebar.html">울산</a></li>
												</ul>
											</li>
											<li><a href="/templet/contact" class="titlePadding">이벤트</a>
												<ul class="dropdown">
													<li><a href="blog-single-sidebar.html">진행 이벤트</a></li>
													<li><a href="blog-single-sidebar.html">종료 이벤트</a></li>
												</ul></li>
											<li><a href="/templet/cart" class="titlePadding">스토어</a>
												<ul class="dropdown">
													<li><a href="blog-single-sidebar.html">스낵</a></li>
													<li><a href="blog-single-sidebar.html">음료</a></li>
												</ul></li>
<!-- 											<span class="new">New</span> -->
										
<!-- 												<ul class="dropdown"> -->
<!-- 													<li><a href="shop-grid.html">Shop Grid</a></li> -->
<!-- 													<li><a href="cart.html">Cart</a></li> -->
<!-- 													<li><a href="checkout.html">Checkout</a></li> -->
<!-- 												</ul></li> -->
<!-- 											<li><a href="#">Pages</a></li> -->
<!-- 											<li><a href="#">Blog<i class="ti-angle-down"></i></a> -->
<!-- 												<ul class="dropdown"> -->
<!-- 													<li><a href="blog-single-sidebar.html">Blog Single -->
<!-- 															Sidebar</a></li> -->
<!-- 												</ul></li> -->
<!-- 											<li><a href="contact.html">Contact Us</a></li> -->
<!-- 										</ul> -->
										</ul>
									</div>
								</div>
							</nav>
							<!--/ End Main Menu -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ End Header Inner -->
</header>
<!--/ End Header -->