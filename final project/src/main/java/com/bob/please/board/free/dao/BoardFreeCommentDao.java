package com.bob.please.board.free.dao;

import java.util.List;

import com.bob.please.board.free.dto.BoardFreeCommentDto;

public interface BoardFreeCommentDao {
	public void insert(BoardFreeCommentDto dto);
	public int getSequence();
	public void update(BoardFreeCommentDto dto);
	public List<BoardFreeCommentDto> getList(int ref_group);
	public void delete(int num);
}
