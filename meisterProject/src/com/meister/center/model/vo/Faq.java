package com.meister.center.model.vo;

public class Faq {
	
	private int faqNo;				// FAQ번호
	private String faqType;			// FAQ타입
	private String faqQuestion;		// 질문
	private String faqAnswer;		// 답변
	
	public Faq() {}
	
	public Faq(int faqNo, String faqType, String faqQuestion, String faqAnswer) {
		super();
		this.faqNo = faqNo;
		this.faqType = faqType;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
	}
	
	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqType() {
		return faqType;
	}

	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}

	public String getFaqQuestion() {
		return faqQuestion;
	}

	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}

	public String getFaqAnswer() {
		return faqAnswer;
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqType=" + faqType + ", faqQuestion=" + faqQuestion + ", faqAnswer="
				+ faqAnswer + "]";
	}
	
	

}
