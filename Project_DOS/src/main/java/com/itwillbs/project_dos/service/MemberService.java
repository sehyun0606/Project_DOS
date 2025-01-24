package com.itwillbs.project_dos.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.MemberMapper;
import com.itwillbs.project_dos.vo.MailAuthInfo;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public int insertMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	public MemberVO getMember(String member_id) {
		return mapper.selectMember(member_id);
	}

	public MemberVO findIdMember(String member_name, String member_phone) {
		return mapper.findIdMember(member_name, member_phone);
	}

	public MemberVO findPasswdMember(String member_id, String member_name, String member_phone) {
		return mapper.findPasswdMember(member_id, member_name, member_phone);
	}

	public void registMailAuthInfo(MailAuthInfo mailAuthInfo) {
		// 기존 인증 정보 존재 여부 확인
		// MemberMapper - selectMailAuthInfo() 메서드 호출
		// => 파라미터 : MailAuthInfo 객체   리턴타입 : MailAuthInfo(dbMailAuthInfo)
		MailAuthInfo dbMailAuthInfo = mapper.selectMailAuthInfo(mailAuthInfo);
		
		// 인증정보 조회 결과 판별
		if(dbMailAuthInfo == null) { // 기존 인증정보 없음(인증메일 발송 이력 없음)
			// 새 인증정보 등록을 위해 insertMailAuthInfo() 메서드 호출하여 등록 작업 요청(INSERT)
			mapper.insertMailAuthInfo(mailAuthInfo);
		} else { // 기존 인증정보 있음(인증메일 발송 이력 있음)
			// 기존 인증정보 갱신 위해 updateMailAuthInfo() 메서드 호출하여 수정 작업 요청(UPDATE)
			mapper.updateMailAuthInfo(mailAuthInfo);
		}
	}

	public MemberVO getMemberEmail(String email) {
		return mapper.selectMemberEmail(email);
	}

	public String getAuthCode(String email) {
		return mapper.selectAuthCode(email);
	}

	public String getmailAuthInfo(Map<String, String> map) {
		return mapper.getMailAuthInfo(map);
	}

	public MemberVO getMemberId(Map<String, String> map) {
		return mapper.selectMemberId(map);
	}

	public MemberVO passwdModify(Map<String, String> map) {
		return mapper.updatePasswd(map);
	}

	public int modifyPasswd(Map<String, String> map) {
		return mapper.modifyPasswd(map);
	}

	public String getIdCheck(String id) {
		return mapper.getIdCheck(id);
	}

	public int updateMemberAuth(String member_email) {
		return mapper.updateMemberAuth(member_email);
	}

	public MemberVO paymentGetMember(String id) {
		return mapper.selectPaymentMember(id);
	}

	public int setPaymentMember(Map<String, String> map) {
		return mapper.insertPaymentMember(map);
	}

	public String getMembership(String id) {
		return mapper.selectMembership(id);
	}

	public int memberModify(Map<String, String> map) {
		return mapper.updateMember(map);
	}

	public int memberWithdraw(String id) {
		return mapper.deleteMember(id);
	}

	public void updateMembership(Map<String, String> map) {
		mapper.updateMembership(map);
	}






}
