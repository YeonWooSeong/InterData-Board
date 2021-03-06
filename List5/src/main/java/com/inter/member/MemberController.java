package com.inter.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


@Controller
@SessionAttributes({"user"})
public class MemberController {
	private String keyword = null;
	private String column = null;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberServiceImpl service;
	@Autowired
	MemberVO member;
	@Autowired
	private EmailSender emailSender;
	int auth_Num = 0;
	
	
	
	/*로그인*/
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public void login(
			@RequestParam("id")String id,
 		    @RequestParam("password")String pw,
 		    HttpSession session,
		    Model model){
		
		logger.info("멤버컨트롤러 login() - 진입");
		logger.info("유저아이디 : {}", id);
		logger.info("유저 비밀번호: {}", pw);
		member = service.login(id, pw);
		if (member != null) {
			logger.info("로그인 성공!!!!!!!");
			session.setAttribute("user", member);
			model.addAttribute("member", member);
		} else {
			logger.info("로그인 실패!!!!!!!!");
		}
}
	/*id찾기*/
	@RequestMapping(value="/member/find_id", method=RequestMethod.POST)
	public void findId(
			@RequestParam("name")String name,
 		    @RequestParam("phoneNumber")String phoneNumber,
		    Model model){
		
		logger.info("멤버컨트롤러 findId() - 진입");
		logger.info("유저 이름 : {}", name);
		logger.info("유저 전화번호: {}", phoneNumber);
		member = service.findId(name, phoneNumber);
		if (member != null) {
			logger.info("정보 찾기 성공");
			model.addAttribute("member2", member);
		} else {
			logger.info("정보 안맞음");
		}
}
	
	/*pw찾기*/
	@RequestMapping("/member/find_pw")
	public void findPw(
			@RequestParam("id")String id,
			@RequestParam("email")String email,
			Model model){

		logger.info("멤버컨트롤러 findPw() - 진입");
		logger.info("유저 id : {}", id);
		logger.info("유저 pw: {}", email);
		member = service.findPw(id, email);
		if (member != null) {
			logger.info("pw 찾기 성공");
			model.addAttribute("member3", member);
		} else {
			logger.info("정보 안맞음(pw)");
		}
		
	}
	
	
	/*PW  email*/
	@RequestMapping("/member/pwEmail")
	public Model pwEmail (
			@RequestParam("id")String id,
			@RequestParam("e_mail")String e_mail,
 		    Model model) throws Exception {
			Email email = new Email();
		logger.info("멤버컨트롤러 joinAuth() - 진입");
		logger.info("넘어온 id는?"+id);
		logger.info("넘어온 email은?"+e_mail);
       
			auth_Num = (int) (Math.random()*999999) + 100000;
        	String reciver = e_mail;
        	String subject = "Interdata 비밀번호 찾기 메일인증.";
        	String content = "비밀번호 변경 인증 메일입니다.  "+id+"님, 인증번호 메일입니다.^ㅁ^     "+id+" 님의 비밀번호 찾기 인증번호는 "+auth_Num+"입니다.";
        	email.setReciver(reciver);
            email.setSubject(subject);
            email.setContent(content);
            emailSender.sendMail(email);
            model.addAttribute("success", "success");
	
        return model;
    }
	
	
	
	
	
	
	
	
	
