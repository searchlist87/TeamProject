<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script></script>
<body>
<!--  대중교통 모달창 -->
<div class="modal fade" id="modal-container-458336" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="align:left;">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 id="myModalLabel" style="padding:20px;">대중교통 안내</h5> 
				<div class="blog-meta" style="padding:20px;border:3px solid #A6A6A6;border-radius:1em;">
					<img src="/resources/images/jmh/bus_small.png" style="float:left;"/>
					<h6 style="padding-top:5px;">버스로 오시는길</h6> 
					
				</div>
				<div class="blog-meta" style="padding:20px;">
					 <h6 style="padding-top:5px;">5번, 6번, 10번, 11번</h6>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!--  end 대중교통 모달창 -->
<!--  주차안내 모달창 -->
<div class="modal fade" id="modal-container-458337" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="align:left;">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 id="myModalLabel" style="padding:20px;">자가용/주차 안내</h5> 
				<div class="blog-meta" style="padding:20px;border:3px solid #A6A6A6;border-radius:1em;">
					<img src="/resources/images/jmh/mycar.png" style="float:left;"/>
					<h6 style="padding-top:5px;">자가용으로 오시는길</h6> 
					
				</div>
				<div class="blog-meta" style="padding:20px;">
					 <h6 style="padding-top:5px;">울산광역시 남구 삼산동</h6>
				</div>
				<div class="blog-meta" style="padding:20px;border:3px solid #A6A6A6;border-radius:1em;">
					<img src="/resources/images/jmh/info.png" style="float:left;"/>
					<h6 style="padding-top:5px;">주차요금 안내</h6> 
					
				</div>
				<div class="blog-meta" style="padding:20px;">
					 <h6 style="padding-top:5px;">허니박스 주차장을 이용하시면 됩니다.</h6>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!--  end 주차안내 모달창 -->
<!--  지도안내 모달창 -->
<div class="modal fade" id="modal-container-458338" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="align:left;">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 id="myModalLabel" style="margin:20px;">지도 안내</h5> 
				<div class="blog-meta" style="padding:20px;border:3px solid #A6A6A6;border-radius:1em;">
					<img src="/resources/images/jmh/mycar.png" style="float:left;"/>
					<h6 style="padding-top:5px;">울산광역시 남구 삼산동</h6> 
					
				</div>
				<div id="map" style="width:1000px;height:400px;posirion:relative"></div>
				<div id="marker" style="position:absolute;"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!--  end 지도안내 모달창 -->
<!--  관람등급안내 모달창 -->
<div class="modal fade" id="modal-container-458339" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="align:left;">
<!-- 				<h5 id="myModalLabel">대중교통 안내</h5>  -->
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 id="myModalLabel" style="padding:20px;">관람등급 안내</h5> 
				<div class="blog-meta">
					<img src="/resources/images/jmh/movie_grade_info_detail.png" style="float:left;"/>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!--  end 관람등급안내 모달창 -->
</body>
</html>