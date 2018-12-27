package com.bob.please.board.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.please.board.review.dto.BoardReviewDto;

@Repository
public class BoardReviewDaoImpl implements BoardReviewDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<BoardReviewDto> getList(BoardReviewDto dto) {
	
		return session.selectList("boardreview.getList", dto);
	}

	@Override
	public void insert(BoardReviewDto dto) {
		
		session.insert("boardreview.insert", dto);
		
	}

	@Override
	public int getCount(BoardReviewDto dto) {
		
		return session.selectOne("boardreview.getCount", dto);
	}

	@Override
	public BoardReviewDto getData(BoardReviewDto dto) {
		
		return session.selectOne("boardreview.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("boardreview.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("boardreview.delete", num);
		
	}

	@Override
	public BoardReviewDto getData(int num) {
	
		return session.selectOne("boardreview.getData", num);
	}

	@Override
	public void update(BoardReviewDto dto) {
		
		session.update("boardreview.update", dto);
	
	}
	@Override
	   public List<BoardReviewDto> boardreviewlist() {
	      return session.selectList("boardreview.boardreviewlist");
	   }

}
