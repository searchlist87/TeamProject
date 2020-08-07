<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../include/bootstrap.jsp" %>
<%@ include file="../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../include/header.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<style>
	body {
		text-align: center;
	}
	table {
		border-collapse: separate;
		border-spacing: 20px 20px ;
		width: 80%;
		margin: auto;
	}
	td {
		text-align: center;
		border: 1px solid;
		border-radius: 40% 40% 0% 0%;
	}
	th {
		text-align: center;
	}
</style>
<script>
$(function() {
	
	var list = '${jArray}';
	var parList = JSON.parse(list);
	var tr;
	var index = 1;
	var personnel = 0;
	var now_personnel = 0;
	var movie_money = "${movie_money_vo.movie_money}";
	var total_money = 0;
	
	// 테이블 만들기
	$.each(parList, function() {
		var schedule_seat_code = (this).schedule_seat_code;
		var movie_time_code = (this).movie_time_code;
		var movie_seat_num = (this).movie_seat_num;
		var seat_code = (this).seat_code;
		var screen_seat_row = (this).screen_seat_row;
		var screen_seat_col = (this).screen_seat_col;
		var seat_check = (this).seat_check;
		// 행의 시작
		if(index == 1) {
	    	tr += "<tr class='modal_tr'>";
		}
		tr += "<td ";
		
		// 구매한 좌석이라면 배경색 변경
		if(seat_check == "Y") {
			tr += " style='background-color:#ccc;'";
		} else {
			tr += " class='seat' style='cursor: pointer;'";
		}
		
		tr +=" data-schedule-seat-code='"+schedule_seat_code+"'>"+seat_code+"</td>";
		index++;
		// 행의 종료
		if(index > screen_seat_row) {
			tr += "</tr>";
			index = 1;
		}
	});
	
	$("#seat_tbody").append(tr);
	
	// 마이너스 버튼
	$("#btn_minus").click(function() {
		if(personnel == 0) {
			return false;
		}
		personnel--;
		$("#prs").text(personnel);
		total_money = movie_money * personnel;
		$("#movie_money").text(total_money + "원");
	});
	
	// 플러스 버튼
	$("#btn_plus").click(function() {
		if(personnel == 8) {
			alert("최대 8명까지 구매 가능합니다.");
			return false;
		}
		personnel++;
		$("#prs").text(personnel);
		total_money = movie_money * personnel;
		$("#movie_money").text(total_money + "원");
	});
	
	// 좌석을 선택했을 때
	$("#seat_tbody").on("click", ".seat", function() {
		if(personnel == 0) {
			alert("인원을 선택해주세요.");
			return false;
		}
		if(now_personnel == personnel) {
			alert("최대 인원을 넘으셨습니다.");
			return false;
		}
		now_personnel++;
		$(this).css("background-color", "red").css("color", "white");
		$(this).removeAttr("class").addClass("choice_seat");
		var schedule_seat_code = $(this).attr("data-schedule-seat-code");
		var schedule_seat_text = $(this).text();
		$(this).attr("data-choice-code", "choice_code"+now_personnel);
		$(this).attr("data-choice-text", "choice_text"+now_personnel);
		
		var hidden_input_code = "<input type='hidden' id='choice_code"+now_personnel+"' class='choice' name='schedule_code_arr' value='"+schedule_seat_code+"'>";
		var hidden_input_text = "<input type='hidden' id='choice_text"+now_personnel+"' class='choice' name='schedule_text_arr' value='"+schedule_seat_text+"'>";
		$("#frmPayment").append(hidden_input_code);
		$("#frmPayment").append(hidden_input_text);
	});
	
	// 이미 선택된 좌석을 다시 선택했을 때
	$("#seat_tbody").on("click", ".choice_seat", function() {
// 		$("#choice" + now_personnel).remove();
		var code = $(this).attr("data-choice-code");
		var text = $(this).attr("data-choice-text");
		$("#"+code).remove();
		$("#"+text).remove();
		now_personnel--;
		$(this).css("background-color", "white").css("color", "black");
		$(this).removeAttr("class").addClass("seat");
	});
	
	$("#btnPayMent").click(function() {
		var prs_num = $("#prs").text();
		
		if(prs_num < 1) {
			alert("인원을 정해주세요.");
			return false;
		}
		
		if(personnel != now_personnel) {
			alert("현재 정하신 인원과 좌석의 수가 맞지 않습니다. 다시 확인해주세요.");
			return false;
		}
		
		$("#personnel").val(prs_num);
		$("#frmPayment").submit();
	});
});
</script>
</head>
<form id="frmPayment" action="/sgh/payment/requestPayment" method="post">
	<input type="hidden" id="personnel" name="personnel">
</form>
<body class="js">
	<!-- Breadcrumbs -->
	<div class="breadcrumbs" style="background-color: #F2F2F2;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div>
						<h1>좌석 선택</h1>
						<label style="float: left; font-size: 20px;">인원</label>
						<span style="float: left; font-size: 20px;">
							<button type="button" id="btn_minus">-</button>
							<strong id="prs">0</strong>
							<button type="button" id="btn_plus">+</button>
						</span>
					</div>
					<div>
						<br/><span style="clear: both; font-size: 20px; float: left;"><strong id="movie_money">0원</strong></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="margin-top: 100px; margin-bottom: 100px;">
			<table id="table_seat">
				<tbody id="seat_tbody">
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
			<div>
				<button id="btnPayMent"type="button" class="btn">결제하기</button>
				<button type="button" class="btn">취소</button>
			</div>
		</div>
	</div>
</div>

	<%@ include file="../../../include/footer.jsp" %>		
	
</body>
</html>