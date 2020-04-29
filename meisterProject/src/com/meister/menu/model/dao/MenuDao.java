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
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	

	/**산
	 * 통합관리자 - 피자 수정용 dao(PIZZA테이블 UPDATE)
	 * @param conn : MenuService에서 생성된 Connection객체
	 * @param updateP : 수정할 피자 정보가 담긴 Pizza객체
	 * @return : 처리된 행의 개수
	 */
	public int updatePizza(Connection conn,Pizza updateP) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePizza");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateP.getPizzaName());
			pstmt.setString(2, updateP.getPizzaImg());
			pstmt.setString(3, updateP.getPizzaContent());
			pstmt.setString(4, updateP.getPizzaTopping());
			pstmt.setString(5, updateP.getPizzaOrigin());
			pstmt.setInt(6, updateP.getPizzaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	/**산
	 * 통합 - 피자사이즈 수정용 dao(PIZZA_SIZE테이블 UPDATE)
	 * @param conn : MenuService에서 생성된 Connection객체
	 * @param updateSizeM : 수정할 피자 M사이즈 가격정보가 담긴 PizzaSize객체
	 * @param updateSizeL : 수정할 피자 L사이즈 가격정보가 담긴 PizzaSize객체
	 * @return : 처리된 행의 개수
	 */
	public int updatePizzaSize(Connection conn,ArrayList<PizzaSize> psList) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePizzaSize");
		
		try {
			for(int i=0;i<psList.size();i++) {
				PizzaSize ps = psList.get(i);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ps.getPizzaPrice());
				pstmt.setInt(2, ps.getSizeNo());
				pstmt.setInt(3, ps.getPizzaNo());

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	

	/**산
	 * 통합관리자-피자등록(Pizza)
	 * @param conn : Service에서 생성한 Connection객체
	 * @param p : PIZZA테이블에 INSERT할 Pizza객체
	 * @return : 처리된 행의개수
	 */
	public int insertMenuPizza(Connection conn,Pizza p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMenuPizza");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPizzaName());
			pstmt.setString(2, p.getPizzaType());
			pstmt.setString(3, p.getPizzaImg());
			pstmt.setString(4, p.getPizzaContent());
			pstmt.setString(5, p.getPizzaTopping());
			pstmt.setString(6, p.getPizzaOrigin());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	/**산
	 * 통합관리자-피자등록(피자사이즈)
	 * @param conn : Service에서 생성한 Connection객체
	 * @param psList : PIZZA_SIZA에 INSERT할 PizzaSize객체(M사이즈,L사이즈)
	 * @return : 처리된 행의 개수
	 */
	public int insertMenuPizzaSize(Connection conn, ArrayList<PizzaSize> psList) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMenuPizzaSize");
		
		try {

			for (int i = 0; i < psList.size(); i++) {
				PizzaSize ps = psList.get(i);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ps.getPizzaPrice());
				pstmt.setString(2, ps.getPizzaSize());

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**산
	 * 통합관리자- 피자 삭제용 dao
	 * @param conn : service에서 생성된 Connection객체
	 * @param pno : 삭제할 피자번호
	 * @return : 처리된 행의개수
	 */
	public int deletePizza(Connection conn,int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = 
		
	}
}
