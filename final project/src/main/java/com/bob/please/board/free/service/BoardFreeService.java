package com.bob.please.board.free.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.bob.please.board.free.dto.BoardFreeCommentDto;
import com.bob.please.board.free.dto.BoardFreeDto;

public interface BoardFreeService {
	public void getList(HttpServletRequest request);
	public void saveContent(BoardFreeDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num);
	public void getUpdateData(ModelAndView mView, int num);
	public void updateContent(BoardFreeDto dto);
	
	public void saveComment(HttpServletRequest request);
	public void updateComment(BoardFreeCommentDto dto);
	public void deleteComment(int num);
}
