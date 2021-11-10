package com.spring.shop.notice;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.Paging;
import com.spring.shop.member.MemberVo;

@Service
public class NoticeDAO {
	
	@Autowired
	SqlSession ss;
	
	@Autowired
	Paging paging;
	
	public void boardContent(HttpServletRequest req) {
		NoticeVo Nvo = new NoticeVo();
		MemberVo login = (MemberVo) req.getSession().getAttribute("member");
		Nvo.setTitle(req.getParameter("title"));
		Nvo.setReg_id(login.getUserId());
		Nvo.setContent(req.getParameter("content"));
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH시mm분ss초"));
		Nvo.setReg_date(formatedNow);
		 ss.getMapper(NoticeMapper.class).boardContent(Nvo);
	}
	public Map<String, Object> boardListSel(HttpServletRequest req) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		int totalCnt = ss.getMapper(NoticeMapper.class).totalCnt();
		int pagePerCnt = Integer.parseInt(req.getParameter("pagePerCnt"));
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		
		Map<String, Object> p = paging.generatePagingParam(totalCnt, pagePerCnt, curPage);
		List<NoticeVo> list = ss.getMapper(NoticeMapper.class).boardListSel(p);
		result.put("list", list);
		result.put("paging", p);
		
		return result;
	}
	public NoticeVo boardDetail(int bid) {
		
		return ss.getMapper(NoticeMapper.class).boardDetail(bid);
		
	}
	public int deleteBoard(HttpServletRequest req) {
			int bid = Integer.parseInt(req.getParameter("bid"));
		
			return ss.getMapper(NoticeMapper.class).deleteBoard(bid);
	}
	public void boardUpdate(HttpServletRequest req) {
			NoticeVo nvo = new NoticeVo();
			nvo.setBid(Integer.parseInt(req.getParameter("bid")));
			nvo.setTitle(req.getParameter("title"));
			nvo.setContent(req.getParameter("content"));
		
		 ss.getMapper(NoticeMapper.class).boardUpdate(nvo);
		
	}
	
}
