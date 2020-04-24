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

import com.meister.member.model.vo.Member;
import com.meister.menu.model.vo.AddCart;
import com.meister.menu.model.vo.Dough;
import com.meister.menu.model.vo.Etc;
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
	
	public ArrayList<Etc> selectEtcList(Connection conn){
		
		ArrayList<Etc> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("etcSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Etc e = new Etc();
				e.setEtcNo(rset.getInt("Etc_NO"));
				e.setEtcName(rset.getString("Etc_NAME"));
				e.setEtcPrice(rset.getInt("Etc_PRICE"));
				e.setEtcImg(rset.getString("Etc_IMAGE"));
				
				list.add(e);
				
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
	
	public ArrayList<Dough> selectDoughList(Connection conn){
		
		ArrayList<Dough> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("doughSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Dough d = new Dough();
				d.setDoughNo(rset.getInt("DOUGH_NO"));
				d.setDoughName(rset.getString("DOUGH_NAME"));
				d.setDoughAddPrice(rset.getInt("DOUGH_ADD_PRICE"));
				
				list.add(d);
				
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
	
	public ArrayList<Pizza> selectPizzaDetail(Connection conn, int pno){
		
		ArrayList<Pizza> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pizzaDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
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
	
	public ArrayList<PizzaSize> selectPizzaSizeDetail(Connection conn, int pno){
		
		ArrayList<PizzaSize> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pizzaSizeDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
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
	
	public ArrayList<Side> selectSideDetail(Connection conn, int sno){
		
		ArrayList<Side> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("sideDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
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
	
	public int insertAddCart(Connection conn, AddCart a) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPizza");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getCartPizzaSize());
			pstmt.setString(2, a.getCartPizzaNo());
			pstmt.setString(3, a.getCartPizzaAmount());
			pstmt.setString(4, a.getCartDough());
			pstmt.setString(5, a.getCartSideNo());
			pstmt.setString(6, a.getCartSideAmount());
			pstmt.setString(7, a.getCartEtcNo());
			pstmt.setString(8, a.getCartEtcAmount());
			
			result = pstmt.executeUpdate();
			System.out.println("지점1" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
