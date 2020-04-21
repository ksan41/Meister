package com.meister.order.model.vo;

public class Delivery {
	private int deliveryNo;			// 배달번호 : PK
	private String newAddress1;		// 기본주소
	private String newAddress2;		// 상세주소
	private String newPoCode;		// 우편번호
	private String addressStatus;	// 기본주소여부
	private String deliveryName; 	// 배달지이름
	private int branchNo;			// 지점번호
	private int memberNo;			// 회원번호
	private String referenceAddress; 	// 참고주소

	public Delivery() {
		
	}

	public Delivery(int deliveryNo, String newAddress1, String newAddress2, String newPoCode, String addressStatus,
			String deliveryName, int branchNo, int memberNo, String referenceAddress) {
		super();
		this.deliveryNo = deliveryNo;
		this.newAddress1 = newAddress1;
		this.newAddress2 = newAddress2;
		this.newPoCode = newPoCode;
		this.addressStatus = addressStatus;
		this.deliveryName = deliveryName;
		this.branchNo = branchNo;
		this.memberNo = memberNo;
		this.referenceAddress = referenceAddress;
	}

	public Delivery(String newPoCode, String newAddress1, String newAddress2, String referenceAddress,
			String deliveryName, int memberNo) {
		super();
		this.newPoCode = newPoCode;
		this.newAddress1 = newAddress1;
		this.newAddress2 = newAddress2;
		this.referenceAddress = referenceAddress;
		this.deliveryName = deliveryName;
		this.memberNo = memberNo;
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public String getNewAddress1() {
		return newAddress1;
	}

	public void setNewAddress1(String newAddress1) {
		this.newAddress1 = newAddress1;
	}

	public String getNewAddress2() {
		return newAddress2;
	}

	public void setNewAddress2(String newAddress2) {
		this.newAddress2 = newAddress2;
	}

	public String getNewPoCode() {
		return newPoCode;
	}

	public void setNewPoCode(String newPoCode) {
		this.newPoCode = newPoCode;
	}

	public String getAddressStatus() {
		return addressStatus;
	}

	public void setAddressStatus(String addressStatus) {
		this.addressStatus = addressStatus;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReferenceAddress() {
		return referenceAddress;
	}

	public void setReferenceAddress(String referenceAddress) {
		this.referenceAddress = referenceAddress;
	}

	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", newAddress1=" + newAddress1 + ", newAddress2=" + newAddress2
				+ ", newPoCode=" + newPoCode + ", addressStatus=" + addressStatus + ", deliveryName=" + deliveryName
				+ ", branchNo=" + branchNo + ", memberNo=" + memberNo + ", referenceAddress=" + referenceAddress + "]";
	}
	
}
