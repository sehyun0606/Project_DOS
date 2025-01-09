package com.itwillbs.project_dos.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.MailAuthInfo;
import com.itwillbs.project_dos.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);

	MemberVO selectMember(String member_id);

	MemberVO findIdMember(@Param("member_name") String member_name, @Param("member_phone") String member_phone);

	MemberVO findPasswdMember(@Param("member_id") String member_id, @Param("member_name") String member_name, @Param("member_phone") String member_phone);

	// 메일 인증 정보 조회
	MailAuthInfo selectMailAuthInfo(MailAuthInfo mailAuthInfo);
	// 신규 인증 정보 등록
	void insertMailAuthInfo(MailAuthInfo mailAuthInfo);
	// 기존 인증 정보 수정
	void updateMailAuthInfo(MailAuthInfo mailAuthInfo);

	MemberVO selectMemberEmail(String email);

}
