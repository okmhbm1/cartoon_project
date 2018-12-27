package com.bob.please.cartoon.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.please.cartoon.dto.CartoonCommentDto;
import com.bob.please.cartoon.dto.CartoonDto;
import com.bob.please.cartoon.dto.CartoonLikeDto;
import com.bob.please.cartoon.dto.SelectCartoonInfoDto;
import com.bob.please.cartoon.dto.onelike_or_dislikeDto;
import com.bob.please.member.dto.member_linkDto;

@Repository
public class CartoonDaoImpl implements CartoonDao {

	@Autowired
	SqlSession session;
	
	
	
	
	
	
	@Override
	   public void selectall(CartoonDto dto) {
	      session.selectList("cartoon.selectall", dto);
	   }

		//요일별
	   @Override
	   public List<CartoonDto> selectlist(CartoonDto dto) {
	      

		   return session.selectList("cartoon.selectlist",dto);
	   }
	   
	   
	   //추천별
	   @Override
		public List<SelectCartoonInfoDto> select_sort_by_recommend(SelectCartoonInfoDto dto) {
			
			return session.selectList("cartoon.select_sort_by_recommend",dto);
		}

	   //성별 추천별
		@Override
		public List<SelectCartoonInfoDto> select_sort_by_gender(SelectCartoonInfoDto dto) {
			// TODO Auto-generated method stub
			return session.selectList("cartoon.select_sort_by_gender",dto);
		}
		
		

	   @Override
	      public CartoonDto selectdetail(int num) {
	         return session.selectOne("cartoon.selectdetail",num);
	      } 

	

	
	

	@Override
	public void insert(CartoonDto dto) {
		session.insert("cartoon.naver_insert",dto);
	}
	
	@Override
	public void insert2(CartoonDto dto) {
		session.insert("cartoon.naver_insert2",dto);
	}


	
	/* 이거는 관리자 입장에서 장르 업데이트하는것*/
	@Override
	public void updatecategory(CartoonDto dto) {
		session.update("cartoon.updatecategory",dto);
		
	}
	
	
	/**
	 * 
	 *  아래부터는 cartooncommentdto
	 * 
	 */


	@Override
	public void insertcartoonpoint(CartoonCommentDto dto) {
		session.insert("cartoon.insertpoint",dto);
		
	}


	@Override
	public List<CartoonCommentDto> selectcartoonpointlist(CartoonCommentDto dto) {
		return session.selectList("cartoon.selectcartoonpointlist", dto);
		
	}





	@Override
	public void updategood(CartoonCommentDto dto) {
		
		session.update("cartoon.updategood",dto);
	}


	@Override
	public void set_selected(onelike_or_dislikeDto dto) {
		session.insert("cartoon.insertlike",dto);
		
	}


	@Override
	public void updatebad(CartoonCommentDto dto) {
		// TODO Auto-generated method stub
		session.update("cartoon.updatebad",dto);
	}


	@Override
	public int is_selected(String userid) {
		
		return session.selectOne("cartoon.is_selected",userid);
	}
	
	@Override
	public int is_recommend_selected(CartoonLikeDto dto) {
		
		return session.selectOne("cartoon.is_recommend_selected", dto);
	}


	@Override
	public void insert_recomm(CartoonLikeDto dto) {
		session.insert("cartoon.insert_recomm",dto);
		
	}


	@Override
	public void update_likes(int cartoon_num) {
		session.update("cartoon.update_likes",cartoon_num);
	}


	@Override
	public int updatehit(int num) {
		session.update("cartoon.update_hit",num);
		
		return session.selectOne("cartoon.select_hit",num);
	}


	@Override
	public List<CartoonDto> selectcategory(CartoonDto dto) {

		      return session.selectList("cartoon.selectcategory",dto);
				
	}


	@Override
	public int is_linked(member_linkDto dto) {
		
		return session.selectOne("cartoon.is_linked",dto);
	}


	@Override
	public void insert_member_linkDto(member_linkDto dto) {
	
		session.insert("cartoon.insert_member_link",dto);
	}


	@Override
	public List<member_linkDto> select_member_link_all(member_linkDto dto) {
		return session.selectList("cartoon.select_member_link_all", dto);	}

	@Override
	public List<CartoonDto> search(String title) {
		return session.selectList("cartoon.search",title);
	}


	@Override
	   public List<CartoonDto> recommendlist() {
	      return session.selectList("cartoon.recommendlist");
	   }

	   // 메인화면 1주일간 종합 추천 순위 10개 출력
	@Override
	   public List<CartoonDto> recommendoneweeklist() {
	      return session.selectList("cartoon.recommendoneweeklist");
	   }


	


}
