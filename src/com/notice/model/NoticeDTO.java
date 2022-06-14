package com.notice.model;

public class NoticeDTO {
	private int notice_no; // 번호
	private String admin_id; // 작성자 아이디
	private String admin_name; // 작성자 이름
	private String notice_title; // 제목
	private String notice_content; // 내용
	private int notice_hit; // 조회수
	private String notice_date; // 작성일
	private String notice_update; // 수정일

	public int getNotice_no() {
		return notice_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_update() {
		return notice_update;
	}

	public void setNotice_update(String notice_update) {
		this.notice_update = notice_update;
	}

}
