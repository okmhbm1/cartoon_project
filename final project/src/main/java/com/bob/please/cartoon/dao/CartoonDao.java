package com.bob.please.cartoon.dao;

import java.util.List;

import com.bob.please.cartoon.dto.CartoonCommentDto;
import com.bob.please.cartoon.dto.CartoonDto;
import com.bob.please.cartoon.dto.CartoonLikeDto;
import com.bob.please.cartoon.dto.SelectCartoonInfoDto;
import com.bob.please.cartoon.dto.onelike_or_dislikeDto;
import com.bob.please.member.dto.member_linkDto;

public interface CartoonDao {

	//모든 만화 select
	public void selectall(CartoonDto dto);
	
	// 만화 리스트 페이지
	public List<CartoonDto> selectlist(CartoonDto dto);
	
	// 추천별 분류
	public List<SelectCartoonInfoDto>select_sort_by_recommend(SelectCartoonInfoDto dto);
		
	//성별 추천 분류
	public List<SelectCartoonInfoDto> select_sort_by_gender(SelectCartoonInfoDto dto);
	
	
	// detail 페이지
	public CartoonDto selectdetail(int num);

	
	// 관리자 페이지에서 카테고리 업데이트
	public void updatecategory(CartoonDto dto);
	
	
	// 별점 댓글 입력
	public void insertcartoonpoint(CartoonCommentDto dto);
	
	
	// 크롤링 1,2
	public void insert(CartoonDto dto);
	public void insert2(CartoonDto dto);
	
	//별점 댓글 리스트
	public List<CartoonCommentDto> selectcartoonpointlist(CartoonCommentDto dto);
	

	// 댓글 추천,비추천할 때 이미 추천,비추천했는지 확인
	int is_selected(onelike_or_dislikeDto dto);
	int is_recommend_selected(CartoonLikeDto dto);
	
	// 추천했을 때 별점 댓글에 추천 수 증가
	public void updategood(CartoonCommentDto dto);
	public void updatebad(CartoonCommentDto dto);
	
	// 추천,비추천 여부 선택
	public void set_selected(onelike_or_dislikeDto dto);
	
	
	//만화 추천수 등록하기
	public void insert_recomm(CartoonLikeDto dto);
	
	//만화 like 업데이트
	public void update_likes(int cartoon_num);
	
	//cartoon hit 업데이트
	public int updatehit(int num);
	
	public List<CartoonDto> selectcategory(CartoonDto dto);
	
	public int is_linked(member_linkDto dto);
	
	//즐겨찾기 저장
	public void insert_member_linkDto(member_linkDto dto);
	
	//즐겨찾기 목록 가져오기
	public List<member_linkDto> select_member_link_all(member_linkDto dto);
	
	public List<CartoonDto> search(String title);
	
	public List<CartoonDto> recommendlist();
	
	public List<CartoonDto> recommendoneweeklist();
	
	//평점 댓글을 달았는가
		public int is_saved(CartoonCommentDto dto);
}
