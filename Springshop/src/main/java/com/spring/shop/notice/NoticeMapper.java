package com.spring.shop.notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	
	public abstract void boardContent(NoticeVo Nvo);
	
	public abstract List<NoticeVo> boardListSel(Map<String, Object> param);
	
	public abstract int totalCnt();
	
	public abstract NoticeVo boardDetail(int bid);
	
	public abstract int deleteBoard(int bid);
	
	public abstract void boardUpdate(NoticeVo Nvo);
}
