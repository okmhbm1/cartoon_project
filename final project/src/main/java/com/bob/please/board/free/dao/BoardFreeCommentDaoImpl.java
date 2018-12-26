package com.bob.please.board.free.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.please.board.free.dto.BoardFreeCommentDto;


@Repository
public class BoardFreeCommentDaoImpl implements BoardFreeCommentDao{
	@Autowired
	private SqlSession session;

	
	@Override
	public void insert(BoardFreeCommentDto dto) {
		session.insert("boardfreecomment.insert", dto);
		
	}

	@Override
	public int getSequence() {
	
		return session.selectOne("boardfreecomment.getSequence");
	}

	@Override
	public void update(BoardFreeCommentDto dto) {
	
		session.update("boardfreecomment.update", dto);
	}

	@Override
	public List<BoardFreeCommentDto> getList(int ref_group) {
	
		return session.selectList("boardfreecomment.getList", ref_group);
	}

	@Override
	public void delete(int num) {
	
		session.delete("boardfreecomment.delete", num);
	}

}
