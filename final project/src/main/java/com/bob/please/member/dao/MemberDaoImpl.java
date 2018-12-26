package com.bob.please.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.please.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	//의존객체를 주입 받기 위해
	@Autowired
	private SqlSession session;

	@Override
	public void insert(MemberDto dto) {
		/*
		 *  mapper namespace : users
		 *  sql id : insert
		 *  parameterType : UsersDto 
		 */
		session.insert("member.insert", dto);
	}

	@Override
	public boolean isValid(MemberDto dto) {
		/*
		 *  parameterType : UsersDto
		 *  resultType : String
		 */
		String userid=session.selectOne("member.getId", dto);
		if(userid == null) { //아이디 혹은 비밀번호가 틀리면 null 이다. 
			return false;
		}else { // null 이 아니면 유효한 정보이다. 
			return true; 
		}
	}

	@Override
	public boolean isExist(String inputId) {
		String selectedId=session.selectOne("member.isExist", inputId);
		if(selectedId==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public MemberDto getData(String userid) {
		return session.selectOne("member.getData", userid);
	}

	@Override
	public void update(MemberDto dto) {
		session.update("member.update", dto);
		
	}

	@Override
	public void delete(String userid) {
		session.delete("member.delete", userid);
		
	}

	@Override
	public String getPwdHash(String userid) {
		return session.selectOne("member.getPwd", userid);
	}

	@Override
	public void updatePwd(MemberDto dto) {
		//비밀번호만 수정하기 
				session.update("member.updatePwd", dto);
	}

//	@Override
//	public void search(String title) {
//		session.selectList
//		
//	}
}