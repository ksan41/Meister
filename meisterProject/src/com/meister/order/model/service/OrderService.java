package com.meister.order.model.service;

import static com.meister.common.JDBCTemplate.close;
import static com.meister.common.JDBCTemplate.commit;
import static com.meister.common.JDBCTemplate.getConnection;
import static com.meister.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.meister.coupon.model.vo.Coupon;
import com.meister.member.model.vo.Manager;
import com.meister.order.model.dao.OrderDao;
import com.meister.order.model.vo.Delivery;
import com.meister.order.model.vo.Orders;
import com.meister.order.model.vo.Payment;
import com.meister.order.model.vo.Price;

/**
 * @author 최지수
 *
 */
public class OrderService {
	
	/**
	 * @author 곽진아
	 * @param b Delivery vo 객체
	 */
	public int insertAddress(Delivery b) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().insertAddress(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 */
	public ArrayList<Delivery> ShowOrderDeliveryList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Delivery> deliveryList = new OrderDao().ShowOrderDeliveryList(conn, userId);
		
		close(conn);
		//System.out.println("서비스딴 : " + deliveryList.get(0));
		return deliveryList;
	}
	
	/**
	 * @author 곽진아
	 * @param userNo 회원번호
	 */
	public Price ShowBasketList(int userNo){
		Connection conn = getConnection();
		
		Price basket = new OrderDao().ShowBasketList(conn, userNo);
		
		close(conn);
		//System.out.println("서비스딴 : " + deliveryList.get(0));
		return basket;
	}
	
	/**
	 * @author 곽진아
	 * @param userId 회원아이디
	 */
	public String getMemberNo(String userId) {
		Connection conn = getConnection();
		userId = new OrderDao().getMemberNo(conn, userId);
		close(conn);
		return userId;
	}
	
	/*public int deleteAddress(int index) {
		Connection conn = getConnection();
		int result = new OrderDao().deleteAddress(conn, index);
		close(conn);
		return result; 
	}*/
	
	
	
	
	///////////////////지수/////////////////////////
	
	/** 지수
	 * @param orderNo
	 * @return
	 */
	public Delivery selectDeliveryInfo(int orderNo) {
		
		Connection conn = getConnection();
		
		Delivery dInfo = new OrderDao().selectDeliveryInfo(conn, orderNo);
		
		close(conn);
		
		return dInfo;
	}
	
	
	/** 지수
	 * @param memberNo
	 * @return
	 */
	public ArrayList<Coupon> selectCouponInfo(int memberNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Coupon> cInfo = new OrderDao().selectCouponInfo(conn, memberNo);
		
		close(conn);
		
		return cInfo;
	}
	
	
	/** 지수
	 * @param newOrder
	 * @return
	 */
	public int insertOrders(Orders newOrder) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrders(conn, newOrder);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	/** 현영
	 * 결제 api 서비스용
	 * @param pm insert용
	 * @return
	 */
	public int paymentInsert(Payment pm) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().paymentInsert(conn, pm);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
	}
	
	
	
	/** 지수
	 * 지점 번호 조회용 서비스
	 * @param loginManager
	 * @return
	 */
	public int selectBranchNo(Manager loginManager) {
		
		Connection conn = getConnection();
		
		int bno = new OrderDao().selectBranchNo(conn, loginManager);
		
		close(conn);
		
		return bno;
	}
	
	
	
	/** 지수
	 * Price테이블의 주문 컬럼들 조회용 서비스
	 * @param orderList
	 * @return
	 */
	public ArrayList<Price> selectNowPriceList(ArrayList<Orders> orderList){
		
		Connection conn = getConnection();
		
		ArrayList<Price> plist = new OrderDao().selectNowPriceList(conn, orderList);
		
		close(conn);
		
		return plist;
	}
	
	/** 지수
	 * Price테이블의 주문 컬럼들 조회용 서비스
	 * @param orderList
	 * @return
	 */
	public ArrayList<Price> selectPastPriceList(ArrayList<Orders> orderList){
		
		Connection conn = getConnection();
		
		ArrayList<Price> plist = new OrderDao().selectPastPriceList(conn, orderList);
		
		close(conn);
		
		return plist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
///////////////////지수/////////////////////////
	
	
	
	/////////////////////진아//////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
///////////////////진아//////////////////////////////////
	
	
	
	
	
	/////////////////태경/////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////태경//////////////////////////////////////////////////////////////
//////////////////////////연화//////////////////////////////////////////////////////////////
	
	
	/**연화
	 * 지점관리자용 배달 전 주문내역 리스트 조회용 서비스
	 * @return list --> Orders 테이블로 부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Orders> selectMgNowOrderList(int bno){
		
		Connection conn = getConnection();
		
		ArrayList<Orders> list = new OrderDao().selectMgNowOrderList(conn, bno);
		
		close(conn);
		
		return list;
	}
	
	/**연화
	 * 지점관리자용 배달완료 주문내역 리스트 조회용 서비스
	 * @return list --> Orders 테이블로 부터 조회된 데이터들이 담겨있는 ArrayList
	 */
	public ArrayList<Orders> selectMgPastOrderList(int bno){
		
		Connection conn = getConnection();
		
		ArrayList<Orders> list = new OrderDao().selectMgPastOrderList(conn, bno);
		
		close(conn);
		
		return list;
	}
	
	
	
	/**연화
	 * 주문상태 수정용 서비스
	 * @param o		--> 수정하고자하는 Orders 객체
	 * @return		--> 처리된 행의 개수
	 */
	public int updateOrderStatus(Orders o) {
		
		Connection conn = getConnection();
		int result = new OrderDao().updateOrderStatus(conn, o);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
//////////////////////////연화//////////////////////////////////////////////////////////////
}
