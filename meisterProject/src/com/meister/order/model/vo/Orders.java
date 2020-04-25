package com.meister.order.model.vo;

import java.sql.Date;

public class Orders {
	
	private int receiptNo;			// 주문내역번호
	private String orderName;		// 이름
	private String orderPhone;		// 연락처
	private String orderRequest;	// 요청사항
	private Date orderDate;			// 주문일
	private String orderStatus;		// 접수상태
	private String deliveryStatus;	// 배달상태
	private String memberStatus;	// 회원/비회원 여부
	private int deliveryNo;			// 배달번호
	private int memberNo;			// 회원번호
	private int cartNo;				// 장바구니번호
	private int orderNo;			// 주문번호
	
	// 타 테이블 컬럼
	private int couponDiscount;		// 할인율
	
	
	public Orders() {}


	public Orders(int receiptNo, String orderName, String orderPhone, String orderRequest, Date orderDate,
			String orderStatus, String deliveryStatus, String memberStatus, int deliveryNo, int memberNo, int cartNo,
			int orderNo) {
		super();
		this.receiptNo = receiptNo;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderRequest = orderRequest;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.deliveryStatus = deliveryStatus;
		this.memberStatus = memberStatus;
		this.deliveryNo = deliveryNo;
		this.memberNo = memberNo;
		this.cartNo = cartNo;
		this.orderNo = orderNo;
	}
	

	public Orders(String orderName, String orderPhone, String orderRequest, Date orderDate, String deliveryStatus,
			int orderNo, int couponDiscount) {
		super();
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderRequest = orderRequest;
		this.orderDate = orderDate;
		this.deliveryStatus = deliveryStatus;
		this.orderNo = orderNo;
		this.couponDiscount = couponDiscount;
	}


	public int getReceiptNo() {
		return receiptNo;
	}


	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}


	public String getOrderName() {
		return orderName;
	}


	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}


	public String getOrderPhone() {
		return orderPhone;
	}


	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}


	public String getOrderRequest() {
		return orderRequest;
	}


	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getDeliveryStatus() {
		return deliveryStatus;
	}


	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}


	public String getMemberStatus() {
		return memberStatus;
	}


	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}


	public int getDeliveryNo() {
		return deliveryNo;
	}


	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getCartNo() {
		return cartNo;
	}


	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	

	public int getCouponDiscount() {
		return couponDiscount;
	}


	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}


	@Override
	public String toString() {
		return "Orders [receiptNo=" + receiptNo + ", orderName=" + orderName + ", orderPhone=" + orderPhone
				+ ", orderRequest=" + orderRequest + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
				+ ", deliveryStatus=" + deliveryStatus + ", memberStatus=" + memberStatus + ", deliveryNo=" + deliveryNo
				+ ", memberNo=" + memberNo + ", cartNo=" + cartNo + ", orderNo=" + orderNo + "]";
	}
	
	

}
