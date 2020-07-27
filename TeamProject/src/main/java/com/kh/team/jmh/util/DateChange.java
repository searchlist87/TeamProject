package com.kh.team.jmh.util;

public class DateChange {
	
	public static String dateChange(int date) {
		
		String sDate;
		if (date < 10) {
			sDate = "0" + date;
		} else {
			sDate = String.valueOf(date);
		}
		return sDate;
	}

}
