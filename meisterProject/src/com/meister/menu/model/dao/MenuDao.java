package com.meister.menu.model.dao;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.meister.common.JDBCTemplate.*;
import com.meister.menu.model.vo.Pizza;
import com.meister.notice.model.dao.NoticeDao;

public class MenuDao {
	
	private Properties prop = new Properties();
	
	public MenuDao() {
		
		String filePath = NoticeDao.class.getResource("/sql/notice/noticeQuery.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Pizza> selectPizzaList(Connection conn){
		
		ArrayList<Pizza> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pizzaSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Pizza p = new Pizza();
				p.setPizzaNo(rset.getInt("PIZZA_NO"));
				p.setPizzaName(rset.getString("PIZZA_NAME"));
				p.setPizzaType(rset.getString("PIZZA_TYPE"));
				p.setPizzaImg(rset.getString("PIZZA_IMAGE"));
				p.setPizzaContent(rset.getString("PIZZA_CONTENT"));
				p.setPizzaTopping(rset.getString("PIZZA_TOPPING_CONTENT"));
				p.setPizzaOrigin(rset.getString("PIZZA_ORIGIN"));
				
				list.add(p);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

}
