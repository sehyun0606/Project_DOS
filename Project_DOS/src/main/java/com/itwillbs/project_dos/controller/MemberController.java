package com.itwillbs.project_dos.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.project_dos.service.MemberService;
import com.itwillbs.project_dos.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@GetMapping("MemberLogin")
	public String MemberLoginForm() {
		
		return "member/member_login_form";
	}
	
	// 로그인 비즈니스로직
	@PostMapping("LoginAction")
	public String LoginAction(MemberVO member, HttpSession session, Model model, BCryptPasswordEncoder passwordEncoder) {
		
		MemberVO dbMember = service.getMember(member.getMember_id());
		
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) { // 로그인 실패
			// Model 객체에 msg 속성명으로 "로그인 실패!" 문자열 저장 후 result/fail.jsp 페이지로 포워딩
			model.addAttribute("msg", "로그인 실패!");
			return "result/result";
		} else if(dbMember.getMember_status() == 3) { // 로그인 성공이지만, 탈퇴 회원일 경우(member_status 값이 3)
			model.addAttribute("msg", "탈퇴한 회원입니다!");
			return "result/result";
		} else if(dbMember.getMember_email_auth().equals("N")) { // 로그인 성공이지만, 이메일 미인증 회원일 경우
			model.addAttribute("msg", "이메일 인증 후 로그인 가능합니다!");
			return "result/result";
		} else { // 로그인 성공
			// 세션 객체에 로그인에 성공한 아이디를 "sId" 속성명으로 저장
			// => HttpSession 객체의 setAttribute() 메서드 활용
			session.setAttribute("sId", member.getMember_id());
			// 세션 타이메 설정(ex. 금융권 사이트의 경우 10분(= 600초))
//			session.setMaxInactiveInterval(600);
			session.setMaxInactiveInterval(1800); // 1800초 = 30분(기본값이므로 생략 가능)
			
			// 메인페이지로 리다이렉트
			return "redirect:/";
		}
	}

	// 로그아웃 비즈니스 로직
	@GetMapping("MemberLogout")
	public String MemberLogout(HttpSession session) {
		// HttpSession 객체의 invalidate() 메서드 호출하여 세션 초기화
		session.invalidate();
		
		// 메인페이지로 리다이렉트
		return "main";
	}
	
	@GetMapping("MemberJoin")
	public String MemberJoinAgree() {
		return "member/join/agree_form2";
	}

	@GetMapping("SelectAgree")
	public String MemberSelectAgree() {
		return "member/join/select_agree";
	}

	@GetMapping("AgreeEmail")
	public String MemberAgreeEmail() {
		return "member/join/agree_email";
	}

	@GetMapping("MemberJoinForm")
	public String MemberJoinForm() {
		
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
			insertCount = service.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(insertCount > 0 ) {
			return "redirect:/success_page";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "result/result";
		}
		
	}
	
	
	@GetMapping("success_page")
	public String success_page() {
		return "member/join/success";
	}
	
	@GetMapping("FindLogin")
	public String FindLoginForm() {
		return "member/find/id_form";
	}
	
	@GetMapping("FindPasswd")
	public String FindPasswdForm() {
		return "member/find/passwd_form";
	}

	@GetMapping("FindSelectAgree")
	public String FindSelectAgreeId() {
		return "member/find/id_select_agree";
	}
	
	@GetMapping("FindAgreeEmail")
	public String FindAgreeEmailId() {
		return "member/find/id_agree_email";
	}
	
	@GetMapping("FindId")
	public String FindId() {
		return "member/find/id_success";
	}
	
	@GetMapping("FindPasswdSelectAgree")
	public String FindPasswdSelectAgree() {
		return "member/find/passwd_select_agree";
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
