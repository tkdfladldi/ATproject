package com.spring.shop.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




@Controller
public class NoticeController {
	@Autowired
	NoticeDAO nDAO;
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(HttpServletRequest req,Model model) {
		req.setAttribute("content", "notice/notice.jsp");
		req.setAttribute("boardContent", "boardContent");
		return "home";
	}
	@RequestMapping(value = "/notice/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeList(HttpServletRequest req) {
		Map<String, Object> list = nDAO.boardListSel(req);
		req.setAttribute("boardContent", "boardContent");
		return list;
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.POST)
	@ResponseBody
	public int deleteBoard(HttpServletRequest req) {
		return nDAO.deleteBoard(req);
	}
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.GET)
	public String boardContent(HttpServletRequest req) {
		System.out.println(req.getParameter("Flag"));
		String flag = req.getParameter("Flag");
		if(flag.equals("ADD")) {
			System.out.println("작성페이지");
			return "notice/boardContent";
		}else if(flag.equals("Update")) {
			int bid = Integer.parseInt(req.getParameter("bid"));
			System.out.println("업데이트페이지 글넘버" + bid);
			req.setAttribute("board", nDAO.boardDetail(bid));
			return "notice/boardUpdate";
		}else {
			int bid = Integer.parseInt(req.getParameter("bid"));
			System.out.println("상세페이지 글넘버" + bid);
			req.setAttribute("board", nDAO.boardDetail(bid));
			return "notice/boardDetail";
		}
	}
	
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(HttpServletRequest req) {
		nDAO.boardUpdate(req);
		req.setAttribute("content", "notice/notice.jsp");
		req.setAttribute("Flag", "updateBoard");		
		return "home";
	}
	
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.POST)
	public String boardContentPost(HttpServletRequest req,RedirectAttributes rttr) {
		nDAO.boardContent(req);
		req.setAttribute("content", "notice/notice.jsp");
		req.setAttribute("boardContent", "boardContent");
		 rttr.addFlashAttribute("Flag","insertCont");
		return "redirect:/notice";
	}
	

}
