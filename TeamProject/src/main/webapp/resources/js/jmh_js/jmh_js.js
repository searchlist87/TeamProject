/**
 미혜
 */
//
function check(year,month,day) {
	if(month < 10) {
		month = "0" + month; 
	}
	if(day < 10) {
		day = "0" + day; 
	}
	var data_total_date = year + "/" + month + "/" + day; 
	return data_total_date;
}