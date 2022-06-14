package com.notice.model;

public class InquiryDTO {
	private int ask_no;
	private String ask_userId;
	private String ask_title;
	private String ask_content;
	private String ask_image;
	private String ask_date;
	private String ask_status;
	private String ask_reply;
	private String ask_replyDate;

	public String getAsk_replyDate() {
		return ask_replyDate;
	}

	public void setAsk_replyDate(String ask_replyDate) {
		this.ask_replyDate = ask_replyDate;
	}

	public String getAsk_reply() {
		return ask_reply;
	}

	public void setAsk_reply(String ask_reply) {
		this.ask_reply = ask_reply;
	}

	public String getAsk_status() {
		return ask_status;
	}

	public void setAsk_status(String ask_status) {
		this.ask_status = ask_status;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public String getAsk_userId() {
		return ask_userId;
	}

	public void setAsk_userId(String ask_userId) {
		this.ask_userId = ask_userId;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}

	public String getAsk_image() {
		return ask_image;
	}

	public void setAsk_image(String ask_image) {
		this.ask_image = ask_image;
	}

	public String getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}

}
