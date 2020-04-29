package com.meister.order.model.vo;

import java.sql.Date;

public class Payment {
	
	private int paymentNo;
	private Date paymentDate;
	private int paymentPrice;
	private String paymentType;
	private String paymentDefault;
	private int receiptNo;
	
	public Payment() {}


	public Payment(int paymentNo, Date paymentDate, int paymentPrice, String paymentType, String paymentDefault,
			int receiptNo) {
		super();
		this.paymentNo = paymentNo;
		this.paymentDate = paymentDate;
		this.paymentPrice = paymentPrice;
		this.paymentType = paymentType;
		this.paymentDefault = paymentDefault;
		this.receiptNo = receiptNo;
	}


	public int getPaymentNo() {
		return paymentNo;
	}


	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}


	public Date getPaymentDate() {
		return paymentDate;
	}


	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}


	public int getPaymentPrice() {
		return paymentPrice;
	}


	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}


	public String getPaymentType() {
		return paymentType;
	}


	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}


	public String getPaymentDefault() {
		return paymentDefault;
	}


	public void setPaymentDefault(String paymentDefault) {
		this.paymentDefault = paymentDefault;
	}


	public int getReceiptNo() {
		return receiptNo;
	}


	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}


	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", paymentDate=" + paymentDate + ", paymentPrice=" + paymentPrice
				+ ", paymentType=" + paymentType + ", paymentDefault=" + paymentDefault + ", receiptNo=" + receiptNo
				+ "]";
	}
	
	

}
