package com.bob.please.board.review.dao;

import java.util.List;

import com.bob.please.board.review.dto.BoardReviewDto;




public interface BoardReviewDao {

	public List<BoardReviewDto> getList(BoardReviewDto dto);
	public void insert(BoardReviewDto dto);
	public int getCount(BoardReviewDto dto);
}
