package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.MemberVO;

@Mapper
public interface AdminUserMapper {

	int getMemberListCount(@Param("searchType") String searchType,@Param("searchKeyword") String searchKeyword);

	List<MemberVO> getUserList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,
								@Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	void updateWithdraw(String memberId);

	void deleteUser(String memberId);

}
