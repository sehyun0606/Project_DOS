package com.itwillbs.project_dos.controller;

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
