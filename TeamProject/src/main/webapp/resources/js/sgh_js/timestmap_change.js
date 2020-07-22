/**
 * 
 */

/* 날짜 들어오는거 YYYY-MM-DD HH24:MI로 변환 시키기 */
function timestmap_change(date) {
	var last_index = date.lastIndexOf(":");
	return date.substring(0, last_index);
}