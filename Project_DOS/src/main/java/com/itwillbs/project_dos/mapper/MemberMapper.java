package com.itwillbs.project_dos.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.MailAuthInfo;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;

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
	// 멤버 이메일 확인
	MemberVO selectMemberEmail(String email);
	// 멤버 이메일 코드 확인
	String selectAuthCode(String email);


	String getMailAuthInfo(Map<String, String> map);

	MemberVO selectMemberId(Map<String, String> map);

	MemberVO updatePasswd(Map<String, String> map);

	int modifyPasswd(Map<String, String> map);

	String getIdCheck(String id);

	int updateMemberAuth(String member_email);

	MemberVO selectPaymentMember(String id);

	int insertPaymentMember(Map<String, String> map);

	String selectMembership(String id);

	int updateMember(Map<String, String> map);

	int deleteMember(String id);

	void updateMembership(Map<String, String> map);





}
