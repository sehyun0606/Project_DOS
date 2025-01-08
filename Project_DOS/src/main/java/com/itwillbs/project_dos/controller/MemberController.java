package com.itwillbs.project_dos.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.project_dos.service.MailService;
import com.itwillbs.project_dos.service.MemberService;
import com.itwillbs.project_dos.vo.MailAuthInfo;
import com.itwillbs.project_dos.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberservice;
	@Autowired
	private MailService mailservice;
	@GetMapping("MemberLogin")
	public String MemberLoginForm() {
		
		return "member/member_login_form";
	}
	
	// 로그인 비즈니스로직
	@PostMapping("LoginAction")
	public String LoginAction(
			MemberVO member,
			String rememberId,
			HttpSession session,
			Model model,
			BCryptPasswordEncoder passwordEncoder,
			HttpServletResponse response) {
		
		MemberVO dbMember = memberservice.getMember(member.getMember_id());
		
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) { 
			model.addAttribute("msg", "로그인 실패!");
			return "result/result";
		} else if(dbMember.getMember_status() == 3) { 
			model.addAttribute("msg", "탈퇴한 회원입니다!");
			return "result/result";
		} else if(dbMember.getMember_email_auth().equals("N")) { 
			model.addAttribute("msg", "이메일 인증 후 로그인 가능합니다!");
			return "result/result";
		} else { 
			session.setAttribute("sId", member.getMember_id());
			session.setMaxInactiveInterval(1800);
			// --------- 쿠키 생성 코드 중복 제거 ----------
			// 생성/삭제 관계없이 쿠키값을 무조건 로그인 한 아이디로 설정
			Cookie cookie = new Cookie("rememberId", member.getMember_id());
			
			// 쿠키 만료기간은 저장 시 30일, 삭제 시 0 으로 설정
			if(rememberId != null) {
				cookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				cookie.setMaxAge(0);
			}
			
			response.addCookie(cookie);

			return "redirect:/";
		}
	}

	// 로그아웃 비즈니스 로직
	@GetMapping("MemberLogout")
	public String MemberLogout(HttpSession session) {
		
		session.invalidate();
		
		return "main";
	}
	
	@GetMapping("MemberJoin")
	public String MemberJoinAgree() {
		return "member/join/agree_form2";
	}

	@GetMapping("JoinForm")
	public String MemberSelectAgree() {
		return "member/join/form";
	}

	// 회원가입 비즈니스로직
	@PostMapping("JoinSuccess")
	public String JoinSuccess(MemberVO member, Model model, BCryptPasswordEncoder bpe) {
		
		String securedPasswd = bpe.encode(member.getMember_passwd());
		System.out.println("평문 : " + member.getMember_passwd());
		System.out.println("암호문 : " + securedPasswd);
		
		member.setMember_passwd(securedPasswd);
		
		int insertCount = 0;
		try {
			insertCount = memberservice.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(insertCount > 0 ) {
			return "redirect:/selectAgree";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "result/result";
		}
		
	}

	@GetMapping("selectAgree")
	public String selectAgree() {
		return "member/join/select_agree";
	}
	
	@GetMapping("AgreeEmail")
	public String MemberAgreeEmail() {
		return "member/join/agree_email";
	}

	@GetMapping("sendAuthMail")
	public String sendAuthMail(String email, Model model) {
		
		MemberVO member = memberservice.getMemberEmail(email);
		if(member != null) {
		// ----------------- 인증 메일 발송 작업 추가 --------------------
		// MailService - sendAuthMail() 메서드 호출하여 인증메일 발송 요청
		// => 파라미터 : MemberVO 객체   리턴타입 : MailAuthInfo(mailAuthInfo)
		MailAuthInfo mailAuthInfo = mailservice.sendAuthMail(member);
		System.out.println("member : " + member);
		System.out.println("인증메일 정보 : " + mailAuthInfo);
		// -------------------
		// MemberService - registMailAuthInfo() 메서드 호출하여 인증 정보 등록 요청
		// => 파라미터 : MailAuthInfo 객체   리턴타입 : void
		memberservice.registMailAuthInfo(mailAuthInfo);
		return "member/find/id_agree_email";
		} else {
			model.addAttribute("msg", "등록되지 않은 이메일 입니다!");
			return "result/result";
		}
	}
	
	@GetMapping("success_page")
	public String success_page() {
		return "member/join/success";
	}
	
	@GetMapping("FindId")
	public String FindIdForm() {
		return "member/find/id_form";
	}
	
	@GetMapping("FindPasswd")
	public String FindPasswdForm() {
		return "member/find/passwd_form";
	}

	@PostMapping("FindSelectAgree")
	public String FindSelectAgreeId(Model model, MemberVO member) {
		
		MemberVO findMember = memberservice.findIdMember(member.getMember_name(),member.getMember_phone());
		
		if(findMember == null) {
			model.addAttribute("msg", "회원 정보가 일치하지 않습니다!");
			return "result/result";
		} else {
			return "redirect:/FindAgreeEmail";
		}
	}
	
	@GetMapping("FindAgreeEmail")
	public String FindAgreeEmailId() {
		return "member/find/id_agree_email";
	}
	
	@GetMapping("FindIdSuccess")
	public String FindId() {
		return "member/find/id_success";
//		return null;
	}
	
	@PostMapping("FindPasswdSelectAgree")
	public String FindPasswdSelectAgree(Model model, MemberVO member) {
		
		MemberVO findPasswdMember = memberservice.findPasswdMember(member.getMember_id(), member.getMember_name(),member.getMember_phone());
		
		if(findPasswdMember == null) {
			model.addAttribute("msg", "회원 정보가 일치하지 않습니다!");
			return "result/result";
		} else {
			return "redirect:/FindPasswdAgreeEmail";
		}
		
	}
	
	@GetMapping("FindPasswdAgreeEmail")
	public String FindPasswdAgreeEmail() {
		return "member/find/passwd_agree_email";
	}

	@GetMapping("FindPswd")
	public String FindPswd() {
		return "member/find/passwd_success";
	}
	
	@GetMapping("MemberShip")
	public String MemberShipInfo() {
		return "membership/membership_info";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
