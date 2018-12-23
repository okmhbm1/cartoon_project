package com.bob.please.member.dto;

public class member_linkDto {

	int num;
	int cartoon_num;
	String userid;
	String detail_url;
	String days;
	
	public member_linkDto() {}

	public member_linkDto(int num, int cartoon_num, String userid, String detail_url, String days) {
		super();
		this.num = num;
		this.cartoon_num = cartoon_num;
		this.userid = userid;
		this.detail_url = detail_url;
		this.days = days;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCartoon_num() {
		return cartoon_num;
	}

	public void setCartoon_num(int cartoon_num) {
		this.cartoon_num = cartoon_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getDetail_url() {
		return detail_url;
	}

	public void setDetail_url(String detail_url) {
		this.detail_url = detail_url;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	
	

}
