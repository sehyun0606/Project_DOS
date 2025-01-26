package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminUserMapper;
import com.itwillbs.project_dos.vo.MemberVO;

@Service
public class AdminUserService {
	@Autowired
	private AdminUserMapper userMapper;

	public int getMemberListCount() {
		return userMapper.getMemberListCount();
	}

	public List<MemberVO> getUserList(int startRow, int listLimit) {
		return userMapper.getUserList(startRow,listLimit);
	}
}
