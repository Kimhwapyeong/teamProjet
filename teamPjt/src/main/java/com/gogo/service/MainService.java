package com.gogo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gogo.vo.RoomOptionVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Service
public interface MainService {

	public int insert(StayVO vo);
	
	public int insertRoom(RoomVO vo, RoomOptionVO optionVO
					,List<MultipartFile> files, String stayNo);

	public int roomFileupload(List<MultipartFile> files
					,String stayNo, String roomNo) ;
	
	public int insertStay(StayVO vo, List<MultipartFile> files);

	public int stayFileupload(List<MultipartFile> files
						, String stayNo, String roomNo);


}