	// 호ㅣ원가입
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public Model joinMember(
			@RequestBody MemberVO param,
			Model model
			){
		logger.info("멤버컨트롤러 joinMember() - 진입");
		logger.info("가입 아이디 : {}",param.getId());
		logger.info("가입 이메일 : {}",param.getEmail());
		logger.info("가입 패스워드 : {}",param.getPassword());
		logger.info("가입 이름 : {}",param.getName());
		logger.info("가입 전화번호 : {}",param.getPhone());
		logger.info("가입 인증번호 : {}",param.getConfirm_num());
		
		int confirm_Num = Integer.parseInt(param.getConfirm_num());
		if (auth_Num == confirm_Num) {
			member.setId(param.getId());
			member.setPassword(param.getPassword());
			member.setName(param.getName());
			member.setEmail(param.getEmail());
			member.setPhone(param.getPhone());
			int result = service.join(member);
			if (result == 1) {
				logger.info("회원가입 성공");
				model.addAttribute("result","success");
				model.addAttribute("name",member.getName());
			} else {
				logger.info("회원가입 실패");
				model.addAttribute("result", "fail");
			}
		} 
		else {
			model.addAttribute("result", "not_Agreement");
		}
		
		return model;
	}
	
	
	/*아이디  중복체크*/
	@RequestMapping("/member/checking_Id")
	public Model checking_Id(
			@RequestParam("id")String id,
 		    Model model) throws Exception {
		logger.info("멤버컨트롤러 checking_Id() - 진입");
		logger.info("넘어온 id는?"+id);
        MemberVO member_Id_check = service.selectById(id);
		if (member_Id_check != null) {
			model.addAttribute("id_fail", "id_fail");
		}
		else {
            model.addAttribute("id_Confirm", "id_Confirm");
		}
        return model;
    }
	
	/*로그아웃*/
	@RequestMapping("/member/logout")
	public String logout(Model model, SessionStatus status){
		logger.info("멤버컨트롤러 logout() - 진입");
		status.setComplete();
		logger.info("멤버컨트롤러 logout() - 로그아웃 완료");
		return "redirect:/"; /* 메인컨트롤러로 간다는 뜻 */ 
	}
	
	
	/*email 보내기*/
	@RequestMapping("/member/join_auth")
	public Model joinAuth (
			@RequestParam("id")String id,
			@RequestParam("e_mail")String e_mail,
 		    @RequestParam("name")String name, 
 		    Model model) throws Exception {
			Email email = new Email();
		logger.info("멤버컨트롤러 joinAuth() - 진입");
		logger.info("넘어온 id는?"+id);
		logger.info("넘어온 email은?"+e_mail);
		logger.info("넘어온 name은?"+name);
        MemberVO member_Id_check = service.selectById(id);
        MemberVO member_Email_check = service.selectByEmail(e_mail);
		if (member_Id_check != null) {
			model.addAttribute("id_fail", "id_fail");
		}
		else if (member_Email_check != null) {
			model.addAttribute("email_fail", "email_fail");
		}
		else {
			auth_Num = (int) (Math.random()*9999) + 1000;
        	String reciver = e_mail;
        	String subject = "Interdata 메일인증.";
        	String content = "환영합니다.  "+name+"님, 인증번호 메일입니다.^ㅁ^     "+name+" 님의 가입 인증번호는 "+auth_Num+"입니다.";
        	email.setReciver(reciver);
            email.setSubject(subject);
            email.setContent(content);
            emailSender.sendMail(email);
            model.addAttribute("success", "success");
		}
        return model;
    }
	

	/*내정보 수정*/
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public @ResponseBody Model update(
			@RequestBody MemberVO param,
			Model model
			) {
		logger.info("내정보 수정, Controller-update() 진입");
		member.setPassword(param.getPassword());
		member.setPhone(param.getPhone());
		member.setId(param.getId());
		int result = service.change(member);
		if (result != 0) {
			logger.info("회원정보 수정완료");
			model.addAttribute("result","success");
		} else {
			logger.info("회원정보 수정실패");
			model.addAttribute("result","fail");
		}
		return model;
	}
	
	/*회원탈퇴*/
	@RequestMapping("/member/delete")
	public Model delete(
			@RequestParam("delete_Id")String delete_Id,
			SessionStatus status,
			Model model
			){
		logger.info("멤버컨트롤러 delete() - 진입");
		logger.info("삭제할 id는?  "+delete_Id);
		int result = service.remove(delete_Id);
		if (result != 0) {
			logger.info("회원탈퇴 완료");
			status.setComplete();
			model.addAttribute("result","success");
		} else {
			logger.info("회원탈퇴 실패");
			model.addAttribute("result","fail");
		}
		return model;
	}

	
	@RequestMapping("/member/headerReload2")
	public String headerReload() {
		logger.info("headerReload()");
		System.out.println("headerReload()syso");
		return "global/header.jsp";
	}
	
}
