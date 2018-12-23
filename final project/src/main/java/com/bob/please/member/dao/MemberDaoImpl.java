package com.bob.please.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.please.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	//������ü�� ���� �ޱ� ���� 
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
		if(userid == null) { //���̵� Ȥ�� ��й�ȣ�� Ʋ���� null �̴�. 
			return false;
		}else { // null �� �ƴϸ� ��ȿ�� �����̴�. 
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
		//��й�ȣ�� �����ϱ� 
				session.update("member.updatePwd", dto);
	}
}