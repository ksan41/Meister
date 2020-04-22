package com.meister.common;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

//String -> java.sql.Date로 변경
public class StringToDate {
	
	public static Date stringToDate(String date) {
		
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-mm-dd");
		
		
		java.util.Date tempDate = null;
		try {
			tempDate = dFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		
		java.sql.Date sqlDate = new java.sql.Date(tempDate.getTime());
 
        return sqlDate;
		
	}
}
