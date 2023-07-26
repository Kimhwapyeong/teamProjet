package com.gogo.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private String searchField; // 寃��깋議곌굔
	private String searchWord;	// 寃��깋�뼱
	
	private int pageNo = 1;		// �슂泥� �럹�씠吏� 踰덊샇
	private int amount = 10;	// �럹�씠吏� �떦 寃뚯떆臾� �닔

	private int startNo = 1;
	private int endNo = 10;
	
	
	/// �븘�뱶媛믪씠 �꽆�뼱���꽌 媛앹껜 �엯�젰�맆 �븣 set 硫붿꽌�뱶瑜� �궗�슜�븳�떎.
	public void setPageNo(int pageNo) {
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount - 1);
		}
		
	}
	
	
}
