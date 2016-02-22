package com.inter.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.inter.app.ArticleServiceImpl;
import com.inter.app.ArticleVO;
import com.inter.member.MemberServiceImpl;
import com.inter.member.MemberVO;


@Controller
@SessionAttributes("admin")
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired MemberVO member;
	@Autowired ArticleVO article;
	@Autowired MemberServiceImpl memberService;
	@Autowired AdminServiceImpl adminService;
	@Autowired ArticleServiceImpl articleService;
	
	
	@RequestMapping("")
	public String home(){
		logger.info("AdminController-login() 진입");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		return "admin/admin/login.tiles";
	}
	
	
	
	@RequestMapping("/main")
	public String main(){
		logger.info("AdminController-home() 진입");
		return "admin/admin/main.tiles";
	}
	
	@RequestMapping("/member")
	public String member(Model model){
		logger.info("AdminController-home() 진입");
		List<MemberVO> members = adminService.getMemberList();
		model.addAttribute("list", members);
		return "admin/admin/member.tiles";
	}
	

	
	@RequestMapping("/chart")
	public String chart(){
		logger.info("AdminController-home() 진입");
		return "admin/admin/chart.tiles";
	}
	
	@RequestMapping("/board")
	public String board(Model model){
		logger.info("AdminController-home() 진입");
		List<ArticleVO> articles = articleService.getAllList();
		model.addAttribute("list", articles);
		return "admin/admin/board.tiles";
	}
	
	
	
	@RequestMapping("/member_list")
	public void memberList(
			Model model
			){
		List<MemberVO> members = adminService.getMemberList();
		model.addAttribute("list", members);
	}
	
	@RequestMapping("/member_profile")
	public Model memberProfile(
			String id,Model model
			){
		logger.info("개인 프로필 진입");
		logger.info("가져온 아이디{}",id);
		member = memberService.selectById(id);
		model.addAttribute("member", member);
		return model;
		
	}
	
	
	@RequestMapping("/insert")
	public void insert(
		@RequestParam("id") String id,
		@RequestParam("password") String password,
		String email, String phone, Model model){
		logger.info("insert 진입");
		logger.info("id{}",id);
		logger.info("password{}",password);
		logger.info("email{}",email);
		logger.info("phone{}",phone);
		member = memberService.selectById(id);
		member.setPassword(password);
		member.setEmail(email);
		member.setPhone(phone);
		int result = memberService.change(member);
		model.addAttribute("result", id + " 님의 정보수정을 완료했습니다.");
	}
	
	@RequestMapping("/delete")
	public Model delete(String id,Model model){
		memberService.remove(id);
		model.addAttribute("result",id+"님의 탈퇴를 완료했습니다.");
		return model;
	}
	
	@RequestMapping("/logout")
	public void logout(SessionStatus status){
		status.setComplete();
	}
	
	@RequestMapping("/login")
	public void login(
			String id,
			String password,
			Model model
			) {
		System.out.println("아이디 : " + id );
		System.out.println("비번 : " + password );
		member = memberService.login(id, password);
		if (member == null) {
			System.out.println("로그인 실패");
			model.addAttribute("result", "fail");
		} else {
			if (member.getId().equals("choa")) {
				System.out.println("로그인 성공");
				model.addAttribute("admin", member);
				model.addAttribute("result", "success");
			} else {
				System.out.println("로그인 실패");
				model.addAttribute("result", "fail");
			}
		}
	}
	
	@RequestMapping("/notice")
	public String notice() {
		return "admin/notice.jsp";
	}
	
	@RequestMapping("/write_notice")
	public void writeNotice(
			String title,
			String content
			) {
		article.setUsrSubject(title);
		article.setUsrContent(content);
		article.setUsrName("관리자");
		articleService.write(article);
	}
	
	@RequestMapping("/delete_writing")
	public void deleteWriting(String code) {
		articleService.delete(Integer.parseInt(code));
	}
	
}