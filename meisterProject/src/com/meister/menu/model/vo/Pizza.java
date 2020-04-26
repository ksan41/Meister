package com.meister.menu.model.vo;

import java.sql.Date;

public class Pizza {
	
	private int pizzaNo;			// 피자번호
	private String pizzaName;		// 피자명
	private String pizzaType;		// (1)P: 프리미엄 (2)C: 클래식
	private String pizzaImg;		// 피자이미지 경로+이미지파일명
	private String pizzaContent;	// 피자 설명
	private String pizzaTopping;	// 피자 토핑 설명
	private String pizzaOrigin;		// 원산지
	private Date pizzaEnrollDate;	// 등록일
	private Date pizzaModifyDate;	// 수정일
	
	
	public Pizza() {
		
	}


	public Pizza(int pizzaNo, String pizzaName, String pizzaType, String pizzaImg, String pizzaContent,
			String pizzaTopping, String pizzaOrigin, Date pizzaEnrollDate, Date pizzaModifyDate) {
		super();
		this.pizzaNo = pizzaNo;
		this.pizzaName = pizzaName;
		this.pizzaType = pizzaType;
		this.pizzaImg = pizzaImg;
		this.pizzaContent = pizzaContent;
		this.pizzaTopping = pizzaTopping;
		this.pizzaOrigin = pizzaOrigin;
		this.pizzaEnrollDate = pizzaEnrollDate;
		this.pizzaModifyDate = pizzaModifyDate;
	}


	public int getPizzaNo() {
		return pizzaNo;
	}


	public void setPizzaNo(int pizzaNo) {
		this.pizzaNo = pizzaNo;
	}


	public String getPizzaName() {
		return pizzaName;
	}


	public void setPizzaName(String pizzaName) {
		this.pizzaName = pizzaName;
	}


	public String getPizzaType() {
		return pizzaType;
	}


	public void setPizzaType(String pizzaType) {
		this.pizzaType = pizzaType;
	}


	public String getPizzaImg() {
		return pizzaImg;
	}


	public void setPizzaImg(String pizzaImg) {
		this.pizzaImg = pizzaImg;
	}


	public String getPizzaContent() {
		return pizzaContent;
	}


	public void setPizzaContent(String pizzaContent) {
		this.pizzaContent = pizzaContent;
	}


	public String getPizzaTopping() {
		return pizzaTopping;
	}


	public void setPizzaTopping(String pizzaTopping) {
		this.pizzaTopping = pizzaTopping;
	}


	public String getPizzaOrigin() {
		return pizzaOrigin;
	}


	public void setPizzaOrigin(String pizzaOrigin) {
		this.pizzaOrigin = pizzaOrigin;
	}


	public Date getPizzaEnrollDate() {
		return pizzaEnrollDate;
	}


	public void setPizzaEnrollDate(Date pizzaEnrollDate) {
		this.pizzaEnrollDate = pizzaEnrollDate;
	}


	public Date getPizzaModifyDate() {
		return pizzaModifyDate;
	}


	public void setPizzaModifyDate(Date pizzaModifyDate) {
		this.pizzaModifyDate = pizzaModifyDate;
	}


	@Override
	public String toString() {
		return "Pizza [pizzaNo=" + pizzaNo + ", pizzaName=" + pizzaName + ", pizzaType=" + pizzaType + ", pizzaImg="
				+ pizzaImg + ", pizzaContent=" + pizzaContent + ", pizzaTopping=" + pizzaTopping + ", pizzaOrigin="
				+ pizzaOrigin + ", pizzaEnrollDate=" + pizzaEnrollDate + ", pizzaModifyDate=" + pizzaModifyDate + "]";
	}
	
	
	
	
}
