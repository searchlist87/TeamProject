package com.kh.team.sgh.util;

import java.util.ArrayList;

public class SghAsciiChangeUtil {

	public static ArrayList<String> row_make(int num) throws Exception {
		ArrayList<String> arrNum = new ArrayList<>();
		int start_ascii = 97;
		int seat_col_ascii = num + start_ascii;
		for(int i = start_ascii; i < seat_col_ascii; i++) {
			String str_seat_col = String.valueOf((char)i);
			System.out.println("str_seat_col :" + str_seat_col);
			arrNum.add(str_seat_col);
		}
		System.out.println("arrNum :" + arrNum);
		return arrNum;
	}
	
	public static ArrayList<String> col_make(int row, int col) throws Exception { 
		
		ArrayList<String> cols = row_make(col);
		ArrayList<String> rws = new ArrayList<>();
		
		for(String c : cols) {
			for(int i = 1; i <= row; i++) {
				String rw = c + i;
				rws.add(rw);
			}
		}
		System.out.println("rws :" + rws);
		return rws;
	}
}
