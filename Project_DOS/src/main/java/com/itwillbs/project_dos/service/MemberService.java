package com.itwillbs.project_dos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.MemberMapper;
import com.itwillbs.project_dos.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;

	public int insertMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	public MemberVO getMember(String member_id) {
		return mapper.selectMember(member_id);
	}

}
