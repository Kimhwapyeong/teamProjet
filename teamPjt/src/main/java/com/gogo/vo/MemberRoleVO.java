package com.gogo.vo;

import lombok.Data;

@Data  // member 권한
public class MemberRoleVO {

	private String memberId;
	private String role; // 권한
}
