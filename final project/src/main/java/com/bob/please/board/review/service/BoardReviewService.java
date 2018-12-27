package com.bob.please.board.review.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.bob.please.board.review.dto.BoardReviewCommentDto;
import com.bob.please.board.review.dto.BoardReviewDto;



public interface BoardReviewService {
	public void getList(HttpServletRequest request);
	public void saveContent(BoardReviewDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(BoardReviewDto dto);
	
	public void saveComment(HttpServletRequest request);
	public void updateComment(BoardReviewCommentDto dto);
	public void deleteComment(int num);
	public void boardreviewlist(HttpServletRequest request);
}
