package com.meister.common;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;

//String -> java.sql.Date로 변경
public class DateTokenizer {
	
	public static String stringToDate(String date) {
		
		StringTokenizer st = new StringTokenizer(date,"-");
		String afterD = "";
		
		while(st.hasMoreTokens()) {
			afterD +=  st.nextToken()+"/";
		}
		
		String result = afterD.substring(0,afterD.length()-1);
		
		return result;
		
		
	}
}
