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

	public int getMemberListCount(String searchType, String searchKeyword) {
		return userMapper.getMemberListCount(searchType,searchKeyword);
	}

	public List<MemberVO> getUserList(int startRow, int listLimit, String searchType, String searchKeyword) {
		return userMapper.getUserList(startRow,listLimit,searchType,searchKeyword);
	}

	public void updateWithdraw(String memberId) {
		userMapper.updateWithdraw(memberId);
	}

	public void deleteMember(String memberId) {
		userMapper.deleteUser(memberId);
	}
}
