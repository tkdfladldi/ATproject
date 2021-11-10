package com.spring.shop.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	@Autowired
	SqlSession ss;
	
	public int fn_idChk(HttpServletRequest req) {
		MemberVo vo = new MemberVo();
		vo.setUserId(req.getParameter("userId"));
		int rst = ss.getMapper(MemberMapper.class).fn_idChk(vo);
		return rst;
	}
	public int insertUser(HttpServletRequest req) {
		
		MemberVo vo = new MemberVo();
		vo.setUserId(req.getParameter("userId"));
		vo.setUserPw(req.getParameter("userPw"));
		vo.setUserName(req.getParameter("userName"));
		vo.setUserEmail(req.getParameter("userEmail"));
		
		 return ss.getMapper(MemberMapper.class).insertUser(vo);		
	}
	
		public MemberVo login(HttpServletRequest req) {
		
		MemberVo vo = new MemberVo();
		vo.setUserId(req.getParameter("userId"));
		vo.setUserPw(req.getParameter("userPw"));
		
		 return ss.getMapper(MemberMapper.class).login(vo);		
	}
		
		public void memberDelete(HttpServletRequest req) {
			MemberVo vo = new MemberVo();
			vo = (MemberVo) req.getSession().getAttribute("member");
			ss.getMapper(MemberMapper.class).memberDelete(vo);		
		}
		public void memberPwUpdate(HttpServletRequest req) {
			MemberVo vo = new MemberVo();
			vo = (MemberVo) req.getSession().getAttribute("member");
			vo.setUserPw(req.getParameter("userPw"));
			ss.getMapper(MemberMapper.class).memberPwUpdate(vo);		
		}	
		public void memberNEmailUpdate(HttpServletRequest req) {
			MemberVo vo = new MemberVo();
			vo = (MemberVo) req.getSession().getAttribute("member");
			vo.setUserName(req.getParameter("userName"));
			vo.setUserEmail(req.getParameter("userEmail"));
			ss.getMapper(MemberMapper.class).memberNEmailUpdate(vo);		
		}	
		
		
}
