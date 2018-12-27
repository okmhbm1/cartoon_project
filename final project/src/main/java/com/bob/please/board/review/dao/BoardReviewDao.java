package com.bob.please.board.review.dao;

import java.util.List;

import com.bob.please.board.review.dto.BoardReviewDto;



public interface BoardReviewDao {

	public List<BoardReviewDto> getList(BoardReviewDto dto);
	public void insert(BoardReviewDto dto);
	public int getCount(BoardReviewDto dto);
	public BoardReviewDto getData(BoardReviewDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public BoardReviewDto getData(int num);
	public void update(BoardReviewDto dto);
	public List<BoardReviewDto> boardreviewlist();
}
