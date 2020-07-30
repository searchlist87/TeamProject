<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.titlePadding {
		width : 100px;
 		text-align : center; 
	}
	.total-count {
		position : absolute;
		top : -7px;
		right : -8px;
		background-color : #f6931d;
		width : 18px;
		height : 18px;
		line-height : 18px;
		text-align : center;
		border-radius : 100%;
		color:#fff;
	}
</style>
<!-- Header -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.0.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script>
$(function() {
	
	$("#bookingView").click(function(e) {
		e.preventDefault();
		var sghPaymentVo = "${sghPaymentVo}";
		var sghChoiceSeatDto = "${sghChoiceSeatDto}";
		if(!(sghPaymentVo == null || sghPaymentVo == "") && !(sghChoiceSeatDto == null || sghChoiceSeatDto == "")) {
			var session_result = confirm("남아있던 예매 과정이 있습니다. 이어서 하시겠습니까?");
			console.log("session_result:",session_result);
			if(session_result == true) {
				location.href = "/sgh/choiceSeat/paymentForm";
				return;
			}
		}
		location.href = "/sgh/book/bookingView";
	});
});
</script>
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
								<c:if test="${user_class == 'admin'}">
									<li><i class="ti-user"></i> <a href="/admin/admin">관리자 페이지</a></li>
								</c:if>
							<c:choose>
								<c:when test="${not empty user_id}">
									<li><i class="ti-user"><label style="color: black; margin-left: 5px;">${user_id}님</label></i></li>
									<li><i class="ti-user"></i> <a href="/sgh/user/logout">로그아웃</a></li>
									<li><i class="ti-user"></i> <a href="/mypage/pageForm">내 정보</a></li>
								</c:when>
								<c:otherwise>
									<li><i class="ti-user"></i> <a href="/sgh/user/joinForm">회원가입</a></li>
									<li><i class="ti-power-off"></i><a href="/team/user">로그인</a></li>
								</c:otherwise>
							</c:choose>
							<li><i class="ti-user"></i> <a href="/customer/customerPage">고객센터</a></li>
							<li><div class="sinlge-bar shopping">
							<i class="ti-bag"></i>
							<a href="/kdh/cart/displayCart?user_id=<%=session.getAttribute("user_id")%>" class="single-icon" style="position:relative;">
							<span class="total-count">2</span></a>
							</div>
							</li>
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
											<li><a href="/team/movieView" class="titlePadding">영화</a>
<!-- 												<ul class="dropdown"> -->
<!-- 													<li><a href="/gsh/movie/bestList">베스트</a></li> -->
<!-- 													<li><a href="/gsh/movie/newList">신작</a></li> -->
<!-- 													<li><a href="/gsh/movie/onairList">상영작</a></li> -->
<!-- 												</ul> -->
											</li>
											<li><a id="bookingView" href="/team/bookingView" class="titlePadding">예매</a>
<!-- 												<ul class="dropdown"> -->
<!-- 													<li><a href="blog-single-sidebar.html">예매하기</a></li> -->
<!-- 													<li><a href="blog-single-sidebar.html">상영 시간표</a></li> -->
<!-- 												</ul> -->
											</li>
											<li><a href="/team/theaterView" class="titlePadding">영화관</a>
<!-- 												<ul class="dropdown"> -->
<!-- 													<li><a href="/team/theaterView">서울</a></li> -->
<!-- 													<li><a href="/team/theaterView">울산</a></li> -->
<!-- 												</ul> -->
											</li>
											<li><a href="/event/eventList" class="titlePadding">이벤트</a>
<!-- 												<ul class="dropdown"> -->
<!-- 													<li><a href="blog-single-sidebar.html">진행 이벤트</a></li> -->
<!-- 													<li><a href="blog-single-sidebar.html">종료 이벤트</a></li> -->
<!-- 												</ul> -->
											</li>
											<li><a href="/team/foodView" class="titlePadding">스토어</a>
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