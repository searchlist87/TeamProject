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