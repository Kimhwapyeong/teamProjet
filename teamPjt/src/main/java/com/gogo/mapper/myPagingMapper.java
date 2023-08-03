package com.gogo.mapper;

import com.gogo.vo.Criteria;

public interface myPagingMapper {
	// ad / ho / us
	// stay / mem / qa
	
	// ▶▶▶  admin ▶▶▶
	
	
	// ▶▶▶  host ▶▶▶
	// 호스트 - 숙소 관리 페이징
	public int hostayCnt(Criteria cri, String memberId);
	
	
	// ▶▶▶  user ▶▶▶
}
