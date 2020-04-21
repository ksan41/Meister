package com.meister.menu.model.dao;


import static com.meister.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.menu.model.vo.Pizza;
import com.meister.menu.model.vo.PizzaSize;
import com.meister.menu.model.vo.Side;
import com.meister.notice.model.dao.NoticeDao;

public class MenuDao {
	
	private Properties prop = new Properties();
	
	public MenuDao() {
		
		String filePath = NoticeDao.class.getResource("/sql/menu/menuQuery.properties").getPath();
		
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
		String sql = prop.getProperty("pizzaSelectList2");
		
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
	
	public ArrayList<PizzaSize> selectPizzaSizeList(Connection conn){
		
		ArrayList<PizzaSize> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pizzaSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PizzaSize ps = new PizzaSize();
				ps.setSizeNo(rset.getInt("SIZE_NO"));
				ps.setPizzaPrice(rset.getInt("PIZZA_PRICE"));
				ps.setPizzaSize(rset.getString("PIZZA_SIZE"));
				ps.setPizzaNo(rset.getInt("PIZZA_NO"));
				
				list.add(ps);
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
	
	public ArrayList<Side> selectSideList(Connection conn){
		
		ArrayList<Side> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sideSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Side s = new Side();
				s.setSideNo(rset.getInt("SIDE_NO"));
				s.setSideName(rset.getString("SIDE_NAME"));
				s.setSideImg(rset.getString("SIDE_IMAGE"));
				s.setSidePrice(rset.getInt("SIDE_PRICE"));
				s.setSideContent(rset.getString("SIDE_CONTENT"));
				s.setSideTopping(rset.getString("SIDE_TOPPING_CONTENT"));
				s.setSideOrigin(rset.getString("SIDE_ORIGIN"));
				
				list.add(s);
				
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
