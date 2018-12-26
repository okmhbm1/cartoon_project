package com.bob.please.member.dao;

import com.bob.please.member.dto.MemberDto;

public interface MemberDao {
	//ȸ�������� DB �� INSERT �ϴ� �޼ҵ�
	public void insert(MemberDto dto);
	//��ȿ�� �������� �������ִ� �޼ҵ�
	public boolean isValid(MemberDto dto);
	//���ڷ� ���޵� ���̵� �̹� DB�� �����ϴ��� ���θ� �����ϴ� �޼ҵ�
	public boolean isExist(String inputId);
	//���ڷ� ���޵� ���̵� �ش��ϴ� ���������� �������ִ� �޼ҵ�
	public MemberDto getData(String id);
	//ȸ�������� �����ݿ��ϴ� �޼ҵ�
	public void update(MemberDto dto);
	//ȸ�������� �����ϴ� �޼ҵ� 
	public void delete(String id);
	//���̵� �ش��ϴ� ��й�ȣ hash ���� �������ִ� �޼ҵ�
	public String getPwdHash(String id);
	//��й�ȣ �����ϴ� �޼ҵ�
	public void updatePwd(MemberDto dto);
	
	//public void search(String title);
}