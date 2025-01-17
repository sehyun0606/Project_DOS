package com.itwillbs.project_dos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.MyPageMapper;
import com.itwillbs.project_dos.vo.MemberVO;

@Service
public class MyPageService {

	@Autowired 
	private MyPageMapper myPageMapper;

	public MemberVO getMyProfile(String id) {
		return myPageMapper.selectmtProfile(id);
	}
}
