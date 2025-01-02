package com.itwillbs.project_dos.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);

}
