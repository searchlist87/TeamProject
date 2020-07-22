/**
 * 
 */

/* 날짜 들어오는거 YYYY-MM-DD HH24:MI:SS로 변환 시키기 */
function timestmap_ss(time) {
	var last_index = time.lastIndexOf(".");
	return time.substring(0, last_index);
}