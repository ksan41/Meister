package com.meister.menu.model.vo;

public class AddCart {
	private int cartOrderNo;
	private String cartPizzaSize;	// insertPizza 피자사이즈번호
	private String cartPizzaNo;		// insertPizza 피자번호
	private String cartPizzaAmount;	// insertPizza 피자수량
	private String cartDough;		// insertPizza 도우번호
	private String cartSideNo;		// insertPizza 사이드번호
	private	String cartSideAmount;	// insertPizza 사이드수량
	private String cartEtcNo;		// insertPizza etc번호
	private String cartEtcAmount;	// insertPizza etc수량
	
	public AddCart() {
		
	}
	
	

	public AddCart(String cartPizzaSize, String cartPizzaNo, String cartPizzaAmount, String cartDough,
			String cartSideNo, String cartSideAmount, String cartEtcNo, String cartEtcAmount) {
		super();
		this.cartPizzaSize = cartPizzaSize;
		this.cartPizzaNo = cartPizzaNo;
		this.cartPizzaAmount = cartPizzaAmount;
		this.cartDough = cartDough;
		this.cartSideNo = cartSideNo;
		this.cartSideAmount = cartSideAmount;
		this.cartEtcNo = cartEtcNo;
		this.cartEtcAmount = cartEtcAmount;
	}



	public AddCart(int cartOrderNo, String cartPizzaSize, String cartPizzaNo, String cartPizzaAmount, String cartDough,
			String cartSideNo, String cartSideAmount, String cartEtcNo, String cartEtcAmount) {
		super();
		this.cartOrderNo = cartOrderNo;
		this.cartPizzaSize = cartPizzaSize;
		this.cartPizzaNo = cartPizzaNo;
		this.cartPizzaAmount = cartPizzaAmount;
		this.cartDough = cartDough;
		this.cartSideNo = cartSideNo;
		this.cartSideAmount = cartSideAmount;
		this.cartEtcNo = cartEtcNo;
		this.cartEtcAmount = cartEtcAmount;
	}

	public int getCartOrderNo() {
		return cartOrderNo;
	}

	public void setCartOrderNo(int cartOrderNo) {
		this.cartOrderNo = cartOrderNo;
	}

	public String getCartPizzaSize() {
		return cartPizzaSize;
	}

	public void setCartPizzaSize(String cartPizzaSize) {
		this.cartPizzaSize = cartPizzaSize;
	}

	public String getCartPizzaNo() {
		return cartPizzaNo;
	}

	public void setCartPizzaNo(String cartPizzaNo) {
		this.cartPizzaNo = cartPizzaNo;
	}

	public String getCartPizzaAmount() {
		return cartPizzaAmount;
	}

	public void setCartPizzaAmount(String cartPizzaAmount) {
		this.cartPizzaAmount = cartPizzaAmount;
	}

	public String getCartDough() {
		return cartDough;
	}

	public void setCartDough(String cartDough) {
		this.cartDough = cartDough;
	}

	public String getCartSideNo() {
		return cartSideNo;
	}

	public void setCartSideNo(String cartSideNo) {
		this.cartSideNo = cartSideNo;
	}

	public String getCartSideAmount() {
		return cartSideAmount;
	}

	public void setCartSideAmount(String cartSideAmount) {
		this.cartSideAmount = cartSideAmount;
	}

	public String getCartEtcNo() {
		return cartEtcNo;
	}

	public void setCartEtcNo(String cartEtcNo) {
		this.cartEtcNo = cartEtcNo;
	}

	public String getCartEtcAmount() {
		return cartEtcAmount;
	}

	public void setCartEtcAmount(String cartEtcAmount) {
		this.cartEtcAmount = cartEtcAmount;
	}

	@Override
	public String toString() {
		return "AddCart [cartOrderNo=" + cartOrderNo + ", cartPizzaSize=" + cartPizzaSize + ", cartPizzaNo="
				+ cartPizzaNo + ", cartPizzaAmount=" + cartPizzaAmount + ", cartDough=" + cartDough + ", cartSideNo="
				+ cartSideNo + ", cartSideAmount=" + cartSideAmount + ", cartEtcNo=" + cartEtcNo + ", cartEtcAmount="
				+ cartEtcAmount + "]";
	}



	
	
}
