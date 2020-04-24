package com.meister.order.model.vo;

public class Price {
	
	private int orderNo;		// 주문번호
	private String pizzaSize;	// 피자사이즈
	private String pizzaNo;		// 피자번호 (1,2)
	private String pizzaCount;	// 피자수량 (1,1)
	private String doughNo;		// 도우번호
	private String sideNo;		// 사이드번호
	private String sideCount;	// 사이드수량
	private String etcNo;		// 기타상품번호
	private String etcCount;	// 기타상품수량
	private int totalPrice;		// 총가격
	
	// 장바구니 (CART) 테이블의 컬럼
	private int cartNo;
	private int memberNo;
	
	public Price() {}

	public Price(int orderNo, String pizzaSize, String pizzaNo, String pizzaCount, String doughNo,
			String sideNo, String sideCount, String etcNo, String etcCount, int cartNo) {
		super();
		this.orderNo = orderNo;
		this.pizzaSize = pizzaSize;
		this.pizzaNo = pizzaNo;
		this.pizzaCount = pizzaCount;
		this.doughNo = doughNo;
		this.sideNo = sideNo;
		this.sideCount = sideCount;
		this.etcNo = etcNo;
		this.etcCount = etcCount;
		this.cartNo = cartNo;
		this.memberNo = memberNo;
	}

	
	public Price(int orderNo, String pizzaSize, String pizzaNo, String pizzaCount, String doughNo, String sideNo,
			String sideCount, String etcNo, String etcCount, int totalPrice, int cartNo, int memberNo) {
		super();
		this.orderNo = orderNo;
		this.pizzaSize = pizzaSize;
		this.pizzaNo = pizzaNo;
		this.pizzaCount = pizzaCount;
		this.doughNo = doughNo;
		this.sideNo = sideNo;
		this.sideCount = sideCount;
		this.etcNo = etcNo;
		this.etcCount = etcCount;
		this.totalPrice = totalPrice;
		this.cartNo = cartNo;
		this.memberNo = memberNo;
	}

	public Price(int orderNo, String pizzaSize,  String pizzaNo, String pizzaCount, String doughNo,
			String sideNo, String sideCount, String etcNo, String etcCount) {
		super();
		this.orderNo = orderNo;
		this.pizzaSize = pizzaSize;
		this.pizzaNo = pizzaNo;
		this.pizzaCount = pizzaCount;
		this.doughNo = doughNo;
		this.sideNo = sideNo;
		this.sideCount = sideCount;
		this.etcNo = etcNo;
		this.etcCount = etcCount;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getPizzaSize() {
		return pizzaSize;
	}


	public void setPizzaSize(String pizzaSize) {
		this.pizzaSize = pizzaSize;
	}



	public String getPizzaNo() {
		return pizzaNo;
	}


	public void setPizzaNo(String pizzaNo) {
		this.pizzaNo = pizzaNo;
	}


	public String getPizzaCount() {
		return pizzaCount;
	}


	public void setPizzaCount(String pizzaCount) {
		this.pizzaCount = pizzaCount;
	}


	public String getDoughNo() {
		return doughNo;
	}


	public void setDoughNo(String doughNo) {
		this.doughNo = doughNo;
	}


	public String getSideNo() {
		return sideNo;
	}


	public void setSideNo(String sideNo) {
		this.sideNo = sideNo;
	}


	public String getSideCount() {
		return sideCount;
	}


	public void setSideCount(String sideCount) {
		this.sideCount = sideCount;
	}


	public String getEtcNo() {
		return etcNo;
	}


	public void setEtcNo(String etcNo) {
		this.etcNo = etcNo;
	}


	public String getEtcCount() {
		return etcCount;
	}


	public void setEtcCount(String etcCount) {
		this.etcCount = etcCount;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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
		return "Price [orderNo=" + orderNo + ", pizzaSize=" + pizzaSize + ", pizzaNo="
				+ pizzaNo + ", pizzaCount=" + pizzaCount + ", doughNo=" + doughNo + ", sideNo=" + sideNo
				+ ", sideCount=" + sideCount + ", etcNo=" + etcNo + ", etcCount=" + etcCount + ", cartNo=" + cartNo
				+ ", memberNo=" + memberNo + "]";
	}

}
