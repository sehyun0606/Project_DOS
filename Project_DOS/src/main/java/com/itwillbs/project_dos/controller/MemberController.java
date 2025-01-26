package com.itwillbs.project_dos.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.project_dos.service.MailService;
import com.itwillbs.project_dos.service.MemberService;
import com.itwillbs.project_dos.vo.MailAuthInfo;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;

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
			BCryptPasswordEncoder bpe,
			HttpServletResponse response) {
		
		MemberVO dbMember = memberservice.getMember(member.getMember_id());
		
		if(dbMember == null) { 
			model.addAttribute("msg", "회원 정보가 없습니다!");
			return "result/result";
			
		} else if(!bpe.matches(member.getMember_passwd(), dbMember.getMember_passwd())) {
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
	
	// 로그인 중복확인 로직
	@GetMapping("MemberCheckId")
	@ResponseBody
	public String MemberCheckId(String id) {
		String responseData = "";
		
		String memberId = memberservice.getIdCheck(id);
		if(id.equals(memberId)) {
			responseData = "true";
			return responseData;
		} else {
			return responseData;
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
			return "redirect:/AgreeEmail";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "result/result";
		}
		
	}

	@GetMapping("AgreeEmail")
	public String MemberAgreeEmail() {
		return "member/join/agree_email";
	}
	
	// 메일 발송 비지니스 로직
	@GetMapping("sendAuthMail")
	@ResponseBody
	public String sendAuthMail(String email, Model model) {
		String responseData = "false";
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
			responseData = "true";
			return responseData;
		} else {
			return responseData;
		}
	}
	
	// 인증코드 체크 비즈니스 로직
	@GetMapping("authCodeCheck")
	@ResponseBody
	public String authCodeCheck(String code, String email) {
		String responseData = "";
		String CodeInfo = memberservice.getAuthCode(email);
		System.out.println("code : " + code);
		try {
			if(code.equals(CodeInfo)) {
				System.out.println("일치함");
				responseData = "true";
			} else {
				System.out.println("일치하지 않음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseData;
	}
	
	// 회원가입 성공 페이지
	@GetMapping("successPage")
	public String success_page(String member_email) {
		int updateCount = memberservice.updateMemberAuth(member_email);
		
		
		return "member/join/success";
	}
	
	// 회원 정보 수정폼 이동
	@GetMapping("MemberModify")
	public String MemberModify(HttpSession session, Model model, String memberId) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/result";
		}else if(id.equals("admin")) {
			id = memberId;
		}
		MemberVO member = memberservice.getMember(id);
		model.addAttribute("member", member);
		
		return "member/member_modify_form";
	}
	
	// 회원 정보 수정 비즈니스 로직
	@PostMapping("SuccessModify")
	public String SuccessModify(Model model,HttpSession session ,BCryptPasswordEncoder bpe, @RequestParam Map<String, String> map) {
		
		if(!map.get("passwd").equals("")) {
			// 새 패스워드 암호화해서 다시 덮어쓰기
			map.put("passwd", bpe.encode(map.get("passwd")));
			System.out.println("암호화 된 새 비밀번호 : " + map.get("passwd"));
		}
		
		int updateCount = memberservice.memberModify(map);
		
		if(updateCount < 0) {
			model.addAttribute("msg", "회원 정보 수정 실패!");
		}
		
		if(session.getAttribute("sId").equals("admin")) {
			return "redirect:/AdminUser";
		}
		
		return "redirect:/Mypage";
	}
	
	@GetMapping("MemberWithdraw")
	public String MemberWithdraw(HttpSession session, Model model, String memberId) {
		String id = (String)session.getAttribute("sId");
		
		if(id.equals("admin")) {
			id = memberId;
			memberservice.memberWithdraw(id);
			return "redirect:/AdminUser";
		}
		
		int updateCount = memberservice.memberWithdraw(id);
		if(updateCount > 0) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 성공! 메인페이지로 이동합니다");
			model.addAttribute("targetURL", "./");
			return "result/result";
			
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "result/result";
		}
		
	}
	
	
	// 아이디 찾기 폼 이동 
	@GetMapping("FindId")
	public String FindIdForm() {
		return "member/find/id_form";
	}
	
	// 비밀번호 찾기 폼 이동
	@GetMapping("FindPasswd")
	public String FindPasswdForm() {
		return "member/find/passwd_form";
	}

	//아이디 찾기 폼 로직
	@PostMapping("FindIdSelectAgree")
	public String FindIdSelectAgree(Model model, MemberVO member) {
		
		MemberVO findMember = memberservice.findIdMember(member.getMember_name(),member.getMember_phone());
		
		if(findMember == null) {
			model.addAttribute("msg", "회원 정보가 일치하지 않습니다!");
			return "result/result";
		} else {
			return "redirect:/FindAgreeEmail";
		}
	}
	
//	@GetMapping("FindIdSelectForm")
//	public String FindIdSelectForm() {
//		return "member/find/id_select_agree";
//	}
	
	@GetMapping("FindAgreeEmail")
	public String FindAgreeEmailId() {
		return "member/find/id_agree_email";
	}
	
	//아이디 찾기 성공 비즈니스 로직
	@GetMapping("FindIdSuccess")
	public String FindIdSucces(@RequestParam Map<String, String> map, Model model) {
		MemberVO member = memberservice.getMemberId(map);
		String mailAuthCodeInfo = memberservice.getmailAuthInfo(map);
		if(!map.get("emailAuthCode").equals(mailAuthCodeInfo)) {
			model.addAttribute("msg", "정보가 일치하지 않습니다!");
			return "result/result";
		} else {
			System.out.println("일치 합니다!");
			model.addAttribute("member", member);
			return "member/find/id_success";
		}
	}
	
	// 비밀번호 찾기 폼 로직
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

	@GetMapping("FindPasswdSuccess")
	public String FindPasswdSuccess(@RequestParam Map<String, String> map, Model model) {
		String mailAuthCodeInfo = memberservice.getmailAuthInfo(map);
		
		if(!map.get("emailAuthCode").equals(mailAuthCodeInfo)) {
			model.addAttribute("msg", "정보가 일치하지 않습니다!");
			return "result/result";
		} else {
			System.out.println("일치 합니다!");
			model.addAttribute("email", map.get("member_email"));
//			return "member/find/passwd_modify";
			return "redirect:/changePasswd";
		}
	}
	
	@GetMapping("changePasswd")
	public String changePasswd() {
		return "member/find/passwd_modify";
	}
	
	@PostMapping("PasswdModify")
	public String PasswdModify(@RequestParam Map<String, String> map, Model model, BCryptPasswordEncoder bpe, MemberVO member) {
		
		String securedPasswd = bpe.encode(map.get("newPasswd"));
		System.out.println("평문 : " + map.get("newPasswd"));
		System.out.println("암호문 : " + securedPasswd);
		map.put("newPasswd", securedPasswd);
		
		int updatePasswd = memberservice.modifyPasswd(map);
		
		System.out.println("새로 입력한 비밀번호 : " + updatePasswd);
		if(updatePasswd > 0) {
			model.addAttribute("msg", "비밀번호가 변경되었습니다 로그인 페이지로 이동합니다.");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/result";
		} else {
			model.addAttribute("msg", "비밀번호 수정 실패!");
			return "result/result";
		}
		
	}
	


	
	@GetMapping("MemberShip")
	public String MemberShipInfo() {
		return "membership/membership_info";
	}
	
	// 결제를 위한 고객 정보 들고으는 비즈니스 로직
	@ResponseBody
	@GetMapping("paymentGetMember")
	public String paymentGetMember(String id) {
		
		String responseData = "";
		
		MemberVO member = memberservice.paymentGetMember(id);
		String payment = memberservice.getMembership(id);
//		System.out.println("조회 결과 : " + member);
		if(member != null && payment == null) {
//			model.addAttribute("member", member);
//			responseData = "true";
			JSONObject json = new JSONObject(member);
			responseData = json.toString();
			System.out.println(responseData);
		} 
		
		return responseData;
	}
	
	// 결제 성공 후 고객 데이터 저장 비즈니스 로직
	@ResponseBody
	@GetMapping("pamentSetMember")
	public String pamentSetMember(@RequestParam Map<String, String> map) {
		String result = "";
		int insertCount = memberservice.setPaymentMember(map);

		if(insertCount > 0)	{
			memberservice.updateMembership(map);
			result = "true";
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
