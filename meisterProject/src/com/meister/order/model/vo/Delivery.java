package com.meister.order.model.vo;

/**
 * @author cocod
 *
 */
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
	private String deliveryStatus;	// 사용여부
	private String deliveryMethod;	// 배달포장여부

	// 타 테이블 컬럼
	private String branchName; 		// 지점이름
	private String branchPhone;		// 지점전화번호
	
	// 타 테이블 컬럼
	private int orderNo;
	private String branchAddress;	// 지점주소
	
	
	
	public Delivery() {
		
	}

	public Delivery(int memberNo, String deliveryName, String newAddress1, String newAddress2, String branchName,
			String branchPhone) {
		super();
		this.memberNo = memberNo;
		this.deliveryName = deliveryName;
		this.newAddress1 = newAddress1;
		this.newAddress2 = newAddress2;
		this.branchName = branchName;
		this.branchPhone = branchPhone;
	}

	public Delivery(String newAddress1, String newAddress2, String newPoCode,
			String deliveryName, int branchNo, int memberNo, String referenceAddress) {
		super();
		this.newAddress1 = newAddress1;
		this.newAddress2 = newAddress2;
		this.newPoCode = newPoCode;
		this.addressStatus = addressStatus;
		this.deliveryName = deliveryName;
		this.branchNo = branchNo;
		this.memberNo = memberNo;
		this.referenceAddress = referenceAddress;
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
	
	public Delivery(String deliveryMethod, String branchName, String branchPhone, int orderNo, String branchAddress) {
		super();
		this.deliveryMethod = deliveryMethod;
		this.branchName = branchName;
		this.branchPhone = branchPhone;
		this.orderNo = orderNo;
		this.branchAddress = branchAddress;
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
	
	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchPhone() {
		return branchPhone;
	}

	public void setBranchPhone(String branchPhone) {
		this.branchPhone = branchPhone;
	}
	

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getDeliveryMethod() {
		return deliveryMethod;
	}

	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getBranchAddress() {
		return branchAddress;
	}

	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", newAddress1=" + newAddress1 + ", newAddress2=" + newAddress2
				+ ", newPoCode=" + newPoCode + ", addressStatus=" + addressStatus + ", deliveryName=" + deliveryName
				+ ", branchNo=" + branchNo + ", memberNo=" + memberNo + ", referenceAddress=" + referenceAddress
				+ ", branchName=" + branchName + ", branchPhone=" + branchPhone + "]";
	}

}

