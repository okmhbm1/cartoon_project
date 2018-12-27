package com.bob.please.cartoon.dto;

public class CartoonCommentDto {
		   

	int cartoon_num;
	String userid;
	int point;
	int good;
	int notgood;
	String comment;
	String gender;
	int age;
	String param;
	String regdate;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getNotgood() {
		return notgood;
	}
	public void setNotgood(int notgood) {
		this.notgood = notgood;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public CartoonCommentDto(int cartoon_num, String userid, int point, int good, int notgood, String comment,
			String gender, int age, String param,String regdate) {
		super();
		this.cartoon_num = cartoon_num;
		this.userid = userid;
		this.point = point;
		this.good = good;
		this.notgood = notgood;
		this.comment = comment;
		this.gender = gender;
		this.age = age;
		this.param=param;
		this.regdate=regdate;
		
	}

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public CartoonCommentDto() {}
	
}

