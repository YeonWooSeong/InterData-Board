package com.inter.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inter.mapper.AdminMapper;
import com.inter.mapper.MemberMapper;
import com.inter.member.MemberService;
import com.inter.member.MemberServiceImpl;
import com.inter.member.MemberVO;

@Service
public class AdminServiceImpl implements AdminService{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private static AdminService instance = new AdminServiceImpl();
	@Autowired private SqlSession sqlSession;
	
	private AdminServiceImpl() {}
	
	public static AdminService getInstance(){
		return instance;
	}
	
	@Override
	public List<MemberVO> getMemberList() {
		AdminMapper adminDAO = sqlSession.getMapper(AdminMapper.class);
		return adminDAO.memberList();
	}
	
}
