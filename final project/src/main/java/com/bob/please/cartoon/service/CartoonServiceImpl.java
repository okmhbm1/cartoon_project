package com.bob.please.cartoon.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.bob.please.cartoon.dao.CartoonDao;
import com.bob.please.cartoon.dto.CartoonCommentDto;
import com.bob.please.cartoon.dto.CartoonDto;
import com.bob.please.cartoon.dto.CartoonLikeDto;
import com.bob.please.cartoon.dto.SelectCartoonInfoDto;
import com.bob.please.cartoon.dto.onelike_or_dislikeDto;
import com.bob.please.member.dto.member_linkDto;

@Service
public class CartoonServiceImpl implements CartoonService{
	
	@Autowired
	CartoonDao dao;
	
	


	
	
	 @Override
	   public void selectall(CartoonDto dto) {
	   
	      dao.selectall(dto);
	   }




	   @Override
	   public void selectlist(HttpServletRequest request) {
	      CartoonDto dto = new CartoonDto();
	      
	      String days = request.getParameter("days");
	      String title = request.getParameter("title");
	      String image_url = request.getParameter("image_url");
	      
	      String naver=request.getParameter("naver");
		  String toomics=request.getParameter("toomics");
		  
		  
		  if(naver != null && toomics ==null) {
			  System.out.println("1");
			  dto.setPortal_filter(1);  
		  }
		  else if(naver ==null && toomics!=null) {
			  dto.setPortal_filter(2);
			  System.out.println("2");
		  }
		  else if(naver !=null && toomics !=null){
			  dto.setPortal_filter(3);
			  System.out.println("3");
		  }else {
			  System.out.println("4");
		  }
	      dto.setImage_url(image_url);
	      dto.setDays(days);
	      dto.setTitle(title);
	      List<CartoonDto> list=dao.selectlist(dto);
	      request.setAttribute("list", list);
	   }
	   
	   
		@Override
		public void select_sort_by_recommend(HttpServletRequest request) {
			
			SelectCartoonInfoDto dto=new SelectCartoonInfoDto();
			  String naver=request.getParameter("naver");
			  String toomics=request.getParameter("toomics");
			  
			  
			  if(naver != null && toomics ==null) {
				  System.out.println("1");
				  dto.setPortal_filter(1);  
			  }
			  else if(naver ==null && toomics!=null) {
				  dto.setPortal_filter(2);
				  System.out.println("2");
			  }
			  else if(naver !=null && toomics !=null){
				  dto.setPortal_filter(3);
				  System.out.println("3");
			  }else {
				  System.out.println("4");
			  }
			  List<SelectCartoonInfoDto> list=dao.select_sort_by_recommend(dto);
			request.setAttribute("list", list);
		}




		@Override
		public void select_sort_by_gender(HttpServletRequest request) {
			SelectCartoonInfoDto dto=new SelectCartoonInfoDto();
		
			  String naver=request.getParameter("naver");
			  String toomics=request.getParameter("toomics");
			  
			  
			  if(naver != null && toomics ==null) {
				  System.out.println("1");
				  dto.setPortal_filter(1);  
			  }
			  else if(naver ==null && toomics!=null) {
				  dto.setPortal_filter(2);
				  System.out.println("2");
			  }
			  else if(naver !=null && toomics !=null){
				  dto.setPortal_filter(3);
				  System.out.println("3");
			  }else {
				  System.out.println("4");
			  }
			  List<SelectCartoonInfoDto> list=dao.select_sort_by_gender(dto);
			request.setAttribute("list", list);
		}
		
		


	   @Override
	   public CartoonDto selectdetail(ModelAndView mView, int num) {
	      CartoonDto dto =dao.selectdetail(num);
	      int hit=dao.updatehit(num);
	      
	      mView.addObject("hit",hit);
	      mView.addObject("dto",dto);
	      return dto;
	   }
	
	
	
	
	@Override
	public void updatecategory(CartoonDto dto) {
		
		dao.updatecategory(dto);
	}
	
	
	
	
	
	
	
	
	
	@Override
	public void insert(CartoonDto dto) {
		dao.insert(dto);
		
	}

	@Override
	public void insert2(CartoonDto dto) {
		dao.insert2(dto);
		
	}




	@Override
	public void insertcartoonpoint(CartoonCommentDto dto) {
		// TODO Auto-generated method stub
		dao.insertcartoonpoint(dto);
	}




	@Override
	public void selectcartoonpointlist(HttpServletRequest request) {
		CartoonCommentDto dto=new CartoonCommentDto();
		dto.setCartoon_num(Integer.parseInt(request.getParameter("num")));
		List<CartoonCommentDto> list = dao.selectcartoonpointlist(dto);
		request.setAttribute("list", list);
	}




	@Override
	public int is_selected(String userid) {
		
		return dao.is_selected(userid);
	}




	@Override
	public void updategood(CartoonCommentDto dto) {
	
		dao.updategood(dto);
		
	}




	@Override
	public void set_selected(onelike_or_dislikeDto dto) {
		dao.set_selected(dto);
		
	}
	
	  @Override
	   public void selectcategory(HttpServletRequest request) {
	         CartoonDto dto = new CartoonDto();
	         String days = request.getParameter("days");
	         String title = request.getParameter("title");
	         String image_url = request.getParameter("image_url");
	         String naver=request.getParameter("naver");
			  String toomics=request.getParameter("toomics");
			  
			  
			  if(naver != null && toomics ==null) {
				  System.out.println("1");
				  dto.setPortal_filter(1);  
			  }
			  else if(naver ==null && toomics!=null) {
				  dto.setPortal_filter(2);
				  System.out.println("2");
			  }
			  else if(naver !=null && toomics !=null){
				  dto.setPortal_filter(3);
				  System.out.println("3");
			  }else {
				  System.out.println("4");
			  }
		      
	         dto.setImage_url(image_url);
	         dto.setDays(days);
	         dto.setTitle(title);
	         List<CartoonDto> list1=dao.selectcategory(dto);
	         request.setAttribute("list1", list1);
	      
	   } 




	@Override
	public void updatebad(CartoonCommentDto dto) {
		dao.updatebad(dto);
		
	}




	@Override
	public int is_recommend_selected(CartoonLikeDto dto) {
		
		return dao.is_recommend_selected(dto);
	}




	@Override
	public void insert_recomm(CartoonLikeDto dto) {
		dao.insert_recomm(dto);
		
	}




	@Override
	public void update_likes(int cartoon_num) {
		dao.update_likes(cartoon_num);
	}




	//한 회원이 특정 만화를 링크했는가
	@Override
	public int is_linked(member_linkDto dto) {
		return dao.is_linked(dto);
	}




	@Override
	public void insert_member_linkDto(member_linkDto dto) {
		dao.insert_member_linkDto(dto);		
	}




	@Override
	public List<member_linkDto> select_member_link_all(member_linkDto dto) {
		return dao.select_member_link_all(dto);
	}




	@Override
	public void search(String title, HttpServletRequest request) {
		List<CartoonDto> list= dao.search(title);
		request.setAttribute("list", list);
		
		
	}
	
	@Override
	   public void recommendlist(HttpServletRequest request) {
	      
	      List<CartoonDto> list = dao.recommendlist();
	      request.setAttribute("recommendlist", list);
	   }

	@Override
	   public void recommendoneweeklist(HttpServletRequest request) {
	      
	      List<CartoonDto> list = dao.recommendoneweeklist();
	      request.setAttribute("recommendoneweeklist", list);
	      
	   }







	

	
	
}
