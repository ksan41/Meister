package com.meister.member.model.vo;

import java.sql.Date;

public class MemberCoupon {

	
	private int couponNo;		// 쿠폰번호
	private int memberNo;		// 회원번호
	private String couponStatus;// 사용여부
	private int receiptNo;		// 주문내역번호
	private Date usedDate;		// 사용일
	
	
	public MemberCoupon() {}


	public MemberCoupon(int couponNo, int memberNo, String couponStatus, int receiptNo, Date usedDate) {
		super();
		this.couponNo = couponNo;
		this.memberNo = memberNo;
		this.couponStatus = couponStatus;
		this.receiptNo = receiptNo;
		this.usedDate = usedDate;
	}


	public int getCouponNo() {
		return couponNo;
	}


	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getCouponStatus() {
		return couponStatus;
	}


	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}


	public int getReceiptNo() {
		return receiptNo;
	}


	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}


	public Date getUsedDate() {
		return usedDate;
	}


	public void setUsedDate(Date usedDate) {
		this.usedDate = usedDate;
	}


	@Override
	public String toString() {
		return "MemberCoupon [couponNo=" + couponNo + ", memberNo=" + memberNo + ", couponStatus=" + couponStatus
				+ ", receiptNo=" + receiptNo + ", usedDate=" + usedDate + "]";
	}
	
	
}
