package com.meister.menu.model.vo;

public class PizzaSize {
	
	private int sizeNo;				// 사이즈가격번호
	private int pizzaPrice;			// 가격
	private String pizzaSize;		// 사이즈
	private int pizzaNo;			// 피자번호
	
	public PizzaSize() {
		
	}

	public PizzaSize(int sizeNo, int pizzaPrice, String pizzaSize, int pizzaNo) {
		super();
		this.sizeNo = sizeNo;
		this.pizzaPrice = pizzaPrice;
		this.pizzaSize = pizzaSize;
		this.pizzaNo = pizzaNo;
	}

	public int getSizeNo() {
		return sizeNo;
	}

	public void setSizeNo(int sizeNo) {
		this.sizeNo = sizeNo;
	}

	public int getPizzaPrice() {
		return pizzaPrice;
	}

	public void setPizzaPrice(int pizzaPrice) {
		this.pizzaPrice = pizzaPrice;
	}

	public String getPizzaSize() {
		return pizzaSize;
	}

	public void setPizzaSize(String pizzaSize) {
		this.pizzaSize = pizzaSize;
	}

	public int getPizzaNo() {
		return pizzaNo;
	}

	public void setPizzaNo(int pizzaNo) {
		this.pizzaNo = pizzaNo;
	}

	@Override
	public String toString() {
		return "PizzaSize [sizeNo=" + sizeNo + ", pizzaPrice=" + pizzaPrice + ", pizzaSize=" + pizzaSize + ", pizzaNo="
				+ pizzaNo + "]";
	}
	
	
	

}
