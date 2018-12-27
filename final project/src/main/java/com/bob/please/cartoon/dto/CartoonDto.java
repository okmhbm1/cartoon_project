
package com.bob.please.cartoon.dto;



public class CartoonDto {
	   int num;
	      String days;
	      String title;
	      String description; 
	      String painter;
	      String category;
	      
	      int point; 
	      int likes;
	      int hit;
	      String detail_url;
	      String image_url;
	      String portal; 
	      String regdate;
	      int portal_filter; // 네이버, 투믹스를 필터하기 위한 변수, DB와는 상관없음
	      int grades; //종합 점수 저장하기 위한 변수, DB와는 상관없음.
	      int avg;
	      public CartoonDto(){
	         
	      }
	
		public int getAvg() {
			return avg;
		}

		public void setAvg(int avg) {
			this.avg = avg;
		}

		public int getPortal_filter() {
			return portal_filter;
		}

		public void setPortal_filter(int portal_filter) {
			this.portal_filter = portal_filter;
		}

		public CartoonDto(int num, String days, String title, String description, String painter, String category,
				int point, int likes, int hit, String detail_url, String image_url, String portal, String regdate,int portal_filter,int avg) {
			super();
			this.num = num;
			this.days = days;
			this.title = title;
			this.description = description;
			this.painter = painter;
			this.category = category;
			this.point = point;
			this.likes = likes;
			this.hit = hit;
			this.detail_url = detail_url;
			this.image_url = image_url;
			this.portal = portal;
			this.regdate = regdate;
			this.portal_filter=portal_filter;
			this.avg = avg;
		}



		public int getGrades() {
			return grades;
		}

		public void setGrades(int grades) {
			this.grades = grades;
		}

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public String getDays() {
			return days;
		}

		public void setDays(String days) {
			this.days = days;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getPainter() {
			return painter;
		}

		public void setPainter(String painter) {
			this.painter = painter;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public int getPoint() {
			return point;
		}

		public void setPoint(int point) {
			this.point = point;
		}

		public int getLikes() {
			return likes;
		}

		public void setLikes(int likes) {
			this.likes = likes;
		}

		public int getHit() {
			return hit;
		}

		public void setHit(int hit) {
			this.hit = hit;
		}

		public String getDetail_url() {
			return detail_url;
		}

		public void setDetail_url(String detail_url) {
			this.detail_url = detail_url;
		}

		public String getImage_url() {
			return image_url;
		}

		public void setImage_url(String image_url) {
			this.image_url = image_url;
		}

		public String getPortal() {
			return portal;
		}

		public void setPortal(String portal) {
			this.portal = portal;
		}

		public String getRegdate() {
			return regdate;
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

	  
}
