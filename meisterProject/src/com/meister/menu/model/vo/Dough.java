package com.meister.menu.model.vo;

public class Dough {
	
	private int doughNo;		// 도우번호
	private String doughName;	// 도우명
	private int doughAddPrice;	// 추가금액
	
	public Dough() {
		
	}

	public Dough(int doughNo, String doughName, int doughAddPrice) {
		super();
		this.doughNo = doughNo;
		this.doughName = doughName;
		this.doughAddPrice = doughAddPrice;
	}

	public int getDoughNo() {
		return doughNo;
	}

	public void setDoughNo(int doughNo) {
		this.doughNo = doughNo;
	}

	public String getDoughName() {
		return doughName;
	}

	public void setDoughName(String doughName) {
		this.doughName = doughName;
	}

	public int getDoughAddPrice() {
		return doughAddPrice;
	}

	public void setDoughAddPrice(int doughAddPrice) {
		this.doughAddPrice = doughAddPrice;
	}

	@Override
	public String toString() {
		return "Dough [doughNo=" + doughNo + ", doughName=" + doughName + ", doughAddPrice=" + doughAddPrice + "]";
	}
	
	

}
