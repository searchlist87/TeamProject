/**
 * 
 */

// 받아온 데이터를 날짜 형식으로 바꿈(159543953 -> 2020:00:00)
function dateString(timestamp) {
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var hour = d.getHours();
	var minute = d.getMinutes();
	var second = d.getSeconds();
	var str_date = year + "-" + zeroPlus(month) + "-" + zeroPlus(date) + " " + zeroPlus(hour) + ":" + zeroPlus(minute) + ":" + zeroPlus(second);
	return str_date;
}

// 10미만은 0붙임
function zeroPlus(num) {
	return (num < 10) ? "0" + num : num;
}

/* 날짜 들어오는 길이를 벗어난 YYYY-MM-DD HH24:MI로 변환 시키기 */
function timestmap_change(date) {
	var last_index = date.lastIndexOf(":");
	return date.substring(0, last_index);
}

/* HH24:MI로 변환 시키기 */
function hh24_mi_change(date) {
	var start_index = date.lastIndexOf(" ");
	var last_index = date.lastIndexOf(":");
	return date.substring(start_index, last_index);
}

/* 날짜 들어오는거 YYYY-MM-DD HH24:MI:SS로 변환 시키기 */
function timestmap_ss(time) {
	var last_index = time.lastIndexOf(".");
	return time.substring(0, last_index);
}

//10미만 0 붙이기
function zeroPlus(num) {
	return (num < 10) ? "0" + num : num;
}

function strDay(day) {
	var str_day;
	
	switch (day) {
	case 0:
		str_day = "일요일";
		break;
	case 1:
		str_day = "월요일";
		break;
	case 2:
		str_day = "화요일";
		break;
	case 3:
		str_day = "수요일";
		break;
	case 4:
		str_day = "목요일";
		break;
	case 5:
		str_day = "금요일";
		break;
	case 6:
		str_day = "토요일";
		break;
	}
	
	return str_day;
}