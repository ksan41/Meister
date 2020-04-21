package com.meister.menu.model.vo;

public class Side {
	
	private int sideNo;					// 사이드번호
	private String sideName;			// 사이드명
	private String sideImg;				// 사이드 이미지 경로 + 이미지파일명
	private int sidePrice;				// 사이드 가격
	private String sideContent;			// 사이드 설명
	private String sideTopping;			// 사이드 토핑 설명
	private String sideOrigin;			// 사이드 원산지
	
	
	public Side() {
		
	}


	public Side(int sideNo, String sideName, String sideImg, int sidePrice, String sideContent, String sideTopping,
			String sideOrigin) {
		super();
		this.sideNo = sideNo;
		this.sideName = sideName;
		this.sideImg = sideImg;
		this.sidePrice = sidePrice;
		this.sideContent = sideContent;
		this.sideTopping = sideTopping;
		this.sideOrigin = sideOrigin;
	}


	public int getSideNo() {
		return sideNo;
	}


	public void setSideNo(int sideNo) {
		this.sideNo = sideNo;
	}


	public String getSideName() {
		return sideName;
	}


	public void setSideName(String sideName) {
		this.sideName = sideName;
	}


	public String getSideImg() {
		return sideImg;
	}


	public void setSideImg(String sideImg) {
		this.sideImg = sideImg;
	}


	public int getSidePrice() {
		return sidePrice;
	}


	public void setSidePrice(int sidePrice) {
		this.sidePrice = sidePrice;
	}


	public String getSideContent() {
		return sideContent;
	}


	public void setSideContent(String sideContent) {
		this.sideContent = sideContent;
	}


	public String getSideTopping() {
		return sideTopping;
	}


	public void setSideTopping(String sideTopping) {
		this.sideTopping = sideTopping;
	}


	public String getSideOrigin() {
		return sideOrigin;
	}


	public void setSideOrigin(String sideOrigin) {
		this.sideOrigin = sideOrigin;
	}


	@Override
	public String toString() {
		return "Side [sideNo=" + sideNo + ", sideName=" + sideName + ", sideImg=" + sideImg + ", sidePrice=" + sidePrice
				+ ", sideContent=" + sideContent + ", sideTopping=" + sideTopping + ", sideOrigin=" + sideOrigin + "]";
	}
	
	

}
