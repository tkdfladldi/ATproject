package com.spring.shop.member;

public interface MemberMapper {
	public abstract int fn_idChk(MemberVo vo);
	
	public abstract int insertUser(MemberVo vo);
	
	public abstract MemberVo login(MemberVo vo);
	
	public abstract void memberDelete(MemberVo vo);
	
	public abstract int memberDeleteSel(MemberVo vo);
	
	public abstract int memberPwUpdate(MemberVo vo);
	
	public abstract int memberNEmailUpdate(MemberVo vo);
}
