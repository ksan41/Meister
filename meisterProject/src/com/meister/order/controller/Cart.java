package com.meister.order.controller;

public class Cart {
	private int cartNo;
	private int orderNo;
	private int memberNo;
	private int totalPrice;
	
	public Cart() {}

	public Cart(int cartNo, int orderNo, int memberNo, int totalPrice) {
		super();
		this.cartNo = cartNo;
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.totalPrice = totalPrice;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", orderNo=" + orderNo + ", memberNo=" + memberNo + ", totalPrice="
				+ totalPrice + "]";
	}
	
}
