<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function () {
	var changeColor="";
	$(".title_menu").click(function(e) {
		e.preventDefault();
		$(".categor-list > dd").hide(500);
		if(changeColor != "") {
			changeColor.css("color","black");
		}
		changeColor = $(this);
		var sub_open = $(this).attr("data-link");
		
		if(sub_open == "sub_open") {
			$(this).css("color","red");
			var that = $(this).parent().parent().children("dd");
			that.show(500);
		}
	});
});
</script>
<div class="col-lg-3 col-md-4 col-12">
	<div class="shop-sidebar">
			<!-- Single Widget -->
			<div class="single-widget category">
				<h2 class="title">Admin Menu</h2>
				<dl class="categor-list" id="movie_manage" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃영화 관리</a></dt>
					<dd><a href="/admin/admin_movie_list" class="sub_menu">영화 조회</a></dd>
					<dd><a href="/admin/admin_movie_register" class="sub_menu">영화 등록</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃영화관 관리</a></dt>
					<dd><a href="/sgh/admin/movieTheaterList">영화관 조회</a></dd>
					<dd><a href="/sgh/admin/movieTheaterAdd">영화관 등록</a></dd>
				</dl>	
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃상영일정 관리</a></dt>
					<dd><a href="/sgh/admin/schedule/scheduleList">상영 일정조회</a></dd>
					<dd><a href="/sgh/admin/schedule/scheduleRegist">상영 일정등록</a></dd>
					<dd><a href="/sgh/admin/movieTime/movieTimeList">상영 회차조회</a></dd>
					<dd><a href="/sgh/admin/movieTime/movieTimeRegist">상영 회차등록</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃영화 상품관리</a></dt>
					<dd><a href="#">영화 상품조회</a></dd>
					<dd><a href="#">영화 상품등록</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃푸드 상품관리</a></dt>
					<dd><a href="#">푸드 상품조회</a></dd>
					<dd><a href="#">푸드 상품등록</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃좌석 관리</a></dt>
					<dd><a href="#">좌석 조회</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃예매 관리</a></dt>
					<dd><a href="#">예매내역 조회</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃이벤트 관리</a></dt>
					<dd><a href="#">이벤트 조회</a></dd>
					<dd><a href="#">이벤트 등록</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃게시판 관리</a></dt>
					<dd><a href="#">게시판 조회</a></dd>
					<dd><a href="#">게사판 등록</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃리뷰 관리</a></dt>
					<dd><a href="#">리뷰 조회</a></dd>
				</dl>
				<dl class="categor-list" >
					<dt><a href="#" data-link="sub_open" class="title_menu">＃고객 관리</a></dt>
					<dd><a href="#">회원정보 조회</a></dd>
				</dl>
			</div>
			<!--/ End Single Widget -->
	</div>
</div>