package com.meister.center.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.meister.center.model.vo.Center;
import com.meister.center.model.vo.CenterImage;


public class CenterDao {
	
	private Properties prop = new Properties();
	
	public CenterDao() {
		String filePath = CenterDao.class.getResource("/sql/center/centerQuery.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int insertInquiry(Connection conn, Center c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCenter");
	}
	
	
	public int insertInquiryImage(Connection conn, CenterImage ci) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCenterImage");
	}

}
