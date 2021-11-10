package com.spring.shop.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@Autowired
	MemberDAO mDAO;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest req) {
		MemberVo memberVo = mDAO.login(req);
		if (memberVo != null) {
			req.getSession().setAttribute("member", memberVo);
			req.setAttribute("Flag", "loginY");
			req.setAttribute("content", "main.jsp");
			return "home";
		} else {
			req.setAttribute("Flag", "loginN");
			return "member/login";
		}
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logOut(HttpServletRequest req) {
		req.getSession().invalidate();
		req.setAttribute("content", "main.jsp");
		return "home";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "member/register";
	}

	@RequestMapping(value = "/register/idChk", method = RequestMethod.POST)
	@ResponseBody
	public int idChk(HttpServletRequest req) {

		int idChk = mDAO.fn_idChk(req);

		return idChk;
	}

	@RequestMapping(value = "/register/insertUser", method = RequestMethod.POST)
	public String insertUser(HttpServletRequest req) {
		int rst = mDAO.insertUser(req);
		if (rst >= 1) {
			req.setAttribute("Flag", "joinY");
			return "member/login";
		} else {
			req.setAttribute("Flag", "joinN");
			return "member/register";
		}
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDeletePost(HttpServletRequest req){
		MemberVo memberVo  = (MemberVo) req.getSession().getAttribute("member");
		
		if(memberVo.getUserId()!= null || memberVo.getUserId() != "") {
			mDAO.memberDelete(req);
			req.setAttribute("Flag", "deleteY");
			req.getSession().invalidate();
			return "home";
		}else {
			req.setAttribute("Flag", "deleteN");
			return "member/memberDelete";
			
		}
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete() {

		return "member/memberDelete";
	}

	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberUpdate() {

		return "member/memberUpdate";
	}
	
	@RequestMapping(value = "/memberPwUpdate", method = RequestMethod.GET)
	public String memberPwUpdate() {
			
		return "member/memberPwUpdate";
	}
	
	@RequestMapping(value = "/memberPwUpdate", method = RequestMethod.POST)
	public String memberPwUpdatePost(HttpServletRequest req) {
		
			mDAO.memberPwUpdate(req);
			req.setAttribute("Flag", "pwUpdateY");
			
		return "/home";
	}
	
	@RequestMapping(value = "/memberNEmailUpdate", method = RequestMethod.GET)
	public String memberNEmailUpdate() {
			
		return "member/memberNEmailUpdate";
	}
	
	@RequestMapping(value = "/memberNEmailUpdate", method = RequestMethod.POST)
	public String memberNEmailUpdatePOST(HttpServletRequest req) {
				mDAO.memberNEmailUpdate(req);
				req.setAttribute("Flag", "nameEmailUpdateY");
		return "/home";
	}

}
