/**
 * 
 */

// 10미만 0 붙이기
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