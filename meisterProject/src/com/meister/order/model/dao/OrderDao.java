package com.meister.order.model.dao;

import static com.meister.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.meister.member.model.vo.Member;
import com.meister.order.model.vo.Delivery;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		String filePath = OrderDao.class.getResource("/sql/order/orderQuery.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertAddress(Connection conn, Delivery d) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, d.getDeliveryNo());
			pstmt.setString(2, d.getNewAddress1());
			pstmt.setString(3, d.getNewAddress2());
			pstmt.setString(4, d.getNewPoCode());
			pstmt.setString(5, d.getAddressStatus());
			pstmt.setString(6, d.getDeliveryName());
			pstmt.setInt(7, d.getBranchNo());
			pstmt.setInt(8,  d.getMemberNo());
			pstmt.setString(9, d.getReferenceAddress());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
}
