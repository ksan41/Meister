package com.meister.coupon.model.vo;

import java.sql.Date;

public class Coupon {
	
	private int couponNo;			// 쿠폰번호
	private String couponName;		// 쿠폰명
	private double couponDiscount;	// 할인율
	private Date couponStart;		// 시작기간
	private Date couponEnd;			// 종료기간
	private Date couponRegisterDate;// 등록일
	private Date couponModifyDate;	// 수정일
	
	
	public Coupon() {}


	public Coupon(int couponNo, String couponName, double couponDiscount, Date couponStart, Date couponEnd,
			Date couponRegisterDate, Date couponModifyDate) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponDiscount = couponDiscount;
		this.couponStart = couponStart;
		this.couponEnd = couponEnd;
		this.couponRegisterDate = couponRegisterDate;
		this.couponModifyDate = couponModifyDate;
	}
	

	public Coupon(int couponNo, String couponName, Date couponStart, Date couponEnd) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponStart = couponStart;
		this.couponEnd = couponEnd;
	}


	public int getCouponNo() {
		return couponNo;
	}


	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}


	public String getCouponName() {
		return couponName;
	}


	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}


	public double getCouponDiscount() {
		return couponDiscount;
	}


	public void setCouponDiscount(double couponDiscount) {
		this.couponDiscount = couponDiscount;
	}


	public Date getCouponStart() {
		return couponStart;
	}


	public void setCouponStart(Date couponStart) {
		this.couponStart = couponStart;
	}


	public Date getCouponEnd() {
		return couponEnd;
	}


	public void setCouponEnd(Date couponEnd) {
		this.couponEnd = couponEnd;
	}


	public Date getCouponRegisterDate() {
		return couponRegisterDate;
	}


	public void setCouponRegisterDate(Date couponRegisterDate) {
		this.couponRegisterDate = couponRegisterDate;
	}


	public Date getCouponModifyDate() {
		return couponModifyDate;
	}


	public void setCouponModifyDate(Date couponModifyDate) {
		this.couponModifyDate = couponModifyDate;
	}


	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", couponName=" + couponName + ", couponDiscount=" + couponDiscount
				+ ", couponStart=" + couponStart + ", couponEnd=" + couponEnd + ", couponRegisterDate="
				+ couponRegisterDate + ", couponModifyDate=" + couponModifyDate + "]";
	}
	

}
