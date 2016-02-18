package com.inter.app;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inter.app.ArticleVO;
import com.inter.global.Command;
import com.inter.global.CommandFactory;
import com.inter.app.ArticleController;
import com.inter.app.ArticleServiceImpl;


@Controller
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	private String keyword = null;
	private String column = null;
	@Autowired ArticleVO article;
	@Autowired ArticleServiceImpl articleService;
	
	@RequestMapping(value = "/article/List5", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("ArticleController()");
		return "inter/list5.tiles";
	}
	
	
	
	
	
	@RequestMapping("/article/list/{pageNo}")
	public @ResponseBody Map<String, Object> boardList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 15;
		int groupSize = 10;
		int count = articleService.count();
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		
		logger.info("boardList() inter 진입");
		logger.info("넘어온 페이지 번호 : {}", pageNo);
		List<ArticleVO> list = articleService.getList(CommandFactory.list(pageNo));
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("count", count);
		result.put("list", list);
		result.put("totalPage", totalPage);
		result.put("pageNo", pageNumber);
		result.put("startPage", startPage);
		result.put("lastPage", lastPage);
		result.put("groupSize", groupSize);
		return result;
	}
	
	@RequestMapping("/article/board_search/{pageNo}")
	public Map<String, Object> boardSearch(
			@PathVariable("pageNo")String pageNo,
			@RequestParam("keyword")String keyword,
			@RequestParam("column")String column,
			Model model){
		logger.info("memberSearch() 진입");
		logger.info("넘어온 페이지 번호 : {}", pageNo);
		logger.info("넘어온 컬럼 : {}", column);
		logger.info("넘어온  검색어 : {}", keyword);
		if(keyword != "")
			this.keyword = keyword;
		if(column != "")
			this.column = column;
		
		int pageNumber = Integer.parseInt(pageNo);
		int pageSize = 15;
		int groupSize = 10;
		Command command = CommandFactory.seach(this.column, this.keyword, pageNo);
		int count = articleService.countByKeyword(command);
		int totalPage = count/pageSize;
		if (count%pageSize != 0) {
			totalPage += 1;
		}
		int startPage = pageNumber - ((pageNumber-1) % groupSize);
		int lastPage = startPage + groupSize -1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		command.setStart(command.getStart()-1);
		List<ArticleVO> list = articleService.searchByKeyword(command);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("pageNo", pageNo);
		result.put("count", count);
		result.put("startPage", startPage);
		result.put("lastPage", lastPage);
		result.put("groupSize", groupSize);
		result.put("totalPage", totalPage);
		return result;
	}
	
	@RequestMapping("/article/member_search/{pageNo}")
	public String memberSearch(
			@PathVariable("pageNo")String pageNo,
			@RequestParam("keyword")String keyword,
			@RequestParam("column")String column,
			Model model){
		logger.info("memberSearch() 진입");
		logger.info("넘어온 페이지 번호 : {}", pageNo);
		logger.info("넘어온 컬럼 : {}", column);
		logger.info("넘어온  검색어 : {}", keyword);
		Command command = CommandFactory.seach(column, keyword, pageNo);
		List<ArticleVO> list = articleService.searchByKeyword(command);
		int count = articleService.countByKeyword(command);
		logger.info("리스트 결과 : {}", list.size());
		model.addAttribute("member", list);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("count", count);
		return "article/boardSearch.tiles";
	}
	
	@RequestMapping(value="/article/write", method=RequestMethod.POST)
	public void write(
			Model model,
			String title,
			String content,
			String id
			) {
		logger.info("write() 진입");
		/*System.out.println("title : " + title);
		System.out.println("content : " + content);*/
		article.setUsrSubject(title);
		article.setUsrContent(content);
		article.setUsrName(id);
		articleService.write(article);
	}
	
	@RequestMapping(value="/article/save", method=RequestMethod.POST)
	public void save(
			@RequestBody ArticleVO article
			) {
		logger.info("save() 진입");
		articleService.write(article);
	}
	
	@RequestMapping("/article/read")
	public void read(
			Model model,
			String code,
			String myself
			) {
		
		logger.info("read() 진입");
		
			logger.info("이전 조회수 {}", article.getUsrRefer());
			article.setUsrRefer(article.getUsrRefer()+1);
			logger.info("갱신된 조회수 {}", article.getUsrRefer());
			Map<String, Integer> data = new HashMap<String, Integer>();
			data.put("rcdNo", Integer.parseInt(code));
			data.put("usrRefer", article.getUsrRefer());
			articleService.updateRefer(data);
		
		article = articleService.selectById(Integer.parseInt(code));
		List<ArticleVO> reply = articleService.selectByGrp(Integer.parseInt(code));
		model.addAttribute("writing", article);
		model.addAttribute("reply", reply);
	}
	
	@RequestMapping("/article/reply")
	public void reply(
			Model model,
			String id,
			String code,
			String content
			) {
		logger.info("아이디 : {}", id);
		logger.info("글번호 : {}", code);
		logger.info("댓글내용 : {}", content);
		article.setGrpNo(Integer.parseInt(code));
		article.setUsrName(id);
		article.setUsrContent(content);
		articleService.reply(article);
		model.addAttribute("reply", articleService.selectByGrp(Integer.parseInt(code)));
	}
	@RequestMapping("/article/remove_reply")
	public void removeReply(
			Model model,
			String code, String reply) {
		articleService.delete(Integer.parseInt(reply));
		model.addAttribute("reply", articleService.selectByGrp(Integer.parseInt(code)));
	}
	
	@RequestMapping("/article/delete")
	public void deleteWrite(String code){
		logger.info("ArticleController() Delete");
		logger.info("번호:  {}", code);
		articleService.delete(Integer.parseInt(code));
	}
	
	@RequestMapping("/article/update")
	public @ResponseBody Model update(
			@RequestBody ArticleVO param,
			Model model
			){
		logger.info("정보 수정, Controller-update() 진입");
		article.setUsrSubject(param.getUsrSubject());
		article.setUsrContent(param.getUsrContent());
		int result = articleService.update(article);
		if (result != 0) {
			logger.info("정보 수정완료");
			model.addAttribute("result","success");
		} else {
			logger.info("정보 수정실패");
			model.addAttribute("result","fail");
		}
				return model;
	}
	
	
	@RequestMapping("/article/equipRead")
	public void equipRead(
			Model model,
			String code,
			String myself
			
			) {
		logger.info("equip() 진입");
		article = articleService.selectById(Integer.parseInt(code));
	
		List<ArticleVO> reply = articleService.selectByGrp(Integer.parseInt(code));
		model.addAttribute("writing", article);
		model.addAttribute("reply", reply);
	}
	
	
	@RequestMapping(value="/article/write2", method=RequestMethod.POST)
	public void equipWrite(
			Model model,
			String title,
			String content
		
			) {
		logger.info("equipWrite() 진입");
		article.setUsrSubject(title);
		article.setUsrContent(content);
		articleService.write(article);
	}
	
}
