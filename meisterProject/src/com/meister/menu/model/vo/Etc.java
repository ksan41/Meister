package com.meister.menu.model.vo;

public class Etc {
	
	private int etcNo;			// 기타 번호
	private String etcName;		// 기타 상품명
	private int etcPrice;		// 기타 가격
	private String etcImg;		// 이미지 경로 + 이미지 파일명
	
	
	public Etc() {
		
	}


	public Etc(int etcNo, String etcName, int etcPrice, String etcImg) {
		super();
		this.etcNo = etcNo;
		this.etcName = etcName;
		this.etcPrice = etcPrice;
		this.etcImg = etcImg;
	}


	public int getEtcNo() {
		return etcNo;
	}


	public void setEtcNo(int etcNo) {
		this.etcNo = etcNo;
	}


	public String getEtcName() {
		return etcName;
	}


	public void setEtcName(String etcName) {
		this.etcName = etcName;
	}


	public int getEtcPrice() {
		return etcPrice;
	}


	public void setEtcPrice(int etcPrice) {
		this.etcPrice = etcPrice;
	}


	public String getEtcImg() {
		return etcImg;
	}


	public void setEtcImg(String etcImg) {
		this.etcImg = etcImg;
	}


	@Override
	public String toString() {
		return "Etc [etcNo=" + etcNo + ", etcName=" + etcName + ", etcPrice=" + etcPrice + ", etcImg=" + etcImg + "]";
	}
	
	
	

}
