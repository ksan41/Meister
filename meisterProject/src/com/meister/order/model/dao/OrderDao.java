package com.meister.order.model.dao;

import static com.meister.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meister.coupon.model.vo.Coupon;
import com.meister.member.model.vo.Manager;
import com.meister.order.model.vo.Cart;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Payment;
import com.meister.order.model.vo.Price;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	/**
	 * @author 곽진아
	 */
	public OrderDao() {
		String filePath = OrderDao.class.getResource("/sql/order/orderQuery.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 곽진아
	 * @param d : Delivery vo 객체
	 * @return result : 성공여부 값
	 */
	public int insertAddress(Connection conn, Delivery d) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getNewAddress1());
			pstmt.setString(2, d.getNewAddress2());
			pstmt.setString(3, d.getNewPoCode());
			pstmt.setString(4, d.getDeliveryName());
			pstmt.setInt(5, d.getBranchNo());
			pstmt.setInt(6,  d.getMemberNo());
			pstmt.setString(7, d.getReferenceAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 * @return
	 */
	public ArrayList<Delivery> ShowOrderDeliveryList(Connection conn, String userId) {
		ArrayList<Delivery> deliveryList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeliveryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				deliveryList.add(new Delivery(rset.getInt("MEMBER_NO"),
												rset.getString("DELIVERY_NAME"),
												rset.getString("MEM_ADDRESS1"),
												rset.getString("MEM_ADDRESS2"),
												rset.getString("BRANCH_NAME"),
												rset.getString("BRANCH_PHONE"),
												rset.getString("MEM_PO_CODE"),
												rset.getString("DELIVERY_METHOD")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return deliveryList;
	}
	
	/**
	 * @author 곽진아
	 */
	public Price ShowBasketList(Connection conn, int userNo){
		Price basket = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBasketList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				basket = new Price(rset.getInt("ORDER_NO"),
												rset.getString("PIZZA_SIZE"),
												rset.getString("PIZZA_NO"),
												rset.getString("PIZZA_COUNT"),
												rset.getString("DOUGH_NO"),
												rset.getString("SIDE_NO"),
												rset.getString("SIDE_COUNT"),
												rset.getString("ETC_NO"),
												rset.getString("ETC_COUNT"),
												rset.getInt("CART_NO"));
				//System.out.println("지점1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return basket;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 * @return
	 */
	public String getMemberNo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String memberNo = "";
		
		String sql = prop.getProperty("selectMemberNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getString("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberNo;
	}
	
	public int insertBasketPayment(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
	
		String sql = prop.getProperty("insertBasketPayment");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getOrderNo());
			pstmt.setInt(2,  c.getMemberNo());
			pstmt.setInt(3, c.getTotalPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}//System.out.println("insertBasketPayment Dao까지 왔어" + result);
		return result;
	}
	public Delivery selectDeliveryInfo(Connection conn, int orderNo) {
		
		Delivery dInfo = new Delivery();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeliveryInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				dInfo.setOrderNo(rset.getInt("order_no"));
				dInfo.setDeliveryNo(rset.getInt("delivery_no"));
				dInfo.setMemAddress1(rset.getString("mem_address1"));
				dInfo.setMemAddress2(rset.getString("mem_address2"));
				dInfo.setMemPoCode(rset.getString("mem_po_code"));
				dInfo.setDeliveryMethod(rset.getString("delivery_method"));
				dInfo.setBranchName(rset.getString("branch_name"));
				dInfo.setBranchAddress(rset.getString("branch_address"));
				dInfo.setBranchPhone(rset.getString("branch_phone"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dInfo;
	}
	
	
	// 지수
	public ArrayList<Coupon> selectCouponInfo(Connection conn, int memberNo) {
		
		ArrayList<Coupon> cInfo = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCouponInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cInfo.add(new Coupon(rset.getInt("coupon_no"),
									 rset.getString("coupon_name"),
									 rset.getInt("coupon_discount")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cInfo;
	}
	
	
	// 지수
	public int insertOrders(Connection conn, Orders newOrder) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrders");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newOrder.getOrderName());
			pstmt.setString(2, newOrder.getOrderPhone());
			pstmt.setString(3, newOrder.getOrderRequest());
			pstmt.setInt(4, newOrder.getDeliveryNo());
			pstmt.setInt(5, newOrder.getMemberNo());
			pstmt.setInt(6, newOrder.getCartNo());
			pstmt.setInt(7, newOrder.getOrderNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 현영 
	public int paymentInsert(Connection conn, Payment pm) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("paymentInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pm.getPaymentPrice());
			pstmt.setInt(2, pm.getReceiptNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	// 지수
	public int selectBranchNo(Connection conn, Manager loginManager) {
		
		int bno = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBranchNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginManager.getManagerNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bno = rset.getInt("branch_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bno;
	}
	
	//연화
	public ArrayList<Price> selectPriceList(Connection conn, ArrayList<Orders> orderList){
		
		ArrayList<Price> plist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPriceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<orderList.size(); i++) {
				pstmt.setInt(1, orderList.get(i).getOrderNo());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					plist.add(new Price(rset.getInt("order_no"),
										rset.getString("pizza_size"),
										rset.getString("pizza_no"),
										rset.getString("pizza_count"),
										rset.getString("dough_no"),
										rset.getString("side_no"),
										rset.getString("side_count"),
										rset.getString("etc_no"),
										rset.getString("etc_count")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return plist;
	}
	
	// 연화
	public ArrayList<Price> selectPastPriceList(Connection conn, ArrayList<Orders> orderList){
		
		ArrayList<Price> plist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPastPriceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<orderList.size(); i++) {
				pstmt.setInt(1, orderList.get(i).getOrderNo());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					plist.add(new Price(rset.getInt("order_no"),
										rset.getString("pizza_size"),
										rset.getString("pizza_no"),
										rset.getString("pizza_count"),
										rset.getString("dough_no"),
										rset.getString("side_no"),
										rset.getString("side_count"),
										rset.getString("etc_no"),
										rset.getString("etc_count")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return plist;
	}
	
	public int selectOrdersRno(Connection conn, int mno) {
		
		int rno = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("paymentInsertRno");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rno = rset.getInt("RECEIPT_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rno;
		
		
	}
	
	public ArrayList<Orders> selectMgNowOrderList(Connection conn, int bno){
		
		ArrayList<Orders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMgNowOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Orders o = new Orders();
				o.setReceiptNo(rset.getInt("RECEIPT_NO"));
				o.setOrderName(rset.getString("ORDER_NAME"));
				o.setOrderPhone(rset.getString("ORDER_PHONE"));
				o.setOrderRequest(rset.getString("ORDER_REQUEST"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				o.setOrderStatus(rset.getString("ORDER_STATUS"));
				o.setDeliveryStatus(rset.getString("DELIVERY_STATUS"));
				o.setMemberStatus(rset.getString("MEMBER_STATUS"));
				o.setDeliveryNo(rset.getInt("DELIVERY_NO"));
				o.setMemberNo(rset.getInt("MEMBER_NO"));
				o.setCartNo(rset.getInt("CART_NO"));
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setMemAddress1(rset.getString("MEM_ADDRESS1"));
				o.setMemAddress2(rset.getString("MEM_ADDRESS2"));
				
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Orders> selectMgPastOrderList(Connection conn, int bno){
		
		ArrayList<Orders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMgPastOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Orders o = new Orders();
				o.setReceiptNo(rset.getInt("RECEIPT_NO"));
				o.setOrderName(rset.getString("ORDER_NAME"));
				o.setOrderPhone(rset.getString("ORDER_PHONE"));
				o.setOrderRequest(rset.getString("ORDER_REQUEST"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				o.setOrderStatus(rset.getString("ORDER_STATUS"));
				o.setDeliveryStatus(rset.getString("DELIVERY_STATUS"));
				o.setMemberStatus(rset.getString("MEMBER_STATUS"));
				o.setDeliveryNo(rset.getInt("DELIVERY_NO"));
				o.setMemberNo(rset.getInt("MEMBER_NO"));
				o.setCartNo(rset.getInt("CART_NO"));
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setMemAddress1(rset.getString("MEM_ADDRESS1"));
				o.setMemAddress2(rset.getString("MEM_ADDRESS2"));
				
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateOrderStatus(Connection conn, Orders o) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateOrderStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getReceiptNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateDeliveryStatus(Connection conn, Orders o) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateDeliveryStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getReceiptNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
