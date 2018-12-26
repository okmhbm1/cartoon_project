package com.bob.please.board.free.dao;

import java.util.List;

import com.bob.please.board.free.dto.BoardFreeDto;

public interface BoardFreeDao {

	public List<BoardFreeDto> getList(BoardFreeDto dto);
	public void insert(BoardFreeDto dto);
	public int getCount(BoardFreeDto dto);
	public BoardFreeDto getData(BoardFreeDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public BoardFreeDto getData(int num);
	public void update(BoardFreeDto dto);
	
}
